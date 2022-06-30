
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:nabny/repositries/servies_api/MyServiceApi.dart';

import '../../../core/constant/Themes.dart';

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
          Fluttertoast.showToast(
            msg: '${value?.data!.registercode}',
            fontSize: 15,
            backgroundColor: Themes.whiteColor,
            gravity: ToastGravity.BOTTOM,
            textColor: Themes.ColorApp1,
            timeInSecForIosWeb: 1,
            toastLength: Toast.LENGTH_SHORT,
          );
        //  Get.to(ChagePasswordScreen(mobilePhone: '$phone',));
        } else if (value?.success == false) {
          setLoading(false);
          Fluttertoast.showToast(
            msg: '${value?.message}',
            fontSize: 15,
            backgroundColor: Themes.whiteColor,
            gravity: ToastGravity.BOTTOM,
            textColor: Themes.ColorApp1,
            timeInSecForIosWeb: 1,
            toastLength: Toast.LENGTH_SHORT,
          );
        }
      });
    }
  }
}