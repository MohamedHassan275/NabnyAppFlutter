
import 'package:flutter/material.dart';
import 'package:nabny/core/constant/Themes.dart';


class CirclerProgressIndicatorWidget extends StatelessWidget {
   CirclerProgressIndicatorWidget({required this.isLoading});
   bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: isLoading,
      child: Container(
          decoration: const BoxDecoration(
            // image: DecorationImage(
            //     image: AssetImage(Assets
            //         .imagesBackgroundRequestReviewFatora),
            //     fit: BoxFit.contain),
              color: Colors.transparent),
          child: const Center(
              child: CircularProgressIndicator(
                color: Themes.ColorApp1,
              ))),
    );
  }
}
