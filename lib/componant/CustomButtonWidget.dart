import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nabny/generated/assets.dart';
import 'package:nabny/utils/style.dart';

import '../utils/Themes.dart';

class CustomGeneralButton extends StatelessWidget {
  const CustomGeneralButton({Key? key, this.text, this.onTap})
      : super(key: key);
  final String? text;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 60,
        width: Get.width,
        decoration: BoxDecoration(
          color: primaryColor,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Center(
          child: Text(
            text!,
            style: TextStyle(
              fontSize: 14,
              color: const Color(0xffffffff),
              fontWeight: FontWeight.w500,
            ),
            textAlign: TextAlign.left,
          ),
        ),
      ),
    );
  }
}

class FromButtonShared extends StatelessWidget {
  Function()? onPressed;
  double? width, height, sizeText;
  Color? color, TextColors;
  String? buttonText;

  FromButtonShared(
      {required this.onPressed,
      this.width,
      required this.height,
      this.sizeText,
      this.color,
      this.TextColors,
      required this.buttonText});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      child: MaterialButton(
        onPressed: onPressed,
        height: height,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        color: color,
        textColor: TextColors,
        child: Center(
            child: Text(
          buttonText!,
          style: TextStyle(
            fontSize: sizeText,
            fontWeight: FontWeight.w500,
          ),
        )),
      ),
    );
  }
}

class CustomButtonImage extends StatelessWidget {
  CustomButtonImage({required this.title,required this.hight,required this.onTap});
  double hight;
  String title;
   VoidCallback? onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: Get.width,
        height: hight,
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage(Assets.imagesButtonRegister)
            )),
        child: Center(
          child: Text(title,style: TextStyle(
            color: Themes.whiteColor,
            fontSize: 16,
            fontWeight: FontWeight.w400,
          )),
        ),
      ),
    );
  }
}

class CustomButtonImage2 extends StatelessWidget {
  CustomButtonImage2({required this.title,required this.hight,required this.width, required this.onTap});
  double hight,width;
  String title;
  VoidCallback? onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: hight,
        width: width,
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage(Assets.imagesButtonRegister),
                fit: BoxFit.fill
            ),
        borderRadius: BorderRadius.circular(25)),
        child: Center(
          child: Text(title,style: TextStyle(
            color: Themes.whiteColor,
            fontSize: 14,
            fontWeight: FontWeight.w400,
          )),
        ),
      ),
    );
  }
}

class defaultButton extends StatelessWidget {
  defaultButton(
      {this.width, this.isUpperCase, this.radius, this.onPressed, this.text});

  double? width = double.infinity;
  bool? isUpperCase = true;
  double? radius = 3.0;
  Function()? onPressed;
  String? text;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50.0,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(radius!),
          color: Colors.pink[700]),
      child: MaterialButton(
        onPressed: onPressed,
        child: Text(
          text!,
          style: TextStyle(
            color: Colors.white,
            fontSize: 15,
          ),
        ),
      ),
    );
  }
}
