

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../utils/Themes.dart';

class CustomPageViewItem extends StatelessWidget {

  final String? title;

  const CustomPageViewItem({required this.title});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(height: MediaQuery.of(context).size.height * .024 * 1,),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Container(
            width: Get.width,
            height: 135,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(topLeft: Radius.circular(15), topRight: Radius.circular(15))),
            child: Center(
              child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Text(
                    title!,
                    style: TextStyle(
                      fontSize: 19,
                      color: Themes.ColorApp2,
                      fontWeight: FontWeight.w500,
                    ),
                    textAlign: TextAlign.left,
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
