
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nabny/generated/assets.dart';
import 'package:nabny/screens/home_screen/home_screen.dart';

class HomeMainController extends ChangeNotifier {

  int? indexPage = 0;

  List<Widget> PageList = [HomeScreen(),HomeScreen(),HomeScreen(),HomeScreen()];

  List<BottomNavigationBarItem> navigationItem = [
    BottomNavigationBarItem(icon: Image.asset(Assets.iconsNextPage),label: 'home'.tr,activeIcon: Image.asset('name')),
    BottomNavigationBarItem(icon: Image.asset(Assets.iconsNextPage),label: 'home'.tr,activeIcon: Image.asset('name')),
    BottomNavigationBarItem(icon: Image.asset(Assets.iconsNextPage),label: 'home'.tr,activeIcon: Image.asset('name')),
    BottomNavigationBarItem(icon: Image.asset(Assets.iconsNextPage),label: 'home'.tr,activeIcon: Image.asset('name')),
  ];

}