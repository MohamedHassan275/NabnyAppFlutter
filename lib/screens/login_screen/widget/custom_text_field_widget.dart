
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../componant/CustomTextFieldWidget.dart';
import '../../../../generated/assets.dart';
import '../../../core/constant/Themes.dart';
import '../../forget_password_screen/check_mobile_screen/forget_password_byMobile_screen.dart';
import '../../register_screen/register_screen.dart';

class CustomTextFieldLoginWidget extends StatefulWidget {
  String? value;
  TextEditingController textEditingController = TextEditingController();

   CustomTextFieldLoginWidget({required this.textEditingController, required this.value});

  @override
  _CustomTextFieldLoginWidgetState createState() => _CustomTextFieldLoginWidgetState();
}

class _CustomTextFieldLoginWidgetState extends State<CustomTextFieldLoginWidget> {
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

class ForgetPasswordWidget extends StatelessWidget {
  const ForgetPasswordWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          GestureDetector(
              child: Text('forget_password'.tr,
                  textAlign: TextAlign.start,
                  style: TextStyle(
                    color: Themes.ColorApp6,
                    fontSize: 17,
                  )),
              onTap: () =>  Get.to(const ForgetPasswordByMobile())
          ),
        ],
      ),
    );
  }
}

class FormFieldPasswordWidget extends StatelessWidget {
   FormFieldPasswordWidget({required this.textEditingController,required this.isPassword});
   bool isPassword = false;
   TextEditingController textEditingController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return FromTextShared(
      //  textAlign: TextAlign.center,
      labelText: 'password'.tr,
      isPassword: isPassword,
      onTapValidator: (value) {
        if (value!.isEmpty) {
          return 'must_not_empty'.tr;
        } else if (value.length <= 5) {
          return 'short_password'.tr;
        }
        return null;
      },
      namePath: Assets.iconsPasswordIcon,
      suffixIcon: isPassword
          ? Icons.visibility_sharp
          : Icons.visibility_off,
      keyboardType: TextInputType.text,
      maxLines: 1,
      Controller: textEditingController,
      hintText: 'password'.tr,
    );
  }
}

class CreateAccountFromLogin extends StatelessWidget {
  const CreateAccountFromLogin({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.symmetric(
          horizontal: 25),
      child: Container(
        width: Get.width,
        height: 50,
        decoration: BoxDecoration(
          color: Themes.ColorApp7,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Center(
          child: Row(
            mainAxisAlignment:
            MainAxisAlignment.center,
            children: [
              Text(
                'not_account'.tr,
                style: TextStyle(
                  fontSize: 12,
                  color: Themes.ColorApp2,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                width: 5,
              ),
              InkWell(
                onTap: () => Get.to(RegisterScreen()),
                child: Text(
                  'create_account'.tr,
                  style: TextStyle(
                    fontSize: 14,
                    color: Themes.ColorApp6,
                    fontWeight:
                    FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
