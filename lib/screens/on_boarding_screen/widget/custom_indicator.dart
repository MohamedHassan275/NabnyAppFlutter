import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';

class CustomIndicator extends StatelessWidget {
  const CustomIndicator({@required this.dotIndex});
  final double? dotIndex;
  @override
  Widget build(BuildContext context) {
    return DotsIndicator(
      decorator: DotsDecorator(
          color: Colors.transparent,
          activeColor: Colors.lightBlue.shade700,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
            side: BorderSide(color: Colors.lightBlue.shade700),
          )),
      dotsCount: 3,
      position: dotIndex!,
    );
  }
}
