import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nabny/generated/assets.dart';
import 'package:nabny/screens/IntroPage/Presenter/IntroViewPage.dart';


class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(Duration(seconds: 3), () => Get.offAll(IntroViewPage()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(child: SingleChildScrollView(
          child: Container(
              width: Get.width,
              height: Get.height,
              color: Colors.lightBlue.shade900,
              child: Image.asset(Assets.imagesBackgroundSplash,fit: BoxFit.fill,),
        ),
        )),);
  }
}
