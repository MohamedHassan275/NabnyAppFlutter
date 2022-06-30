
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../componant/CustomTextFieldWidget.dart';
import '../../../../generated/assets.dart';

class CustomTextFieldWidget extends StatefulWidget {
  String? value;
  TextEditingController textEditingController = TextEditingController();

   CustomTextFieldWidget({required this.textEditingController, required this.value});

  @override
  _CustomTextFieldWidgetState createState() => _CustomTextFieldWidgetState();
}

class _CustomTextFieldWidgetState extends State<CustomTextFieldWidget> {
  @override
  Widget build(BuildContext context) {
    return FromTextShared(
        labelText: 'mobile_number'.tr,
        maxLength: 11,
        onChanged: (value) {
          widget.value = value;
        },
        onSaved: (String? value){
          widget.value = value!;
        },
        isPassword: false,
        onTapValidator: (value) {
          if (value!.isEmpty) {
            return 'must_not_empty'.tr;
          } else if (!(value.length > 10)) {
            return 'not_valid'.tr;
          }
          return null;
        },
        namePath: Assets.iconsMobilePhoneIcon,
        width: 25,
        height: 25,
        keyboardType: TextInputType.number,
        Controller: widget.textEditingController,
        hintText: 'mobile_number'.tr);
  }
}
