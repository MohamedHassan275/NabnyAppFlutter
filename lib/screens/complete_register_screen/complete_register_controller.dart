import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nabny/core/servies/storage_service.dart';
import 'package:nabny/repositries/servies_api/MyServiceApi.dart';
import 'package:nabny/screens/success_register_screen/success_register_screen.dart';

import '../../core/constant/constant.dart';

class CompleteRegisterController extends GetxController {
  bool isLoading = false;
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  get isloading => isLoading;

  get formKey => _formKey;

  setLoading(bool isloading) {
    isLoading = isloading;
    update();
  }

  createAccount(mobilePhone, firstname, lastname, email, password) {
    if (_formKey.currentState!.validate()) {
      setLoading(true);
      // CustomFlutterToast(mobilePhone);
      // CustomFlutterToast(firstname);
      // CustomFlutterToast(lastname);
      // CustomFlutterToast(email);
      // CustomFlutterToast(password);
      MyServiceApi.createAccountByDetailUser(mobilePhone,firstname,lastname,email,password,'token').then((value) {
        if (value?.success == true) {
          setLoading(false);
          print(mobilePhone);
          print('${value?.data?.accesstoken}');
          Get.find<StorageService>().SetToken('${value?.data?.accesstoken}');
          CustomFlutterToast('${value?.data?.accesstoken}');
          Get.offAll(const SuccessRegisterScreen());
        } else if (value?.success == false) {
          setLoading(false);
          CustomFlutterToast('${value?.message}');
        }
      });
    }
  }
}
