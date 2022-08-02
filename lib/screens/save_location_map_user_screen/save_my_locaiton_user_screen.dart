import 'dart:async';

import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:location/location.dart' as prefix;
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:nabny/core/constant/constant.dart';
import 'package:nabny/core/localization/local_controller.dart';
import 'package:nabny/screens/save_location_map_user_screen/save_my_locaiton_user_controller.dart';
import 'package:permission_handler/permission_handler.dart';

import '../../componant/CustomButtonWidget.dart';
import '../../core/constant/Themes.dart';
import '../../core/widget/custom_circler_progress_indicator_widget.dart';

class SaveMyLocationUserScreen extends StatefulWidget {
  const SaveMyLocationUserScreen({Key? key}) : super(key: key);

  @override
  _SaveMyLocationUserScreenState createState() =>
      _SaveMyLocationUserScreenState();
}

class _SaveMyLocationUserScreenState extends State<SaveMyLocationUserScreen> {
  LatLng? latlong;
  late CameraPosition _cameraPosition;
  GoogleMapController? _controller;

  final Set<Marker> _markers = {};
  late Position userLocation;
  prefix.Location currentLocation = prefix.Location();
  TextEditingController locationController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _cameraPosition = CameraPosition(target: LatLng(0, 0), zoom: 10.0);
    getCurrentLocation();
    setState(() {
      getLocation();
    });
  }

  @override
  Widget build(BuildContext context) {
    var heightValue = Get.height * 0.024;
    return Scaffold(
      body: SafeArea(
          child: GetBuilder<SaveMyLocationController>(
            init: SaveMyLocationController(),
            builder: (SaveLocaitonUserController) =>  Stack(
            children: [
              (latlong != null)
                  ? GoogleMap(
                initialCameraPosition: _cameraPosition,
                onMapCreated: (GoogleMapController controller) {
                  _controller = (controller);
                  _controller!.animateCamera(
                      CameraUpdate.newCameraPosition(_cameraPosition));
                },
                markers: _markers,
              )
                  : GoogleMap(
                mapType: MapType.hybrid,
                initialCameraPosition: CameraPosition(
                    target: LatLng(31.132112313, 30.212312321), zoom: 10.0),
                onMapCreated: (GoogleMapController controller) {
                  _controller = (controller);
                  _controller!.animateCamera(CameraUpdate.newCameraPosition(
                      CameraPosition(
                          target: LatLng(31.132112313, 30.212312321),
                          zoom: 10.0)));
                },
                markers: _markers,
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  width: Get.width,
                  height: 200,
                  // color: Themes.whiteColor,
                  child: Column(
                    children: [
                      const Spacer(),
                      Visibility(
                        visible: SaveLocaitonUserController.isLoading
                            ? true
                            : false,
                        child: Container(
                            width: 75,
                            height: 75,
                            decoration: BoxDecoration(
                                color: Themes.whiteColor,
                                borderRadius: BorderRadius.circular(25)
                            ),
                            child: CirclerProgressIndicatorWidget(
                                isLoading: SaveLocaitonUserController.isLoading
                                    ? true
                                    : false)),
                      ),
                      SizedBox(height: heightValue * .5,),
                      Padding(
                        padding: const EdgeInsets.only(
                          top: 0,left: 60 ,right: 60 ,bottom: 10,),
                        child: MaterialButton(
                          height: 50,
                          color: Themes.ColorApp1,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(35)
                          ),
                          child: Center(
                            child: Text('save_location'.tr,style: TextStyle(
                              color: Themes.whiteColor,
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                            )),
                          ),
                          onPressed: () async{
                            List<Placemark> newPlace =
                            await placemarkFromCoordinates(
                                latlong!.latitude, latlong!.longitude);
                            // this is all you need
                            Placemark placeMark = newPlace[0];
                            String? name = placeMark.name;
                            String? locality = placeMark.locality;
                            String? administrativeArea =
                                placeMark.administrativeArea;
                            String? administrativeSub =
                                placeMark.subAdministrativeArea;
                            String? postalCode = placeMark.postalCode;
                            String? country = placeMark.country;
                            String? thoroughfare = placeMark.thoroughfare;
                            String? Street = placeMark.street;
                            print(name);
                            print(locality);
                            print('${administrativeSub} - ${Street}');
                            print(postalCode);
                            print(country);
                            print(thoroughfare);
                            print(Street);
                            String Location = '${country} - ${Street}';

                            // CustomFlutterToast('$Location');
                            // CustomFlutterToast(
                            //     '${latlong!.latitude} ${latlong!.longitude}');
                            // CustomFlutterToast(Get.find<MyLocalController>()
                            //     .language!
                            //     .languageCode);

                            Get.find<SaveMyLocationController>().SaveMyLocationFromMap(latlong?.latitude, latlong?.longitude, Location,Location);
                            // googleMapLocaitonUserController.updateMyLocationFromMap(
                            //     latlong?.latitude, latlong?.longitude, Location);
                          },
                        ),
                      ),
                    ],
                  ),
                  alignment: Alignment.bottomCenter,
                ),
              ),
              Align(
                alignment: Alignment.topRight,
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
                  child: FloatingActionButton(
                    child: Icon(Icons.gps_fixed_outlined),
                    onPressed: () {
                      getCurrentLocation();
                    },
                  ),
                ),
              ),
            ],
          ),)
      ),
    );
  }

  Future getCurrentLocation() async {
    LocationPermission permission = await Geolocator.checkPermission();
    if (permission != PermissionStatus.granted) {
      LocationPermission permission = await Geolocator.requestPermission();
      if (permission != PermissionStatus.granted) getLocation();
      return;
    }
    getLocation();
  }

  // List<Address> results = [];
  getLocation() async {
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    print(position.latitude);

    setState(() {
      latlong = new LatLng(position.latitude, position.longitude);
      _cameraPosition = CameraPosition(target: latlong!, zoom: 15.0);
      if (_controller != null)
        _controller!
            .animateCamera(CameraUpdate.newCameraPosition(_cameraPosition));

      _markers.add(Marker(
          markerId: MarkerId("a"),
          draggable: true,
          position: latlong!,
          icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueRed),
          onDragEnd: (_currentlatLng) {
            latlong = _currentlatLng;
          }));
    });
  }
}
