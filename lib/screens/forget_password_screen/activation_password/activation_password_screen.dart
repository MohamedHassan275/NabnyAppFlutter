
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nabny/componant/CustomTextFieldWidget.dart';
import 'package:nabny/core/servies/storage_service.dart';
import 'package:nabny/core/widget/text_field_activate_code.dart';
import 'package:nabny/screens/forget_password_screen/activation_password/activation_password_controller.dart';
import 'package:nabny/utils/Themes.dart';

import '../../../componant/CustomButtonWidget.dart';
import '../../../core/constant/constant.dart';
import '../../../core/widget/custom_circler_progress_indicator_widget.dart';
import '../../../generated/assets.dart';
import '../chage_password/chage_password_screen.dart';

class ActivationPasswordScreen extends StatefulWidget {
  String? registercode,mobilePhone;
  ActivationPasswordScreen({required this.registercode,required this.mobilePhone});

  @override
  _ActivationPasswordScreenState createState() => _ActivationPasswordScreenState();
}

class _ActivationPasswordScreenState extends State<ActivationPasswordScreen> {

  TextEditingController _Code1 = TextEditingController();
  TextEditingController _Code2 = TextEditingController();
  TextEditingController _Code3 = TextEditingController();
  TextEditingController _Code4 = TextEditingController();

  String? VerificationCodeEn,VerificationCodeAr;

  @override
  Widget build(BuildContext context) {
    final double valueHight = Get.height * .024;
    final double valueWidth = Get.width * .024;

    return Scaffold(
      body: SafeArea(
        child: Container(
          width: Get.width,
          height: Get.height,
          decoration: const BoxDecoration(
              image: const DecorationImage(
                  image: AssetImage(Assets.imagesBackgroundSplash),
                  fit: BoxFit.fill)),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: valueHight * 6.0,
                ),
                Image.asset(
                  Assets.imagesLogoImage,
                  fit: BoxFit.contain,
                ),
                SizedBox(
                  height: valueHight * 5.5,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
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
                                  style: const TextStyle(
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
                ),
                SizedBox(height: valueHight*.2,),
                GetBuilder<ActivationPasswordController>(
                  init: ActivationPasswordController(),
                  builder: (controller) => Container(
                  width: Get.width,
                  color: Colors.white,
                  child: Column(
                    children: [
                      SizedBox(
                        height: valueHight * 1.5,
                      ),
                      Text(
                        '${widget.registercode}',
                        style: const TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w700,
                            color: Themes.ColorApp1),
                      ),
                      SizedBox(
                        height: valueHight * 1,
                      ),
                      Form(
                        key: controller.formKey,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              TextFieldActivateCode(controller: _Code1),
                              const SizedBox(
                                width: 10,
                              ),
                              TextFieldActivateCode(controller: _Code2),
                              const SizedBox(
                                width: 10,
                              ),
                              TextFieldActivateCode(controller: _Code3),
                              const SizedBox(
                                width: 10,
                              ),
                              TextFieldActivateCode(controller: _Code4),
                              const SizedBox(width: 10),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: valueHight * 1,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Row(
                            children: [
                              GestureDetector(
                                onTap: () => setState(() {
                                  // _start == 0 ? startTimer() : startTimer();
                                  print('start Time');
                                }),
                                child: Text(
                                  'resend_code'.tr,
                                  textAlign: TextAlign.start,
                                  style: TextStyle(
                                      fontSize: 16,
                                      color: Themes.ColorApp1),
                                ),
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              // InkWell(
                              //   onTap: () {
                              //     //  startTimer();
                              //   },
                              //   child: Text(
                              //     '00:$_start',
                              //     textAlign: TextAlign.start,
                              //     style:  TextStyle(
                              //         fontSize: 14,
                              //         //    decoration: TextDecoration.underline,
                              //         color: _start == 0
                              //             ? Themes.ColorApp2
                              //             : Themes.ColorApp1,
                              //         fontWeight: FontWeight.w500),
                              //   ),
                              // ),
                            ],
                          ),
                        ],
                      ),
                      SizedBox(
                        height: valueHight * 1,
                      ),
                      CirclerProgressIndicatorWidget(isLoading: controller.isLoading ? true : false),
                      SizedBox(
                        height: valueHight * .5,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 15, vertical: 15),
                        child: CustomButtonImage(
                          hight: 50,
                          title: 'confirm'.tr,
                          onTap: () {
                            VerificationCodeEn = _Code1.text.toString() + _Code2.text.toString()+ _Code3.text.toString() + _Code4.text.toString();
                            VerificationCodeAr = _Code4.text.toString() + _Code3.text.toString()+ _Code2.text.toString() + _Code1.text.toString();

                            if(Get.find<StorageService>().activeLocale.languageCode == 'en'){
                              CustomFlutterToast(VerificationCodeEn);
                              CustomFlutterToast(Get.find<StorageService>().activeLocale.languageCode);
                              Get.find<ActivationPasswordController>().activeCodeByMobilePhone(widget.mobilePhone, VerificationCodeEn);
                            }else if(Get.find<StorageService>().activeLocale.languageCode == 'ar'){
                              CustomFlutterToast(VerificationCodeEn);
                              CustomFlutterToast(Get.find<StorageService>().activeLocale.languageCode);
                              Get.find<ActivationPasswordController>().activeCodeByMobilePhone(widget.mobilePhone, VerificationCodeAr);
                            }


                          },
                        ),
                      ),
                      SizedBox(height: valueHight * .5,)
                    ],
                  ),
                ),)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
