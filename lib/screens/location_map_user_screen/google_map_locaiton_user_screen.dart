import 'dart:async';

import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:location/location.dart' as prefix;
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:nabny/core/constant/constant.dart';
import 'package:nabny/core/localization/local_controller.dart';
import 'package:nabny/screens/location_map_user_screen/google_map_locaiton_user_controller.dart';
import 'package:permission_handler/permission_handler.dart';

import '../../componant/CustomButtonWidget.dart';
import '../../core/constant/Themes.dart';

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
    GoogleMapLocaitonUserController googleMapLocaitonUserController = Get.put(GoogleMapLocaitonUserController());

    return Scaffold(
      body: SafeArea(
          child: Stack(
            children: [
              (latlong != null) ? GoogleMap(
                initialCameraPosition: _cameraPosition,
                onMapCreated: (GoogleMapController controller) {
                  _controller = (controller);
                  _controller!.animateCamera(
                      CameraUpdate.newCameraPosition(_cameraPosition));
                },

                markers: _markers,

              ) : GoogleMap(
                initialCameraPosition: CameraPosition(
                    target: LatLng(31.132112313, 30.212312321), zoom: 10.0),
                onMapCreated: (GoogleMapController controller) {
                  _controller = (controller);
                  _controller!.animateCamera(
                      CameraUpdate.newCameraPosition(CameraPosition(
                          target: LatLng(31.132112313, 30.212312321),
                          zoom: 10.0)));
                },

                markers: _markers,

              ),
              Container(
                child: Padding(
                  padding:
                  const EdgeInsets.symmetric(
                      horizontal: 65, vertical: 10),
                  child: CustomButtonImage(
                    hight: 50,
                    title: 'save_location'.tr,
                    onTap: () async {
                      List<Placemark> newPlace = await placemarkFromCoordinates(
                          latlong!.latitude, latlong!.longitude);
                      // this is all you need
                      Placemark placeMark = newPlace[0];
                      String? name = placeMark.name;
                      String? locality = placeMark.locality;
                      String? administrativeArea = placeMark.administrativeArea;
                      String? administrativeSub = placeMark.subAdministrativeArea;
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

                      CustomFlutterToast('$Location');
                      CustomFlutterToast('${latlong!.latitude} ${latlong!.longitude}');
                      CustomFlutterToast(Get.find<MyLocalController>().language!.languageCode);

                      googleMapLocaitonUserController.updateMyLocationFromMap(latlong?.latitude, latlong?.longitude, Location);
                    },),
                ),
                alignment: Alignment.bottomCenter,
              ),
              Align(
                alignment: Alignment.topRight,
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 15, horizontal: 15),
                  child: FloatingActionButton(
                    child: Icon(Icons.gps_fixed_outlined),
                    onPressed: () {
                      getCurrentLocation();
                    },),
                ),
              ),
            ],

          )),
    );
  }

  Future getCurrentLocation() async {
    LocationPermission permission = await Geolocator.checkPermission();
    if (permission != PermissionStatus.granted) {
      LocationPermission permission = await Geolocator.requestPermission();
      if (permission != PermissionStatus.granted)
        getLocation();
      return;
    }
    getLocation();
  }

  // List<Address> results = [];
  getLocation() async
  {
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    print(position.latitude);

    setState(() {
      latlong = new LatLng(position.latitude, position.longitude);
      _cameraPosition = CameraPosition(target: latlong!, zoom: 15.0);
      if (_controller != null)
        _controller!.animateCamera(

            CameraUpdate.newCameraPosition(_cameraPosition));

      _markers.add(Marker(markerId: MarkerId("a"),
          draggable: true,
          position: latlong!,
          icon: BitmapDescriptor.defaultMarkerWithHue(

              BitmapDescriptor.hueBlue),
          onDragEnd: (_currentlatLng) {
            latlong = _currentlatLng;
          }));
    });
  }
}