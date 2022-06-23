
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nabny/generated/assets.dart';
import 'package:nabny/screens/home_screen/home_screen.dart';
import 'package:nabny/screens/my_favorite_screen/my_favorite_screen.dart';
import 'package:nabny/screens/my_order_screen/my_order_screen.dart';
import 'package:nabny/screens/setting_screen/setting_screen.dart';

class HomeMainController extends GetxController {


  int? indexPage = 0;

  List<Widget> PageList = [const HomeScreen(),const MyOrderScreen(),const MyFavoriteScreen(),const SettingScreen()];

  List<BottomNavigationBarItem> navigationItem = [
    BottomNavigationBarItem(icon: Image.asset(Assets.iconsIconHome2,width: 30,height: 30,),label: 'home'.tr,
        activeIcon: Image.asset(Assets.iconsHomeIcon,width: 30,height: 30,)),
    BottomNavigationBarItem(icon: Image.asset(Assets.iconsMyOrderHome,width: 30,height: 30,),label: 'my_order'.tr,
        activeIcon: Image.asset(Assets.iconsMyOrderHome2,width: 30,height: 30,)),
    BottomNavigationBarItem(icon: Image.asset(Assets.iconsFavoriteHomeIcon,width: 30,height: 30,),label: 'favorite'.tr,
        activeIcon: Image.asset(Assets.iconsFavoriteIcon,width: 30,height: 30,)),
    BottomNavigationBarItem(icon: Image.asset(Assets.iconsSettingHomeIcon,width: 30,height: 30,),label: 'setting'.tr,
        activeIcon: Image.asset(Assets.iconsSettingHome2,width: 30,height: 30,)),
  ];


}