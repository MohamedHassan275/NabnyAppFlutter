
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nabny/controller/OnBoardingController.dart';

import '../../../componant/CustomButtonWidget.dart';
import '../../login_screen/login_screen.dart';

class CustomButton extends StatelessWidget {
   CustomButton({Key? key,required this.pageController}) : super(key: key);
   PageController? pageController;
  @override
  Widget build(BuildContext context) {
    final double valueHight = Get.height * .024;
    final double valueWidth = Get.width * .024;
    return Positioned(
      left: 0,
      right: 0,
      bottom: valueHight * 4.5,
      child: Material(
        type: MaterialType.transparency,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 35, vertical: 15),
          child: CustomButtonImage(
            hight: 50,
            title: pageController!.hasClients ? (pageController!.page == 3 ? 'هيا نبدأ' : 'التالي') : 'التالي',
            onTap: () {
              if (pageController!.page! != 3) {
                pageController?.nextPage(
                    duration: Duration(milliseconds: 500),
                    curve: Curves.easeIn);
              } else {
                Get.to(() => LoginScreen(), transition: Transition.rightToLeft , duration: Duration(milliseconds: 500));
              }
            },
          ),
        ),
      ),
    );
  }
}
