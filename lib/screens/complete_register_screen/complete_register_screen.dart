import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:nabny/core/constant/constant.dart';
import 'package:nabny/core/localization/local_controller.dart';
import 'package:nabny/core/servies/storage_service.dart';
import 'package:nabny/generated/assets.dart';
import 'package:nabny/screens/complete_register_screen/complete_register_controller.dart';
import 'package:nabny/screens/register_screen/register_screen.dart';
import 'package:nabny/screens/success_register_screen/success_register_screen.dart';
import 'package:nabny/utils/Themes.dart';

import '../../componant/CustomButtonWidget.dart';
import '../../componant/CustomTextFieldWidget.dart';
import '../../core/widget/custom_circler_progress_indicator_widget.dart';

class CompleteRegisterScreen extends StatefulWidget {
  String mobilePhone;
  CompleteRegisterScreen({required this.mobilePhone});

  @override
  _CompleteRegisterScreenState createState() => _CompleteRegisterScreenState();
}

class _CompleteRegisterScreenState extends State<CompleteRegisterScreen> {
  TextEditingController FirstName = TextEditingController();
  TextEditingController LastName = TextEditingController();
  TextEditingController Email = TextEditingController();
  TextEditingController Password = TextEditingController();
  TextEditingController ConfirmPassword = TextEditingController();
  FocusNode? _focusNodePassword;
  FocusNode? _focusNodeConfirmPassword;
  bool isPassword = true;
  bool isConfirmPassword = true;
  bool isCheckAccepted = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var widthValue = Get.width * 0.024;
    var heightValue = Get.height * 0.024;
    double paddingWidget = heightValue * 10;

