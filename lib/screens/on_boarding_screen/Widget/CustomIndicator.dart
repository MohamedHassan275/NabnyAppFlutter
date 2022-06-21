import 'dart:ui';

import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nabny/controller/OnBoardingController.dart';
import 'package:nabny/core/constant/on_boarding_list.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../utils/Themes.dart';

class CustomIndicator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<OnBoardingControllerImp>(
      init: OnBoardingControllerImp(),
      builder: (controller) => Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ...List.generate(
              myOnBoardingList.length,
              (index) => AnimatedContainer(
                    margin: const EdgeInsets.all(2),
                    child: Container(
                      width: 3,
                      height: controller.currentPage == index ? 20 : 12,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: controller.currentPage == index ? Themes.ColorApp1 : Themes.ColorApp11),
                    ),
                    duration: Duration(milliseconds: 900),
                  ))
        ],
      ),
    );
  }
}

// SmoothPageIndicator(count: 4,
// controller: pageController!,
// effect: ExpandingDotsEffect(
// activeDotColor: Themes.ColorApp1,
// dotColor: Themes.ColorApp11,
// dotHeight: 15,
// dotWidth: 15,
// spacing: 5
// ),)
