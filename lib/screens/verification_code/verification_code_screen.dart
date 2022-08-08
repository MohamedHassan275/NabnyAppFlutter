import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nabny/core/constant/constant.dart';
import 'package:nabny/core/servies/storage_service.dart';
import 'package:nabny/generated/assets.dart';
import 'package:nabny/screens/verification_code/verification_code_controller.dart';
import 'package:nabny/utils/Themes.dart';

import '../../componant/CustomButtonWidget.dart';
import '../../componant/CustomTextFieldWidget.dart';
import '../../core/widget/custom_circler_progress_indicator_widget.dart';
import '../../core/widget/text_field_activate_code.dart';
import '../complete_register_screen/complete_register_screen.dart';

class VerificationCodeScreen extends StatefulWidget {
  String? registercode, mobilePhone;

  VerificationCodeScreen(
      {required this.registercode, required this.mobilePhone});

  @override
  _VerificationCodeScreenState createState() => _VerificationCodeScreenState();
}

class _VerificationCodeScreenState extends State<VerificationCodeScreen> {
  TextEditingController _Code1 = TextEditingController();
  TextEditingController _Code2 = TextEditingController();
  TextEditingController _Code3 = TextEditingController();
  TextEditingController _Code4 = TextEditingController();
  String? VerificationCodeEn,VerificationCodeAr;

  // Timer? _timer;
  // int _start = 60;
  //
  // void startTimer() {
  //   const oneSec = const Duration(seconds: 1);
  //   _timer = new Timer.periodic(
  //     oneSec,
  //     (Timer timer) {
  //       if (_start == 0) {
  //         setState(() {
  //           timer.cancel();
  //         });
  //       } else {
  //         setState(() {
  //           _start--;
  //         });
  //       }
  //     },
  //   );
  // }
  //
  // @override
  // void initState() {
  //   // TODO: implement initState
  //   super.initState();
  //   startTimer();
  // }
  //
  // @override
  // void dispose() {
  //   _timer!.cancel();
  //   super.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    var widthValue = Get.width * .024;
    var heightValue = Get.height * .024;
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: heightValue * 3,
              ),
              GetBuilder<VerificationCodeController>(
                init: VerificationCodeController(),
                builder: (controller) => Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Center(
                          child: Image.asset(
                        Assets.imagesImageConfirmActivation,
                      )),
                      SizedBox(
                        height: heightValue * 3,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'verification_code'.tr,
                            textAlign: TextAlign.start,
                            style: const TextStyle(
                                fontSize: 14,
                                color: Themes.ColorApp5,
                                fontWeight: FontWeight.w500),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'on_mobile'.tr,
                            textAlign: TextAlign.start,
                            style: const TextStyle(
                                fontSize: 14, color: Themes.ColorApp5),
                          ),
                          SizedBox(
                            width: widthValue * .7,
                          ),
                          Text(
                            widget.registercode!,
                            textAlign: TextAlign.start,
                            style: TextStyle(
                                fontSize: 14, color: Themes.ColorApp5),
                          ),
                        ],
                      ),
                       SizedBox(
                        height: heightValue * 1.5,
                      ),
                      Form(
                        key: controller.formKey,
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
                      const SizedBox(
                        height: 35,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Row(
                            children: [
                              GestureDetector(
                                onTap: () {
                                  setState(() {
                                    // startTimer();
                                  });
                                },
                                child: Text(
                                  'resend_code'.tr,
                                  textAlign: TextAlign.start,
                                  style: TextStyle(
                                      fontSize: 16, color: Themes.ColorApp1),
                                ),
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              InkWell(
                                onTap: () {
                                  //  startTimer();
                                },
                                child: Text(
                                  '',
                                  textAlign: TextAlign.start,
                                  style: const TextStyle(
                                      fontSize: 14,
                                      //    decoration: TextDecoration.underline,
                                      color: Themes.ColorApp1,
                                      fontWeight: FontWeight.w500),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      SizedBox(
                        height: heightValue * .2,
                      ),
                      CirclerProgressIndicatorWidget(
                          isLoading: controller.isLoading ? true : false),
                      const SizedBox(height: 15),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 15, vertical: 15),
                        child: CustomButtonImage(
                            hight: 50,
                            title: 'confirm'.tr,
                            onTap: () {
                              VerificationCodeEn = _Code1.text.toString() +
                                  _Code2.text.toString() +
                                  _Code3.text.toString() +
                                  _Code4.text.toString();

                              VerificationCodeAr = _Code4.text.toString() +
                                  _Code3.text.toString() +
                                  _Code2.text.toString() +
                                  _Code1.text.toString();

                              if (Get.find<StorageService>().activeLocale.languageCode == 'en'){
                                // CustomFlutterToast(VerificationCodeEn);
                                // CustomFlutterToast(Get.find<StorageService>().activeLocale.languageCode);
                                Get.find<VerificationCodeController>().activeCodeByMobilePhone(widget.mobilePhone, VerificationCodeEn);
                              }else if (Get.find<StorageService>().activeLocale.languageCode == 'ar'){
                                // CustomFlutterToast(VerificationCodeAr);
                                // CustomFlutterToast(Get.find<StorageService>().activeLocale.languageCode);
                                Get.find<VerificationCodeController>().activeCodeByMobilePhone(widget.mobilePhone, VerificationCodeAr);
                              }

                            }),
                      ),
                    ],
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
