

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../utils/Themes.dart';

class CustomPageViewItem extends StatelessWidget {

  final String? title;

  const CustomPageViewItem({required this.title});

  @override
  Widget build(BuildContext context) {
    double doubleHeight = Get.height * 0.024 * 2.5;
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(height: Get.height * .024 * 10.5,),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15 , vertical: 15),
          child: Container(
            width: Get.width,
            height: 185,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(topLeft: Radius.circular(15), topRight: Radius.circular(15))),
            child: Center(
              child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15 , vertical: doubleHeight),
                  child: Text(
                    title!,
                    style: TextStyle(
                      fontSize: 17,
                      color: Themes.ColorApp8,
                      fontWeight: FontWeight.w500,
                    ),
                    textAlign: TextAlign.center,
                  ),
              ),
            ),
          ),
        ),
        SizedBox(height: MediaQuery.of(context).size.height * .024 * 1,),
      ],
    );
  }
}
