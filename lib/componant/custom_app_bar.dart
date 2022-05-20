import 'package:flutter/material.dart';
import 'package:nabny/screens/home_main_screen/home_main_screen.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';
import 'package:sizer/sizer.dart';

import '../utils/style.dart';

AppBar customAppBar(BuildContext context) {
  return AppBar(
    iconTheme: const IconThemeData(color: blackColor),
    backgroundColor: Colors.white,
    elevation: 5,
    centerTitle: true,
    title: const Text(
      "Bneksy",
      style: TextStyle(
        color: blackColor,
      ),
    ),
    actions: [
      IconButton(
        padding: EdgeInsets.zero,
        onPressed: () {
          pushNewScreen(
            context,
            withNavBar: true,
            screen: HomeMainScreen(),
          );
        },
        icon: Image.asset(
          "assets/icons/like.png",
          height: 5.h,
          color: blackColor,
        ),
      ),
      IconButton(
        padding: EdgeInsets.zero,
        onPressed: () {},
        icon: Image.asset(
          "assets/icons/messages.png",
          height: 5.h,
          color: blackColor,
        ),
      ),
    ],
  );
}
