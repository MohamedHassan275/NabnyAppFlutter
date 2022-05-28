
import 'package:flutter/material.dart';
import 'package:nabny/generated/assets.dart';
import 'package:nabny/screens/IntroPage/Widget/CustomPageViewItem.dart';

class CustomPageView extends StatelessWidget {
  final PageController? pageController;
  const CustomPageView({required this.pageController});

  final String? textIntro =
      'وريم ايبسوم هو نموذج افتراضي يوضع في التصاميم لتعرض على العميل ليتصور طريقه وضع النصوص بالتصاميم';

  @override
  Widget build(BuildContext context) {
    return PageView(
      controller: pageController,
      children: [
        CustomPageViewItem(title: textIntro,),
        CustomPageViewItem(title: textIntro,),
        CustomPageViewItem(title: textIntro,)
      ],
    );
  }
}
