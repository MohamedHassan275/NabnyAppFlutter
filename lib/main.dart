import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nabny/core/localization/local_controller.dart';
import 'package:nabny/core/localization/translation.dart';
import 'package:nabny/core/servies/services.dart';
import 'package:nabny/screens/splash_screen/splash_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'core/localization/localization_service.dart';
import 'core/servies/storage_service.dart';
import 'core/servies/storage_service_language.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initialServices();
  await initialServicesUser();
  await initialServicesLanguageUser();
  await SharedPreferences.getInstance();
  await Firebase.initializeApp();
  Get.put(LocalizationService.init(), permanent: true);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(MyLocalController());
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      translations: MyTranslation(),
      locale: Get.find<StorageServiceLanguage>().activeLocale,
      home: const SplashScreen(),
    );
  }
}

