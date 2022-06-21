import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nabny/controller/OnBoardingController.dart';
import 'package:nabny/core/constant/on_boarding_list.dart';
import '../../../generated/assets.dart';
import '../../login_screen/login_screen.dart';

class CustomSkipBoarding extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<OnBoardingControllerImp>(
        builder: (controller) => GestureDetector(
              onTap: () {
                if (controller.pageController!.hasClients) {
                  if (controller.currentPage != myOnBoardingList.length - 1) {
                    Get.to(const LoginScreen(),
                        transition: Transition.leftToRight,
                        duration: const Duration(milliseconds: 3));
                  } else {
                    print('has click');
                  }
                }
              },
              child: Visibility(
                visible: controller.pageController!.hasClients
                    ? (controller.currentPage == myOnBoardingList.length -1
                        ? false
                        : true)
                    : true,
                child: Padding(
                  padding: EdgeInsets.all(15.0),
                  child: Image.asset(
                    Assets.imagesSkipBording,
                    fit: BoxFit.contain,
                  ),
                ),
              ),
            ));
  }
}
