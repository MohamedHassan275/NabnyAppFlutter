import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nabny/core/localization/local_controller.dart';
import 'package:nabny/core/localization/translation.dart';
import 'package:nabny/core/servies/services.dart';
import 'package:nabny/screens/home_main_screen/home_main_controller.dart';
import 'package:nabny/screens/splash_screen/screen_screen.dart';
import 'package:provider/provider.dart';

void main() async {

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      locale: const Locale("ar"),
      home: const SplashScreen(),
    );
  }
}
