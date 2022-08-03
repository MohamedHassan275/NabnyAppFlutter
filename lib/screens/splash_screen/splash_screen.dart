import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nabny/generated/assets.dart';
import 'package:nabny/screens/location_map_user_screen/google_map_locaiton_user_screen.dart';
import 'package:nabny/screens/on_boarding_screen/on_boarding_screen.dart';

import '../../core/servies/storage_service.dart';
import '../home_main_screen/home_main_screen.dart';

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
    // TODO: implement initState
    super.initState();
    Timer(
        const Duration(seconds: 3),
        () => Get.offAll(Get.find<StorageService>().GetToken != ""
            ? GoogleMapLocationUserScreen()
            : OnBoardingScreen()));


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
