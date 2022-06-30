
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../componant/CustomTextFieldWidget.dart';
import '../../../../core/constant/Themes.dart';
import '../../../../generated/assets.dart';

class ForgetPasswordWidget extends StatelessWidget {
  const ForgetPasswordWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return    Padding(
      padding: EdgeInsets.symmetric(horizontal: 15),
      child: Row(
        children: [
          SizedBox(
            width: 200,
            height: 60,
            child: Card(
              elevation: 3,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0),
              ),
              child: Center(
                child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: Text(
                      'forget_code'.tr,
                      style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w700,
                          color: Themes.ColorApp1),
                    )),
              ),
            ),
          ),
        ],
        mainAxisAlignment: MainAxisAlignment.start,
      ),
    );
  }
}

