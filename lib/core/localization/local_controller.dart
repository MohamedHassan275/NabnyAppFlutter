
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nabny/core/servies/services.dart';

class MyLocalController extends GetxController {

  Locale? language;
  MyServices myServices = Get.put(MyServices());

  changelanguage(String codeCountry){
    Locale myLocal = Locale(codeCountry);
    myServices.sharedPreferences.setString("lang", codeCountry);
    Get.updateLocale(myLocal);
  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    String? myLanguage = myServices.sharedPreferences.getString("lang");
    if(myLanguage == 'ar'){
      language = const Locale("ar");
    }else if(myLanguage == 'en'){
      language = const Locale("en");
    }else {
      language = Locale(Get.deviceLocale!.languageCode);
    }
  }
}