import 'dart:async';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart' as prefix;
import 'package:nabny/componant/CustomButtonWidget.dart';
import 'package:nabny/utils/Themes.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:shared_preferences/shared_preferences.dart';

class GetMyLocationUserPage extends StatefulWidget {

  const GetMyLocationUserPage({Key? key}) : super(key: key);

  /// Utility method to create a page with the Baseflow templating.

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return GetMyLocationUserPageState();
  }
}



class GetMyLocationUserPageState extends State<GetMyLocationUserPage> {
  late SharedPreferences sharedPreferences;
  late String Authorization;
  late String Language = "en";
  int _counter = 0;


  Future<void> IsUserAcesstoken() async {
    sharedPreferences = await SharedPreferences.getInstance();
    Authorization = sharedPreferences.getString('AccessToken')!;
    // if (sharedPreferences.getString('languageApp') == null) {
    //   Language = "en";
    // } else {
    //   Language =  '${sharedPreferences.setString('languageApp', Language)}';
    // }
    // print(Authorization);
    // print(Language);
    // print(widget.PhoneNumber);

  }

  LatLng? latlong=null;
  late CameraPosition _cameraPosition;
  GoogleMapController? _controller ;
  final Set<Marker> _markers={};
  late Position userLocation;
  prefix.Location currentLocation = prefix.Location();
  TextEditingController locationController = TextEditingController();


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _cameraPosition=CameraPosition(target: LatLng(0, 0),zoom: 10.0);
    getCurrentLocation();
    setState(() {
      getLocation();
    });

  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Stack(
            children: [
              (latlong!=null) ?GoogleMap(
                initialCameraPosition: _cameraPosition,
                onMapCreated: (GoogleMapController controller){
                  _controller=(controller);
                  _controller!.animateCamera(
                      CameraUpdate.newCameraPosition(_cameraPosition));
                },

                markers:_markers ,

              ):GoogleMap(
                initialCameraPosition: CameraPosition(target: LatLng(31.132112313, 30.212312321),zoom: 10.0),
                onMapCreated: (GoogleMapController controller){
                  _controller=(controller);
                  _controller!.animateCamera(
                      CameraUpdate.newCameraPosition(CameraPosition(target: LatLng(31.132112313, 30.212312321),zoom: 10.0)));
                },

                markers:_markers ,

              ),
              Container(
                child:   Padding(
                  padding:
                  const EdgeInsets.symmetric(
                      horizontal: 65, vertical: 10),
                  child: FromButtonShared(
                      width: MediaQuery.of(context)
                          .size
                          .width,
                      sizeText: 17,
                      buttonText: 'Save Location',
                      onPressed: () async{
                        List<Placemark> newPlace = await placemarkFromCoordinates(latlong!.latitude,latlong!.longitude);
                        // this is all you need
                        Placemark placeMark  = newPlace[0];
                        String? name = placeMark.name;
                        String? locality = placeMark.locality;
                        String? administrativeArea = placeMark.administrativeArea;
                        String? postalCode = placeMark.postalCode;
                        String? country = placeMark.country;
                        String? thoroughfare = placeMark.thoroughfare;
                        String? Street = placeMark.street;
                        print(name);
                        print(locality );
                        print('${administrativeArea} - ${locality}');
                        print(postalCode);
                        print(country);
                        print(thoroughfare);
                        print(Street);
                        String Location = '${administrativeArea} - ${locality} - ${thoroughfare}';

                        SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
                        sharedPreferences.setString("Location", '${Location}');
                        sharedPreferences.setDouble("latitude", latlong!.latitude);
                        sharedPreferences.setDouble("longitude", latlong!.longitude);
                      //  Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => HomeMainUserPage()));
                       // Get.to(HomeMainUserPage(),duration: Duration(milliseconds: 3), transition: Transition.leftToRight);

                        Fluttertoast.showToast(
                            msg: '${Location}',
                            toastLength: Toast.LENGTH_SHORT,
                            gravity: ToastGravity.BOTTOM,
                            timeInSecForIosWeb: 1,
                            backgroundColor: Colors.blueGrey,
                            textColor: Colors.white,
                            fontSize: 15.0);
                      },
                      height: 50,
                      color: Themes.ColorApp9),
                ),
                alignment: Alignment.bottomCenter,
              ),
              Align(
                alignment: Alignment.topRight,
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 15,horizontal: 15),
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
    Position position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
    print(position.latitude);

    setState(() {
      latlong=new LatLng(position.latitude, position.longitude);
      _cameraPosition=CameraPosition(target:latlong!,zoom: 15.0 );
      if(_controller!=null)
        _controller!.animateCamera(

            CameraUpdate.newCameraPosition(_cameraPosition));



      _markers.add(Marker(markerId: MarkerId("a"),draggable:true,position: latlong!,icon: BitmapDescriptor.defaultMarkerWithHue(

          BitmapDescriptor.hueBlue),onDragEnd: (_currentlatLng){
        latlong = _currentlatLng;

      }));
    });

    // getCurrentAddress();
  }

// getCurrentAddress() async
// {
//
//   final coordinates = new Coordinates(latlong!.latitude, latlong!.longitude);
//   results  = await Geocoder.local.findAddressesFromCoordinates(coordinates);
//   var first = results.first;
//   if(first!=null) {
//     var address;
//     address = first.featureName;
//     address =   " $address, ${first.subLocality}" ;
//     address =  " $address, ${first.subLocality}" ;
//     address =  " $address, ${first.locality}" ;
//     address =  " $address, ${first.countryName}" ;
//     address = " $address, ${first.postalCode}" ;
//
//     locationController.text = address;
//   }
// }
}