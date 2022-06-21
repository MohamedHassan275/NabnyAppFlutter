
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nabny/controller/OnBoardingController.dart';
import '../../../generated/assets.dart';
import '../../login_screen/login_screen.dart';

class CustomSkipBoarding extends StatelessWidget {
  PageController? controller;
  CustomSkipBoarding({required this.controller});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (controller!.hasClients) {
          if (controller!.page  == 3) {
            Get.to(const LoginScreen(),
                transition: Transition.leftToRight,
                duration: const Duration(milliseconds: 3));
          } else {
            print('has click');
          }
        }
      },
      child: Visibility(
        visible: controller!.hasClients
            ? (controller!.page == 3 ? false : true)
            : true,
        child: Padding(
          padding: EdgeInsets.all(15.0),
          child: Image.asset(
            Assets.imagesSkipBording,
            fit: BoxFit.contain,
          ),
        ),
      ),
    );
  }
}
