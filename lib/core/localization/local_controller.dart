
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nabny/core/servies/services.dart';
import 'package:nabny/core/servies/storage_service.dart';

class MyLocalController extends GetxController {

  Locale? language;
  MyServices myServices = Get.put(MyServices());

  changelanguage(String codeCountry){
    language = Locale(codeCountry);
    Get.find<StorageService>().activeLocale = language! ;
    Get.updateLocale(language!);
  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    String? myLanguage = Get.find<StorageService>().activeLocale.languageCode;
    if(myLanguage == 'ar'){
      language = const Locale("ar");
    }else if(myLanguage == 'en'){
      language = const Locale("en");
    }else {
      language = Locale(Get.deviceLocale!.languageCode);
    }
  }
}