

import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';

import '../../../utils/Themes.dart';

class CustomIndicator extends StatelessWidget {
  final double? valuePosition;
  const CustomIndicator({required this.valuePosition});

  @override
  Widget build(BuildContext context) {
    return DotsIndicator(dotsCount: 3,
      decorator: DotsDecorator(
          color: Colors.transparent,
          activeColor: Themes.ColorApp1,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
            side: BorderSide(color: Themes.ColorApp1),
          )),
    position: valuePosition!,);
  }
}
