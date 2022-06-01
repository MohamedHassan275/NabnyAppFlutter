
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nabny/generated/assets.dart';
import 'package:nabny/screens/home_screen/home_screen.dart';

class HomeMainController extends ChangeNotifier {

  int? indexPage = 0;

  List<Widget> PageList = [HomeScreen(),HomeScreen(),HomeScreen(),HomeScreen()];

  List<BottomNavigationBarItem> navigationItem = [
    BottomNavigationBarItem(icon: Image.asset(Assets.iconsIconHome2,width: 30,height: 30,),label: 'الرئيسيه'.tr,
        activeIcon: Image.asset(Assets.iconsHomeIcon,width: 30,height: 30,)),
    BottomNavigationBarItem(icon: Image.asset(Assets.iconsMyOrderHome,width: 30,height: 30,),label: 'طلباتي'.tr,
        activeIcon: Image.asset(Assets.iconsMyOrderHome2,width: 30,height: 30,)),
    BottomNavigationBarItem(icon: Image.asset(Assets.iconsFavoriteHomeIcon,width: 30,height: 30,),label: 'المفضله'.tr,
        activeIcon: Image.asset(Assets.iconsFavoriteIcon,width: 30,height: 30,)),
    BottomNavigationBarItem(icon: Image.asset(Assets.iconsSettingHomeIcon,width: 30,height: 30,),label: 'الاعدادات'.tr,
        activeIcon: Image.asset(Assets.iconsSettingHome2,width: 30,height: 30,)),
  ];

}