import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:nabny/core/servies/services.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../localization/localization_service.dart';


abstract class StorageKeys {
  StorageKeys();

  //Declare all storage keys here & create its correpsonding setters & getters
  static const String token = "TOKEN";
  static const String activeLocale = "ACTIVE_LOCAL";

}

class StorageService extends GetxService {
  late final SharedPreferences _prefs;

  Future<StorageService> init() async {
    _prefs = await SharedPreferences.getInstance();
    return this;
  }

  //TOKEN
   get GetToken {
    return _prefs.getString(StorageKeys.token) ?? "";
  }

   SetToken(String token) {
    _prefs.setString(StorageKeys.token, token);
  }

  Locale get activeLocale {
    return Locale(_prefs.getString(StorageKeys.activeLocale) ??
        SupportedLocales.arabic.toString());
  }

  set activeLocale(Locale activeLocal) {
    _prefs.setString(StorageKeys.activeLocale, activeLocal.toString());
  }

  clear() => _prefs.clear();
}

initialServicesUser () async{
  await Get.putAsync(() => StorageService().init());
}