    return Scaffold(
      body: SafeArea(
        child: Container(
          height: Get.height,
          width: Get.width,
          decoration: const BoxDecoration(
            image: const DecorationImage(
                image: AssetImage(Assets.imagesBackgroundSplash),
                fit: BoxFit.fill),
          ),
          child: Column(
            children: [
              SizedBox(
                height: heightValue * 5,
              ),
              Flexible(
                child: GetBuilder<CompleteRegisterController>(
                  init: CompleteRegisterController(),
                    builder: (controller) => Container(
                  decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: const BorderRadius.only(
                          topRight: Radius.circular(50),
                          topLeft: const Radius.circular(50))),
                  child: Container(
                    width: Get.width,
                    height: Get.height,
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          const SizedBox(
                            height: 6,
                          ),
                          Container(
                            height: 200,
                            decoration: const BoxDecoration(
                                color: Themes.ColorApp4,
                                borderRadius: const BorderRadius.only(
                                    topRight: Radius.circular(50),
                                    topLeft: Radius.circular(50))),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                GestureDetector(
                                  onTap: () => Get.to(RegisterScreen()),
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 25, vertical: 25),
                                    child: CircleAvatar(
                                      backgroundColor: Themes.ColorApp5,
                                      radius: 25,
                                      child: Icon(
                                        Get.find<StorageService>().activeLocale.languageCode == "en" ? Icons.keyboard_arrow_right : Icons.keyboard_arrow_left,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: heightValue * 2,
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 25),
                                  child: Row(
                                    mainAxisAlignment:
                                    MainAxisAlignment.start,
                                    children: [
                                      Text(
                                        'account_information'.tr,
                                        style: const TextStyle(
                                            fontSize: 17,
                                            fontWeight: FontWeight.w700,
                                            color: Themes.ColorApp1),
                                      ),
                                    ],
                                  ),
                                ),
                                // SizedBox(
                                //   height: heightValue * 1.5,
                                // ),
                                // Padding(
                                //   padding: const EdgeInsets.symmetric(
                                //       horizontal: 25),
                                //   child: Row(
                                //     mainAxisAlignment:
                                //     MainAxisAlignment.start,
                                //     children: [
                                //       Text(
                                //         widget.mobilePhone,
                                //         style: const TextStyle(
                                //             fontSize: 17,
                                //             fontWeight: FontWeight.w700,
                                //             color: Themes.ColorApp1),
                                //       ),
                                //     ],
                                //   ),
                                // ),
                              ],
                            ),
                          ),
                          Form(
                            key: controller.formKey,
                              child: Column(
                            children: [
                              SizedBox(
                                height: heightValue * 2,
                              ),
                              FromTextRegisterShared(
                                  labelText: 'first_name'.tr,
                                  readOnly: false,
                                  isPassword: false,
                                  onTapValidator: (value) {
                                    if (value!.isEmpty) {
                                      return 'must_not_empty'.tr;
                                    }
                                    return null;
                                  },
                                  keyboardType: TextInputType.text,
                                  Controller: FirstName,
                                  hintText: 'first_name'.tr),
                              SizedBox(
                                height: heightValue * 1,
                              ),
                              FromTextRegisterShared(
                                  labelText: 'last_name'.tr,
                                  readOnly: false,
                                  onTapValidator: (value) {
                                    if (value!.isEmpty) {
                                      return 'must_not_empty'.tr;
                                    }
                                    return null;
                                  },
                                  isPassword: false,
                                  keyboardType: TextInputType.text,
                                  Controller: LastName,
                                  hintText: 'last_name'.tr),
                              SizedBox(
                                height: heightValue * 1,
                              ),
                              FromTextRegisterShared(
                                  labelText: 'email_address'.tr,
                                  onTapValidator: (value) {
                                    if (value!.isEmpty) {
                                      return 'must_not_empty'.tr;
                                    } else if (!(value.contains("@"))) {
                                      return 'not_valid'.tr;
                                    }
                                    return null;
                                  },
                                  readOnly: false,
                                  isPassword: false,
                                  keyboardType: TextInputType.emailAddress,
                                  Controller: Email,
                                  hintText: 'email_address'.tr),
                              SizedBox(
                                height: heightValue * 1,
                              ),
                              FromTextRegisterShared(
                                //  textAlign: TextAlign.center,
                                labelText: 'password'.tr,
                                onTapFunction: () {
                                  setState(() {
                                    FocusScope.of(context).unfocus();
                                    FocusScope.of(context)
                                        .requestFocus(_focusNodePassword);
                                  });
                                },
                                readOnly: false,
                                focusNode: _focusNodePassword,
                                isPassword: isPassword,
                                onTapValidator: (value) {
                                  if (value!.isEmpty) {
                                    return 'must_not_empty'.tr;
                                  } else if (value.length <= 5) {
                                    return 'short_password'.tr;
                                  }
                                  return null;
                                },
                                suffixIcon: isPassword
                                    ? Icons.visibility_sharp
                                    : Icons.visibility_off,
                                onTapsuffixIcon: () {
                                  setState(() {
                                    isPassword = !isPassword;
                                  });
                                },
                                keyboardType: TextInputType.text,
                                maxLines: 1,
                                Controller: Password,
                                hintText: 'password'.tr,
                              ),
                              SizedBox(
                                height: heightValue * 1,
                              ),
                              FromTextRegisterShared(
                                //  textAlign: TextAlign.center,
                                labelText: 'confirm_password'.tr,
                                onTapFunction: () {
                                  setState(() {
                                    FocusScope.of(context).unfocus();
                                    FocusScope.of(context).requestFocus(
                                        _focusNodeConfirmPassword);
                                  });
                                },
                                readOnly: false,
                                focusNode: _focusNodeConfirmPassword,
                                isPassword: isConfirmPassword,
                                onTapValidator: (value) {
                                  if (value!.isEmpty) {
                                    return 'must_not_empty'.tr;
                                  } else if (value.length <= 5) {
                                    return 'short_password'.tr;
                                  } else if (!(value
                                      .contains(Password.text))) {
                                    return 'Password_does_not_match'.tr;
                                  }
                                  return null;
                                },
                                suffixIcon: isConfirmPassword
                                    ? Icons.visibility_sharp
                                    : Icons.visibility_off,
                                onTapsuffixIcon: () {
                                  setState(() {
                                    isConfirmPassword = !isConfirmPassword;
                                  });
                                },
                                keyboardType: TextInputType.text,
                                maxLines: 1,
                                Controller: ConfirmPassword,
                                hintText: 'confirm_password'.tr,
                              ),
                              SizedBox(
                                height: heightValue * 1,
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 25),
                                child: Row(
                                  children: [
                                    Theme(
                                        data: ThemeData(
                                            unselectedWidgetColor:
                                            Themes.ColorApp1),
                                        child: Checkbox(
                                            value: isCheckAccepted,
                                            tristate: false,
                                            shape: RoundedRectangleBorder(
                                                borderRadius:
                                                BorderRadius.circular(5)),
                                            side: const BorderSide(
                                                color: Themes.ColorApp1,
                                                width: 2.0),
                                            activeColor: Themes.ColorApp1,
                                            onChanged: (bool? value) {
                                              setState(() {
                                                isCheckAccepted = value!;
                                              });
                                            })),
                                    InkWell(
                                      onTap: () {
                                        // _modalBottomSheetMenu();
                                      },
                                      child: Text(
                                        "agree_to_terms".tr,
                                        style: const TextStyle(
                                          color: Themes.ColorApp1,
                                          fontWeight: FontWeight.w400,
                                          fontSize: 15,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: heightValue * .2,
                              ),
                              CirclerProgressIndicatorWidget(isLoading: controller.isLoading ? true : false),
                              SizedBox(
                                height: heightValue * 1,
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 15, vertical: 15),
                                child: CustomButtonImage(
                                    hight: 50,
                                    title: 'register'.tr,
                                    onTap: () {
                                        // CustomFlutterToast(widget.mobilePhone);
                                        // CustomFlutterToast(FirstName.text);
                                        // CustomFlutterToast(LastName.text);
                                        // CustomFlutterToast(Email.text);
                                        // CustomFlutterToast(Password.text);
                                        // CustomFlutterToast('token');
                                      isCheckAccepted == true ? controller.createAccount(widget.mobilePhone, FirstName.text,
                                          LastName.text, Email.text, Password.text) : CustomFlutterToast('agree_to_terms2'.tr);
                                    }
                                ),
                              ),
                              const SizedBox(
                                height: 16,
                              ),
                            ],
                          ))
                        ],
                      ),
                    ),
                  ),
                )),
              )
            ],
          ),
        ),
      ),
    );
  }
}
