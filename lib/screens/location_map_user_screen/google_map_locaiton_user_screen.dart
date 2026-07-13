import 'dart:async';

import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:nabny/screens/location_map_user_screen/google_map_locaiton_user_controller.dart';

import 'package:nabny/screens/home_main_screen/home_main_screen.dart';

import '../../core/constant/Themes.dart';
import '../../core/widget/custom_circler_progress_indicator_widget.dart';

class GoogleMapLocationUserScreen extends StatefulWidget {
  final bool required;
  const GoogleMapLocationUserScreen({Key? key, this.required = false}) : super(key: key);

  @override
  _GoogleMapLocationUserScreenState createState() => _GoogleMapLocationUserScreenState();
}

class _GoogleMapLocationUserScreenState extends State<GoogleMapLocationUserScreen> {
  LatLng? latlong;
  late CameraPosition _cameraPosition;
  GoogleMapController? _controller;
  final Set<Marker> _markers = {};

  // ── حالات UI ──
  bool _isLocating = false; // جاري البحث عن الموقع
  String _selectedAddress = 'قم بتحديد موقعك من الخريطة';

  @override
  void initState() {
    super.initState();
    // موقع افتراضي حتى يتم جلب الموقع الحقيقي أو تحديد موقع يدوياً
    _cameraPosition = const CameraPosition(
      target: LatLng(24.7136, 46.6753),
      zoom: 10.0,
    );

    // نحاول جلب الموقع بصمت دون حجب الشاشة إذا رفض
    _silentlyTryGetLocation();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('تحديد الموقع', style: TextStyle(fontFamily: 'Tajawal', fontSize: 18)),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            if (Navigator.canPop(context)) {
              Get.back();
            } else {
              Get.offAll(() => HomeMainScreen(valueBack: ''));
            }
          },
        ),
        actions: widget.required
            ? null
            : [
                TextButton(
                  onPressed: () {
                    Get.find<GetMyLocationController>().updateMyLocationFromMap(
                      null,
                      null,
                      'الرياض، المملكة العربية السعودية',
                    );
                  },
                  child: const Text(
                    'تخطي',
                    style: TextStyle(
                      color: Themes.ColorApp1,
                      fontFamily: 'Tajawal',
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0,
      ),
      body: SafeArea(
        child: GetBuilder<GetMyLocationController>(
          init: GetMyLocationController(),
          builder: (mapController) => Stack(
            children: [
              // ── الخريطة تعمل دائماً دون حجب ──
              GoogleMap(
                mapType: MapType.normal,
                initialCameraPosition: _cameraPosition,
                onMapCreated: (GoogleMapController controller) {
                  _controller = controller;
                },
                onTap: (LatLng tappedPoint) async {
                  _updateAddressFromCoordinates(tappedPoint);
                },
                markers: _markers,
                myLocationEnabled: true, // تظهر نقطة المستخدم الزرقاء فقط لو سمح بالصلاحية
                myLocationButtonEnabled: false,
              ),

              // ── زر الـ GPS الذكي ──
              Positioned(
                top: 15,
                right: 15,
                child: FloatingActionButton(
                  heroTag: 'gps_btn',
                  backgroundColor: Themes.ColorApp1,
                  onPressed: _isLocating ? null : handleGpsButtonPress,
                  child: _isLocating
                      ? const SizedBox(
                          width: 24,
                          height: 24,
                          child: CircularProgressIndicator(
                            color: Colors.white,
                            strokeWidth: 2,
                          ),
                        )
                      : const Icon(Icons.gps_fixed_outlined, color: Colors.white),
                ),
              ),

              // ── باقة الحفظ في الأسفل (تعمل دائماً للتحديد اليدوي) ──
              Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  width: Get.width,
                  padding: const EdgeInsets.fromLTRB(40, 12, 40, 20),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.95),
                    borderRadius: const BorderRadius.vertical(top: Radius.circular(22)),
                    boxShadow: const [BoxShadow(color: Colors.black12, blurRadius: 12)],
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(bottom: 15),
                        child: Row(
                          children: [
                            Icon(Icons.location_on, color: Themes.ColorApp1, size: 20),
                            const SizedBox(width: 8),
                            Expanded(
                              child: Text(
                                _selectedAddress,
                                style: const TextStyle(
                                  color: Colors.black87,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                  fontFamily: 'Tajawal',
                                ),
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ],
                        ),
                      ),
                      if (mapController.isLoading)
                        Padding(
                          padding: const EdgeInsets.only(bottom: 8),
                          child: CirclerProgressIndicatorWidget(isLoading: true),
                        ),
                      MaterialButton(
                        height: 50,
                        minWidth: double.infinity,
                        color: Themes.ColorApp1,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(35),
                        ),
                        onPressed: mapController.isLoading
                            ? null
                            : () async {
                                 if (latlong == null) {
                                  if (widget.required) {
                                    CustomFlutterToast('يرجى تحديد الموقع على الخريطة أولاً');
                                    return;
                                  }
                                  Get.find<GetMyLocationController>().updateMyLocationFromMap(
                                    null,
                                    null,
                                    'الرياض، المملكة العربية السعودية',
                                  );
                                  return;
                                }

                                // ── في حال قام المستخدم بتحديد موقع فعلي على الخريطة ──
                                String fallbackName = 'موقع محدد (${latlong!.latitude.toStringAsFixed(4)}, ${latlong!.longitude.toStringAsFixed(4)})';

                                try {
                                  List<Placemark> places = await placemarkFromCoordinates(
                                    latlong!.latitude,
                                    latlong!.longitude,
                                  ).timeout(const Duration(seconds: 3));

                                  if (places.isNotEmpty) {
                                    final p = places[0];
                                    fallbackName = '${p.country ?? ''} - ${p.locality ?? ''} - ${p.street ?? ''}';
                                  }
                                } catch (e) {
                                  print('Geocoding failed');
                                }

                                // حفظ الموقع الفعلي المحدد
                                Get.find<GetMyLocationController>().updateMyLocationFromMap(
                                  latlong!.latitude,
                                  latlong!.longitude,
                                  fallbackName,
                                );
                                Get.back();
                              },
                        child: Text(
                          'save_location'.tr,
                          style: TextStyle(
                            color: Themes.whiteColor,
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // ─────────────────────────────────────────────────────────────
  // منطق الصلاحيات وجلب الموقع الجديد المتوافق مع أبل
  // ─────────────────────────────────────────────────────────────

  // محاولة جلب الموقع بصمت عند فتح الشاشة
  Future<void> _silentlyTryGetLocation() async {
    final serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) return;

    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.whileInUse || permission == LocationPermission.always) {
      _fetchAndMoveToLocation();
    }
  }

  // التعامل مع ضغط زر الـ GPS
  Future<void> handleGpsButtonPress() async {
    setState(() => _isLocating = true);

    // 1. هل خدمة الـ GPS مطفأة في الجهاز؟
    final serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      setState(() => _isLocating = false);
      _showOptionalSettingsDialog(
        'خدمة الموقع معطلة',
        'يرجى تفعيل الـ GPS لتحديد موقعك الحالي تلقائياً، أو يمكنك تحديد الموقع يدوياً على الخريطة.',
        isGpsService: true,
      );
      return;
    }

    // 2. فحص صلاحية التطبيق
    LocationPermission permission = await Geolocator.checkPermission();

    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
    }

    // إذا رفض المستخدم بشكل نهائي أو مؤقت
    if (permission == LocationPermission.denied || permission == LocationPermission.deniedForever) {
      setState(() => _isLocating = false);
      _showOptionalSettingsDialog(
        'إذن الموقع مطلوب',
        'تحتاج لتفعيل صلاحية الموقع لتحديد مكانك تلقائياً. يمكنك الاستمرار في استخدام الخريطة يدوياً أو تفعيل الإذن من الإعدادات.',
        isGpsService: false,
      );
      return;
    }

    // 3. الصلاحية مسموحة -> نجلب الموقع
    await _fetchAndMoveToLocation();
    setState(() => _isLocating = false);
  }

  // جلب الإحداثيات ونقل الكاميرا
  Future<void> _fetchAndMoveToLocation() async {
    try {
      final position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high,
      );
      final newLatLng = LatLng(position.latitude, position.longitude);
      _updateAddressFromCoordinates(newLatLng);

      _controller?.animateCamera(
        CameraUpdate.newCameraPosition(CameraPosition(target: newLatLng, zoom: 15.0)),
      );
    } catch (e) {
      print('Error fetching location: $e');
    }
  }

  // تحديث العنوان والماركر بناءً على الإحداثيات
  Future<void> _updateAddressFromCoordinates(LatLng coordinates) async {
    if (!mounted) return;
    setState(() {
      latlong = coordinates;
      _selectedAddress = "جاري جلب العنوان...";
      _markers.clear();
      _markers.add(
        Marker(
          markerId: const MarkerId('user_loc'),
          position: coordinates,
        ),
      );
    });

    try {
      List<Placemark> placemarks = await placemarkFromCoordinates(
        coordinates.latitude,
        coordinates.longitude,
      );
      if (placemarks.isNotEmpty) {
        Placemark p = placemarks[0];
        setState(() {
          _selectedAddress = "${p.street ?? ''}, ${p.locality ?? ''}, ${p.country ?? ''}";
        });
      }
    } catch (e) {
      if (mounted) setState(() => _selectedAddress = "تم تحديد الموقع بنجاح");
    }
  }

  // إظهار رسالة اختيارية (غير إجبارية) ومريحة للمستخدم
  void _showOptionalSettingsDialog(String title, String message, {required bool isGpsService}) {
    Get.dialog(
      AlertDialog(
        title: Text(title, style: const TextStyle(fontFamily: 'Tajawal', fontWeight: FontWeight.bold)),
        content: Text(message, style: const TextStyle(fontFamily: 'Tajawal', height: 1.4)),
        actions: [
          TextButton(
            onPressed: () => Get.back(),
            child: const Text('التحديد يدوياً', style: TextStyle(color: Colors.grey)),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(backgroundColor: Themes.ColorApp1),
            onPressed: () async {
              Get.back();
              if (isGpsService) {
                await Geolocator.openLocationSettings();
              } else {
                await Geolocator.openAppSettings();
              }
            },
            child: const Text('الذهاب للإعدادات', style: TextStyle(color: Colors.white)),
          ),
        ],
      ),
    );
  }
}
