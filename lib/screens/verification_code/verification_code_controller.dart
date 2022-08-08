
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nabny/core/constant/constant.dart';
import 'package:nabny/screens/complete_register_screen/complete_register_screen.dart';

import '../../repositries/servies_api/MyServiceApi.dart';

class VerificationCodeController extends GetxController{
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
      MyServiceApi.activeCodeByRegister(phone, code).then((value) {
        if (value?.success == true) {
          setLoading(false);

          CustomFlutterToast('${value?.message}');
          // print('${value?.data!.registercode}');
          print('$phone');
          Get.off(CompleteRegisterScreen(mobilePhone: '$phone',));
        } else if (value?.success == false) {
          setLoading(false);
          CustomFlutterToast('${value?.message}');
        }
      });
    }
  }
}