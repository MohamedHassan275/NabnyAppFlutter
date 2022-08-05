
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:nabny/core/constant/constant.dart';
import 'package:nabny/core/servies/storage_service.dart';
import 'package:nabny/repositries/servies_api/MyServiceApi.dart';
import 'package:nabny/screens/home_main_screen/home_main_screen.dart';
import 'package:nabny/screens/location_map_user_screen/google_map_locaiton_user_screen.dart';

class LoginController extends GetxController{

  bool isLoading = false;
  String? Firebase_token;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  late FirebaseMessaging _firebaseMessaging = FirebaseMessaging.instance;
  bool get isloading => isLoading;
  get formKey =>_formKey;
  get firebase_token => Firebase_token;

  setLoading(bool loading){
    isLoading = loading;
    update();
  }

  LoginController(){
    getFirebaseToken();
  }

  getFirebaseToken(){
    Firebase.initializeApp().whenComplete(() {
      print("completed");
      print(Firebase_token);
    });
    _firebaseMessaging.getToken().then((value){
      print('The Token is $value');
      Firebase_token = value!;
      print(Firebase_token);
    });
  }
   checkLoginUser(mobilePhone,password,token){
    if(_formKey.currentState!.validate()){
      print(mobilePhone);
      print(password);
      print(token);
      print(Firebase_token);
      setLoading(true);
      MyServiceApi.checkLoginUser(mobilePhone, password, token).then((value){
        if(value!.success == true){
          setLoading(false);
          Get.find<StorageService>().SetToken('${value.data!.accesstoken}');
          // CustomFlutterToast('${value.message}');
          // CustomFlutterToast(value.data!.accesstoken);
          // print(value.data!.accesstoken);
          // CustomFlutterToast(token);
          Get.offAll(GoogleMapLocationUserScreen());
        }else if(value.success == false){
          setLoading(false);
          CustomFlutterToast('${value.message}');
        }
      });
    }
  }
}