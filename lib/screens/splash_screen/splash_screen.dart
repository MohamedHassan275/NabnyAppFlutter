import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nabny/generated/assets.dart';
import 'package:nabny/screens/home_main_screen/home_main_screen.dart';
import 'package:nabny/screens/login_screen/login_screen.dart';

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
    Timer(
        const Duration(seconds: 3),
        () {
          final token = Get.find<StorageService>().GetToken;
          if (token != "") {
            // مسجل دخول → الهوم مباشرة (بدون الخريطة)
            Get.offAll(() => HomeMainScreen(valueBack: ''));
          } else {
            // غير مسجل → شاشة اللوجن
            Get.offAll(() => const LoginScreen());
          }
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
        child: Container(
          width: Get.width,
          height: Get.height,
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(Assets.imagesBackgroundSplash),
                  fit: BoxFit.fill)),
          child: Center(
              child: Image.asset(
            Assets.imagesImageLogoApp,
            fit: BoxFit.contain,
          )),
        ),
      )),
    );
  }
}
