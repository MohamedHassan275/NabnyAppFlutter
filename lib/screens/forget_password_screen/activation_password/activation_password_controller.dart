
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:nabny/repositries/servies_api/MyServiceApi.dart';
import 'package:nabny/screens/forget_password_screen/chage_password/chage_password_screen.dart';

import '../../../core/constant/Themes.dart';

class ActivationPasswordController extends GetxController {

  bool isLoading = false;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  bool? get isloading => isLoading;
  get formKey => _formKey;

  setLoading(bool isloading) {
    isLoading = isloading;
    update();
  }

  activeCodeByMobilePhone (phone,code) async {
    if (_formKey.currentState!.validate()){
      setLoading(true);
      MyServiceApi.activeCodeByForgetPassword(phone, code).then((value) {
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
         // print('${value?.data!.registercode}');
          print('${phone}');
          Get.to(ChagePasswordScreen(mobilePhone: '$phone',));
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