import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import 'package:get/get.dart';
import 'package:nabny/utils/Themes.dart';

import '../core/constant/style.dart';

class LoadingWidget extends StatelessWidget {
   LoadingWidget({Key? key, required this.data}) : super(key: key);
   String? data;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: Get.width,
      height: Get.height,
      decoration: const BoxDecoration(color: Colors.white),
      child:  Center(
          child: Column(
            children: [
              Text(data!),
              SpinKitCircle(
        color: Themes.ColorApp1,
      ),
            ],
          )),
    );
  }
}

class SmallLoadingWidget extends StatelessWidget {
  const SmallLoadingWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Get.width,
      height: Get.height / 8,
      decoration: const BoxDecoration(color: Colors.white),
      child: const Center(
          child: SpinKitCircle(
        color: primaryColor,
      )),
    );
  }
}
