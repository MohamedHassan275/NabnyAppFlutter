import 'package:flutter/material.dart';
import 'package:nabny/screens/on_boarding_screen/widget/page_view_item.dart';

class CustomPageView extends StatelessWidget {
  const CustomPageView({required this.pageController}) ;
  final PageController? pageController;

 final String? textIntro =
      'وريم ايبسوم هو نموذج افتراضي يوضع في التصاميم لتعرض على العميل ليتصور طريقه وضع النصوص بالتصاميم';


  @override
  Widget build(BuildContext context) {
    return PageView(
      children: [
        PageViewItem(title:textIntro,),
        PageViewItem(title:textIntro,),
        PageViewItem(title:textIntro,),
      ],
    );
  }

}

