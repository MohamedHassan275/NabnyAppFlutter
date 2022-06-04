
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nabny/generated/assets.dart';
import 'package:nabny/screens/home_main_screen/home_main_screen.dart';
import 'package:nabny/utils/Themes.dart';

class SuccessRegisterScreen extends StatefulWidget {
  const SuccessRegisterScreen({Key? key}) : super(key: key);

  @override
  State<SuccessRegisterScreen> createState() => _SuccessRegisterScreenState();
}

class _SuccessRegisterScreenState extends State<SuccessRegisterScreen> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(Duration(seconds: 5), ()=> Get.to(HomeMainScreen(valueBack: '',)));
  }
  @override
  Widget build(BuildContext context) {
    var hight = Get.height *0.024;
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
            child: Container(
              height: Get.height,
              width: Get.width,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(Assets.imagesCompleteRegister),
                  SizedBox(height: hight * 1.5,),
                  Text(
                    'تم تسجيل دخولك بنجاح',
                    style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.w700,
                        color: Themes.ColorApp8),
                  ),
                ],
              ),
            ),
          )),
    );
  }
}
