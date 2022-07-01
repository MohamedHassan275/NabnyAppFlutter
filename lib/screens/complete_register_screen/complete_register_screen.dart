import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:nabny/core/localization/local_controller.dart';
import 'package:nabny/generated/assets.dart';
import 'package:nabny/screens/register_screen/register_screen.dart';
import 'package:nabny/screens/success_register_screen/success_register_screen.dart';
import 'package:nabny/utils/Themes.dart';

import '../../componant/CustomButtonWidget.dart';
import '../../componant/CustomTextFieldWidget.dart';

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
  String? firstName, lastName, email, password, confirmPassword;
  FocusNode? _focusNodePassword;
  FocusNode? _focusNodeConfirmPassword;
  bool isPassword = true;
  bool isConfirmPassword = true;
  bool isCheckAccepted = false;
  var formKey = GlobalKey<FormState>();

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
                child: Container(
                  decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: const BorderRadius.only(
                          topRight: Radius.circular(50),
                          topLeft: const Radius.circular(50))),
                  child: Container(
                    width: Get.width,
                    height: Get.height,
                    child: Form(
                      key: formKey,
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            const SizedBox(
                              height: 6,
                            ),
                            GetBuilder<MyLocalController>(
                              init: MyLocalController(),
                                builder: (myLocalController) => Container(
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
                                    onTap: () => Get.to(const RegisterScreen()),
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 25, vertical: 25),
                                      child: CircleAvatar(
                                        backgroundColor: Themes.ColorApp5,
                                        radius: 25,
                                        child: Icon(
                                          myLocalController.language!.languageCode == 'en' ? Icons.subdirectory_arrow_right : Icons.subdirectory_arrow_left,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: heightValue * 3,
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
                                ],
                              ),
                            )),
                            Column(
                              children: [
                                SizedBox(
                                  height: heightValue * 2,
                                ),
                                FromTextRegisterShared(
                                    labelText: 'first_name'.tr,
                                    onChanged: (value) {
                                      setState(() {
                                        firstName = value;
                                      });
                                    },
                                    readOnly: false,
                                    isPassword: false,
                                    onTapValidator: (value) {
                                      if (value!.isEmpty) {
                                        return 'الاسم الاول فارغ';
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
                                    onChanged: (value) {
                                      setState(() {
                                        lastName = value;
                                      });
                                    },
                                    readOnly: false,
                                    onTapValidator: (value) {
                                      if (value!.isEmpty) {
                                        return 'اسم العائله فارغ';
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
                                    onChanged: (value) {
                                      setState(() {
                                        email = value;
                                      });
                                    },
                                    onTapValidator: (value) {
                                      if (value!.isEmpty) {
                                        return 'البريد الالكتروني فارغ';
                                      } else if (!(value.contains("@"))) {
                                        return 'البريد الالكتروني غير صالح';
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
                                  onChanged: (value) {
                                    setState(() {
                                      password = value;
                                    });
                                  },
                                  isPassword: isPassword,
                                  onTapValidator: (value) {
                                    if (value!.isEmpty) {
                                      return 'كلمة المرور فارغة';
                                    } else if (value.length <= 6) {
                                      return 'كلمة المرور قصيرة';
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
                                  onChanged: (value) {
                                    setState(() {
                                      confirmPassword = value;
                                    });
                                  },
                                  isPassword: isConfirmPassword,
                                  onTapValidator: (value) {
                                    if (value!.isEmpty) {
                                      return 'تأكيد كلمة المرور';
                                    } else if (value.length <= 6) {
                                      return 'تأكيد كلمة المرور';
                                    } else if (!(value
                                        .contains(Password.text))) {
                                      return ' كلمة المرور غير متطابقة';
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
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 15, vertical: 15),
                                  child: CustomButtonImage(
                                    hight: 50,
                                    title: 'register'.tr,
                                    onTap: () async {
                                      //  showProgressbar = false;
                                      if (formKey.currentState!.validate()) {
                                        if (isCheckAccepted) {
                                          Get.to(const SuccessRegisterScreen());
                                        } else {
                                          Fluttertoast.showToast(
                                            msg: 'agree_to_terms2'.tr,
                                            fontSize: 15,
                                            backgroundColor: Themes.whiteColor,
                                            gravity: ToastGravity.BOTTOM,
                                            textColor: Themes.ColorApp1,
                                            timeInSecForIosWeb: 1,
                                            toastLength: Toast.LENGTH_SHORT,
                                          );
                                        }
                                      }
                                    },
                                  ),
                                ),
                                const SizedBox(
                                  height: 16,
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
