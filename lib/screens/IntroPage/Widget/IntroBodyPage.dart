import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nabny/generated/assets.dart';
import 'package:nabny/screens/IntroPage/Widget/CustomIndicator.dart';
import 'package:nabny/screens/IntroPage/Widget/CustomPageView.dart';
import 'package:nabny/screens/login_screen/login_screen.dart';
import 'package:nabny/utils/Themes.dart';

import '../../../componant/CustomButtonWidget.dart';

class IntroBodyPage extends StatefulWidget {
  const IntroBodyPage({Key? key}) : super(key: key);

  @override
  State<IntroBodyPage> createState() => _IntroBodyPageState();
}

class _IntroBodyPageState extends State<IntroBodyPage> {


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
    final double valueHight = Get.height * .024;
    final double valueWidth = Get.width * .024;

    return SafeArea(
      child: Container(
        width: Get.width,
        height: Get.height,
        decoration: BoxDecoration(
            color: Colors.white,
            image: DecorationImage(
                image: AssetImage(Assets.imagesBackgroundIntro),
                fit: BoxFit.fill)),
        child: Stack(
          children: [
            GestureDetector(
              onTap: () {
                if(pageController!.hasClients){
                  if(pageController!.page == 2){
                    Get.to( const LoginScreen(),transition: Transition.leftToRight , duration: const Duration(milliseconds: 3));
                  }else {
                    print('has click');
                  }
                }
              },
              child: Visibility(
                visible: pageController!.hasClients
                    ? (pageController?.page == 2 ? false : true)
                    : true,
                child: Padding(
                  padding: EdgeInsets.all(15.0),
                  child: Image.asset(
                    Assets.imagesSkipBording,
                    fit: BoxFit.contain,
                  ),
                ),
              ),
            ),
            CustomPageView(pageController: pageController,),
            Positioned(
                left: 0,
                right: 0,
                bottom: valueHight * 9.0,
                child: CustomIndicator(valuePosition: pageController!.hasClients ? pageController!.page : 0,)),
            Positioned(
              left: 0,
              right: 0,
              bottom: valueHight * 4.5,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 100),
                child: CustomGeneralButton(
                  onTap:(){
                  if(pageController!.hasClients){
                    if(pageController!.page == 2){
                      Get.to( const LoginScreen(),transition: Transition.leftToRight , duration: const Duration(milliseconds: 3));
                    }
                  }
                }, text: pageController!.hasClients ? (pageController!.page == 2 ? 'هيا نبدأ' : 'التالي') : 'التالي',),
              ),
            )
          ],
        ),
      ),
    );
  }
}
