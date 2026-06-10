import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nabny/generated/assets.dart';
import 'package:nabny/screens/home_main_screen/home_main_screen.dart';
import 'package:nabny/screens/login_screen/login_screen.dart';
import 'package:nabny/screens/on_boarding_screen/on_boarding_screen.dart';

import '../../core/servies/storage_service.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  Locale? language;
  String? myLanguage;

  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 3), () {
      final token = Get.find<StorageService>().GetToken;
      final skipOnBoarding = Get.find<StorageService>().skipOnBoarding;
      if (token != "") {
        // مسجل دخول → الهوم مباشرة (بدون الخريطة)
        Get.offAll(() => HomeMainScreen(valueBack: ''));
      } else {
        if (skipOnBoarding == true) {
          //   مسجل → شاشة اللوجن
          Get.offAll(() => LoginScreen());
        } else {
          // غير مسجل → شاشة اللوجن
          Get.offAll(() => OnBoardingScreen());
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          width: Get.width,
          height: Get.height,
          decoration: const BoxDecoration(image: DecorationImage(image: AssetImage(Assets.imagesBackgroundSplash), fit: BoxFit.fill)),
          child: Center(
              child: Image.asset(
            Assets.imagesImageLogoApp,
            fit: BoxFit.contain,
          )),
        ),
      ),
    );
  }
}
