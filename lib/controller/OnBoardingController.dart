
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

abstract class OnBoardingController extends GetxController {

  next();
  onchange(int index);

}

class OnBoardingControllerImp extends OnBoardingController {

  PageController? pageController;
  int currentPage = 0;

  @override
  next() {
    currentPage ++;
    // if (currentPage == myOnBoardingList.length){
    //
    // }
  }

  @override
  onchange(int index) {
    currentPage = index;
    update();
  }

  @override
  void onInit() {
    pageController = PageController();
    super.onInit();

  }
}