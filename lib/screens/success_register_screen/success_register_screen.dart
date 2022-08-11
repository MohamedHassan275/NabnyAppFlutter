
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nabny/generated/assets.dart';
import 'package:nabny/screens/home_main_screen/home_main_screen.dart';
import 'package:nabny/utils/Themes.dart';

import '../location_map_user_screen/google_map_locaiton_user_screen.dart';

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
    Timer(Duration(seconds: 3), ()=> Get.to(GoogleMapLocationUserScreen()));

  }

  @override
  Widget build(BuildContext context) {
    var hight = Get.height *0.024;
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
            child: SizedBox(
              height: Get.height,
              width: Get.width,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(Assets.imagesCompleteRegister),
                  SizedBox(height: hight * 1.5,),
                  Text(
                    'register_complete'.tr,
                    style: const TextStyle(
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
