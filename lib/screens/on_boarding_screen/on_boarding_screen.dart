import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nabny/generated/assets.dart';
import 'package:nabny/screens/login_screen/login_screen.dart';
import 'package:nabny/screens/on_boarding_screen/widget/custom_indicator.dart';
import 'package:nabny/screens/on_boarding_screen/widget/custom_page_view.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({Key? key}) : super(key: key);

  @override
  _OnBoardingScreenState createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
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

    return Scaffold(
      body: SafeArea(
        child: Container(
          width: Get.width,
          height: Get.height,
          decoration: BoxDecoration(
              color: Colors.white,
              image: DecorationImage(
                  image: AssetImage(Assets.imagesBackgroundBording),
                  fit: BoxFit.fill)),
          child: Stack(
            children: [
              Visibility(
                visible: pageController!.hasClients
                    ? (pageController?.page == 2 ? false : true)
                    : true,
                child: Positioned(
                  top: valueHight*1.5,
                  right: valueWidth*2.0,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Image.asset(
                      Assets.imagesSkipBording,
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
              ),
              Positioned(
                top: valueHight*6.0,
                left: valueWidth*2.0,
                right: valueWidth*2.0,
                child: Image.asset(
                  Assets.imagesLogoImage,
                  width: 92,
                  height: 137,
                  fit: BoxFit.contain,
                ),
              ),
              Positioned(
                top: valueHight*17.5,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 0),
                  child: Container(
                    width: Get.width,
                    height: 125,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(15))),
                    child: Center(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        child: CustomPageView(pageController: pageController,)
                      ),
                    ),
                  ),
                ),
              ),
              Positioned(
                top: valueHight*25.0,
                left: valueWidth*2.0,
                right: valueWidth*2.0,
                child: CustomIndicator(
                  dotIndex: pageController!.hasClients ? pageController?.page : 0,
                ),
              ),
              Positioned(
                top: valueHight*27.0,
                left: valueWidth*2.0,
                right: valueWidth*2.0,
                child: GestureDetector(
                  onTap: () => Get.to(LoginScreen()),
                  child: Image.asset(
                    Assets.iconsNextPage,
                    width: 125,
                    height: 125,
                    fit: BoxFit.contain,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
