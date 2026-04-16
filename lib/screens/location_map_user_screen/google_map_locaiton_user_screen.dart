import 'dart:async';

import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:nabny/screens/location_map_user_screen/google_map_locaiton_user_controller.dart';

import '../../core/constant/Themes.dart';
import '../../core/widget/custom_circler_progress_indicator_widget.dart';

class GoogleMapLocationUserScreen extends StatefulWidget {
  const GoogleMapLocationUserScreen({Key? key}) : super(key: key);

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
  bool _gpsDisabled = false; // GPS مطفي
  bool _permissionDenied = false; // إذن مرفوض (نهائي أو مؤقت)

  @override
  void initState() {
    super.initState();
    // موقع افتراضي (الرياض) حتى يتم جلب الموقع الحقيقي
    _cameraPosition = const CameraPosition(
      target: LatLng(24.7136, 46.6753),
      zoom: 10.0,
    );
    getCurrentLocation();
  }

  String _selectedAddress = '';

  @override
  Widget build(BuildContext context) {
    final heightValue = Get.height * 0.024;

    return Scaffold(
      body: SafeArea(
        child: GetBuilder<GetMyLocationController>(
          init: GetMyLocationController(),
          builder: (mapController) => Stack(
            children: [
              // ── الخريطة دايماً في الخلفية ──
              GoogleMap(
                mapType: MapType.normal,
                initialCameraPosition: _cameraPosition,
                onMapCreated: (GoogleMapController controller) {
                  _controller = controller;
                  _controller!.animateCamera(
                    CameraUpdate.newCameraPosition(_cameraPosition),
                  );
                },
                // ── التعديل الجديد هنا ──
                onTap: (LatLng tappedPoint) async {
                  setState(() {
                    latlong = tappedPoint;
                    _selectedAddress = "جاري جلب العنوان..."; // تحديث الحالة مؤقتاً
                    _markers.clear();
                    _markers.add(
                      Marker(
                        markerId: const MarkerId('user_loc'),
                        position: tappedPoint,
                      ),
                    );
                  });

                  // جلب اسم العنوان الجديد
                  try {
                    List<Placemark> placemarks = await placemarkFromCoordinates(
                      tappedPoint.latitude,
                      tappedPoint.longitude,
                    );
                    if (placemarks.isNotEmpty) {
                      Placemark p = placemarks[0];
                      setState(() {
                        _selectedAddress = "${p.street}, ${p.locality}, ${p.country}";
                      });
                    }
                  } catch (e) {
                    setState(() => _selectedAddress = "تعذر تحديد تفاصيل العنوان");
                  }
                },
                markers: _markers,
                myLocationEnabled: !_gpsDisabled && !_permissionDenied,
                myLocationButtonEnabled: false,
              ),

              // ── overlay لو GPS مطفي أو إذن مرفوض ──
              if (_gpsDisabled || _permissionDenied) _buildBlockedOverlay(heightValue),

              // ── زر GPS (فقط لو كل شيء تمام) ──
              if (!_gpsDisabled && !_permissionDenied)
                Positioned(
                  top: 15,
                  right: 15,
                  child: FloatingActionButton(
                    heroTag: 'gps_btn',
                    backgroundColor: Themes.ColorApp1,
                    onPressed: _isLocating ? null : getCurrentLocation,
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

              // ── باقة الحفظ في الأسفل ──
              if (!_gpsDisabled && !_permissionDenied)
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    width: Get.width,
                    padding: const EdgeInsets.fromLTRB(40, 12, 40, 20),
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.93),
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
                                  style: TextStyle(
                                    color: Colors.black87,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                    fontFamily: 'Tajawal', // أو الخط المستخدم في المشروع
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
                                    Get.snackbar('تنبيه', 'لم يتم تحديد الموقع بعد');
                                    return;
                                  }
                                  try {
                                    final places = await placemarkFromCoordinates(
                                      latlong!.latitude,
                                      latlong!.longitude,
                                    );
                                    final p = places[0];
                                    final name = '${p.country} - ${p.locality} - ${p.street}';
                                    Get.find<GetMyLocationController>().updateMyLocationFromMap(
                                      latlong!.latitude,
                                      latlong!.longitude,
                                      name,
                                    );
                                  } catch (e) {
                                    Get.snackbar('خطأ', 'تعذر الحصول على بيانات العنوان');
                                  }
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
  // Overlay: GPS مطفي أو إذن مرفوض
  // ─────────────────────────────────────────────────────────────
  Widget _buildBlockedOverlay(double heightValue) {
    final isGpsOff = _gpsDisabled;

    return Container(
      color: Colors.white,
      child: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 32),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                isGpsOff ? Icons.location_off_rounded : Icons.location_disabled_rounded,
                size: 80,
                color: Themes.ColorApp1,
              ),
              SizedBox(height: heightValue),
              Text(
                isGpsOff ? 'GPS غير مفعّل' : 'إذن الموقع مرفوض',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Themes.ColorApp1,
                ),
              ),
              SizedBox(height: heightValue * 0.5),
              Text(
                isGpsOff
                    ? 'يرجى تفعيل خدمة الموقع (GPS) لتتمكن من تحديد موقعك على الخريطة.'
                    : 'تم رفض إذن الموقع. يرجى الذهاب إلى إعدادات التطبيق وتفعيل إذن الموقع.',
                textAlign: TextAlign.center,
                style: const TextStyle(fontSize: 15, color: Colors.grey, height: 1.5),
              ),
              SizedBox(height: heightValue * 1.5),
              ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Themes.ColorApp1,
                  padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 14),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                icon: Icon(
                  isGpsOff ? Icons.settings_outlined : Icons.app_settings_alt_outlined,
                  color: Colors.white,
                ),
                label: Text(
                  isGpsOff ? 'تفعيل GPS' : 'فتح إعدادات التطبيق',
                  style: const TextStyle(color: Colors.white, fontSize: 16),
                ),
                onPressed: () async {
                  if (isGpsOff) {
                    await Geolocator.openLocationSettings();
                  } else {
                    await Geolocator.openAppSettings();
                  }
                  // إعادة المحاولة بعد رجوع المستخدم من الإعدادات
                  await Future.delayed(const Duration(milliseconds: 800));
                  getCurrentLocation();
                },
              ),
              SizedBox(height: heightValue),
              TextButton(
                onPressed: () => Get.back(),
                child: Text(
                  'رجوع',
                  style: TextStyle(color: Themes.ColorApp2, fontSize: 15),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // ─────────────────────────────────────────────────────────────
  // منطق الإذن وجلب الموقع
  // ─────────────────────────────────────────────────────────────
  Future<void> getCurrentLocation() async {
    if (!mounted) return;

    setState(() {
      _isLocating = true;
      _gpsDisabled = false;
      _permissionDenied = false;
    });

    try {
      // ① هل GPS شغال؟
      final serviceEnabled = await Geolocator.isLocationServiceEnabled();
      if (!serviceEnabled) {
        if (mounted) {
          setState(() {
            _gpsDisabled = true;
            _isLocating = false;
          });
        }
        return;
      }

      // ② فحص الإذن
      LocationPermission permission = await Geolocator.checkPermission();

      if (permission == LocationPermission.denied) {
        // طلب الإذن من المستخدم
        permission = await Geolocator.requestPermission();
      }

      if (permission == LocationPermission.denied || permission == LocationPermission.deniedForever) {
        if (mounted) {
          setState(() {
            _permissionDenied = true;
            _isLocating = false;
          });
        }
        return;
      }

      // ③ جلب الموقع
      await _fetchAndMoveToLocation();
    } catch (e) {
      print('getCurrentLocation error: $e');
    } finally {
      if (mounted) setState(() => _isLocating = false);
    }
  }

  Future<void> _fetchAndMoveToLocation() async {
    try {
      final position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high,
      );

      if (!mounted) return;

      final newLatLng = LatLng(position.latitude, position.longitude);
      final newCamera = CameraPosition(target: newLatLng, zoom: 15.0);

      // --- جلب العنوان النصي تلقائياً عند تحديد الموقع ---
      String addressName = "جاري جلب العنوان...";
      try {
        List<Placemark> placemarks = await placemarkFromCoordinates(
          position.latitude,
          position.longitude,
        );
        if (placemarks.isNotEmpty) {
          Placemark p = placemarks[0];
          addressName = "${p.street}, ${p.locality}, ${p.country}";
        }
      } catch (e) {
        addressName = "تعذر تحديد تفاصيل العنوان";
      }

      setState(() {
        latlong = newLatLng;
        _cameraPosition = newCamera;
        _selectedAddress = addressName; // تحديث التكست هنا
        _markers
          ..clear()
          ..add(Marker(
            markerId: const MarkerId('user_loc'),
            draggable: true,
            position: newLatLng,
            // تحديث العنوان أيضاً عند الانتهاء من سحب الماركر يدوياً
            onDragEnd: (newPos) => _updateAddressFromCoordinates(newPos),
          ));
      });

      _controller?.animateCamera(
        CameraUpdate.newCameraPosition(newCamera),
      );
    } catch (e) {
      print('_fetchAndMoveToLocation error: $e');
    }
  }

  Future<void> _updateAddressFromCoordinates(LatLng coordinates) async {
    if (!mounted) return;
    setState(() {
      latlong = coordinates;
      _selectedAddress = "جاري جلب العنوان...";
    });

    try {
      List<Placemark> placemarks = await placemarkFromCoordinates(
        coordinates.latitude,
        coordinates.longitude,
      );
      if (placemarks.isNotEmpty) {
        Placemark p = placemarks[0];
        setState(() {
          // تنسيق العنوان ليظهر بشكل لائق في واجهة التطبيق
          _selectedAddress = "${p.street}, ${p.locality}, ${p.country}";
          print('_selectedAddress _selectedAddress $_selectedAddress');
        });
      }
    } catch (e) {
      if (mounted) setState(() => _selectedAddress = "تعذر تحديد تفاصيل العنوان");
    }
  }
}
