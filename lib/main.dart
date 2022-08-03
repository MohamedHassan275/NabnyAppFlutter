import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nabny/core/localization/local_controller.dart';
import 'package:nabny/core/localization/translation.dart';
import 'package:nabny/core/servies/services.dart';
import 'package:nabny/screens/profile_information_screen/profile_information_controller.dart';
import 'package:nabny/screens/splash_screen/splash_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'core/servies/storage_service.dart';
import 'screens/location_map_user_screen/google_map_locaiton_user_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initialServices();
  await initialServicesUser();
  await SharedPreferences.getInstance();
  await Firebase.initializeApp();
  Get.lazyPut(()=>ProfileInformationController());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
  //  MyLocalController controller =  Get.put(MyLocalController()) ;
    StorageService controller =  Get.put(StorageService());
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      translations: MyTranslation(),
      locale: Locale(controller.GetLanguage),
      home: const SplashScreen(),
    );
  }
}
