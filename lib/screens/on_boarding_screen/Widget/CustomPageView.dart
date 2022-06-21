import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nabny/controller/OnBoardingController.dart';
import 'package:nabny/generated/assets.dart';
import 'package:nabny/model/onBoardingListModel.dart';
import 'package:nabny/screens/on_boarding_screen/Widget/custom_page_view_item.dart';
import 'package:nabny/utils/Themes.dart';


class CustomPageView extends StatelessWidget {

 PageController? controller;
 CustomPageView({required this.controller});

  @override
  Widget build(BuildContext context) {
    return PageView(
      controller: controller,
      children: [
        CustomPageViewItem(title: 'وريم ايبسوم هو نموذج افتراضي يوضع في التصاميم لتعرض على العميل ليتصور طريقه وضع النصوص بالتصاميم',),
        CustomPageViewItem(title: 'وريم ايبسوم هو نموذج افتراضي يوضع في التصاميم لتعرض على العميل ليتصور طريقه وضع النصوص بالتصاميم',),
        CustomPageViewItem(title: 'وريم ايبسوم هو نموذج افتراضي يوضع في التصاميم لتعرض على العميل ليتصور طريقه وضع النصوص بالتصاميم',),
        CustomPageViewItem(title: 'وريم ايبسوم هو نموذج افتراضي يوضع في التصاميم لتعرض على العميل ليتصور طريقه وضع النصوص بالتصاميم',),
      ],
    );
  }
}
