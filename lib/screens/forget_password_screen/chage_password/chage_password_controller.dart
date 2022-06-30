
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:nabny/repositries/servies_api/MyServiceApi.dart';
import 'package:nabny/screens/login_screen/login_screen.dart';

import '../../../core/constant/Themes.dart';
import '../../../core/constant/constant.dart';

class ChangePasswordController extends GetxController {

  bool isLoading = false;
  final GlobalKey<FormState> _fomeKey = GlobalKey<FormState>();
  String Password = '';
  String ConfirmPassword = '';
  String Phone = '';

  bool get isloading => isLoading;
  GlobalKey<FormState> get formKey => _fomeKey;
  String get password => Password;
  String get confirmPassword => ConfirmPassword;
  String get phone => Phone;

  setLoading (bool islaoding){
    isLoading = islaoding;
    update();
  }

  changePasswordByForgetPassword (phone, password){
    if(_fomeKey.currentState!.validate()){
      setLoading(true);
      print(phone);
      print(password);
      MyServiceApi.ReChangePasswordUser(phone, password).then((value){
        if (value?.success == true) {
          setLoading(false);
          print(value?.message);
          CustomFlutterToast('${value?.message}');
          Get.offAll(const LoginScreen());
        } else if (value?.success == false) {
          setLoading(false);
          CustomFlutterToast('${value?.message}');
        }
      });
    }
  }
}