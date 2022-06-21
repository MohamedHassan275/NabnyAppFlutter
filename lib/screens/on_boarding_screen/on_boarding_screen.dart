import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nabny/screens/on_boarding_screen/Widget/custom_button.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../utils/Themes.dart';
import '../../generated/assets.dart';
import 'Widget/CustomIndicator.dart';
import 'Widget/CustomPageView.dart';
import 'Widget/custom_skip_boarding.dart';

class OnBoardingScreen extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return OnBoardingScreenState();
  }
  
}
class OnBoardingScreenState extends State<OnBoardingScreen>{
  PageController? pageController;

  @override
  void initState() {
    // TODO: implement initState
    pageController = PageController(initialPage: 0)..addListener(() {
      setState(() {

      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    final double valueHight = Get.height * .024;
    final double valueWidth = Get.width * .024;

    return SafeArea(
      child: Container(
        width: Get.width,
        height: Get.height,
        decoration: const BoxDecoration(
            color: Colors.white,
            image: DecorationImage(
                image: AssetImage(Assets.imagesBackgroundIntro),
                fit: BoxFit.fill)),
        child: Stack(
          children: [
            CustomPageView(controller: pageController,),
            Positioned(
              top: valueHight * 7,
              right: 25,
              left: 25,
              child: Image.asset(
                Assets.imagesLogoApp,
                fit: BoxFit.contain,
                width: 150,
                height: 150,
              ),
            ),
            CustomIndicator(pageController: pageController,),
            CustomSkipBoarding(controller: pageController,),
            CustomButton(pageController: pageController,),
          ],
        ),
      ),
    );
  }
  
}