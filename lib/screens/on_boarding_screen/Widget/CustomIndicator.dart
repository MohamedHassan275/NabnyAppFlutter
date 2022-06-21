import 'dart:ui';

import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nabny/controller/OnBoardingController.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../utils/Themes.dart';

class CustomIndicator extends StatelessWidget {
  PageController? pageController;
  CustomIndicator({required this.pageController});
  @override
  Widget build(BuildContext context) {
    final double valueHight = Get.height * .024;
    final double valueWidth = Get.width * .024;
    return  Positioned(
      left: 0,
      right: 0,
      bottom: valueHight * 9.0,
      child: Center(child: SmoothPageIndicator(count: 4,
        controller: pageController!,
        effect: ExpandingDotsEffect(
            activeDotColor: Themes.ColorApp1,
            dotColor: Themes.ColorApp11,
            dotHeight: 15,
            dotWidth: 15,
            spacing: 5
        ),)),
    );
  }
  }

