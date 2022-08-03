
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:nabny/core/localization/local_controller.dart';
import 'package:nabny/core/servies/storage_service.dart';
import 'package:nabny/core/widget/custom_circler_progress_indicator_widget.dart';
import 'package:nabny/screens/change_password_profile/change_password_controller.dart';
import 'package:nabny/screens/setting_profile_screen/setting_profile_screen.dart';

import '../../componant/CustomButtonWidget.dart';
import '../../componant/CustomTextFieldWidget.dart';
import '../../core/constant/constant.dart';
import '../../utils/Themes.dart';
import '../home_main_screen/home_main_screen.dart';

class ChangePasswordProfile extends StatefulWidget {
   ChangePasswordProfile({Key? key}) : super(key: key);

  @override
  _ChangePasswordProfileState createState() => _ChangePasswordProfileState();
}

class _ChangePasswordProfileState extends State<ChangePasswordProfile> {

  TextEditingController CurrentPassword = TextEditingController();
  TextEditingController Password = TextEditingController();
  TextEditingController ConfirmPassword = TextEditingController();
  FocusNode? _focusNodeCurrentPassword;
  FocusNode? _focusNodePassword;
  FocusNode? _focusNodeConfirmPassword;
  bool isCurrentPassword = true;
  bool isPassword = true;
  bool isConfirmPassword = true;

  @override
  Widget build(BuildContext context) {
    var widthValue = Get.width * 0.024;
    var heightValue = Get.height * 0.024;
    ChangePasswordController controller = Get.put(ChangePasswordController());

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            width: Get.width,
            height: Get.height,
            child: Form(
              key: controller.formKey,
              child: Column(
                children: [
                  Stack(
                    children: [
                      Container(
                        width: Get.width,
                        height: 119,
                        decoration: const BoxDecoration(
                            color: Themes.ColorApp14,
                            borderRadius: BorderRadius.only(
                                topLeft: const Radius.circular(35),
                                topRight: const Radius.circular(35))),
                        child:  Center(
                          child: Text(
                            'change_password'.tr,
                            style: TextStyle(
                              color: Themes.ColorApp15,
                              fontSize: 20,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        top: heightValue * 2.3,
                        right: heightValue * 1.5,
                        child: GestureDetector(
                          onTap: ()=>Get.off( SettingProfileScreen()),
                          child:  CircleAvatar(
                            backgroundColor: Themes.whiteColor,
                            child: Icon(
                              Get.find<StorageService>().activeLocale.languageCode == "en" ? Icons.keyboard_arrow_right : Icons.keyboard_arrow_left,
                              color: Colors.black87,),
                          ),
                        ),
                      )
                    ],
                  ),
                  SizedBox(height: heightValue * 1.5,),
                  FromTextRegisterShared(
                    //  textAlign: TextAlign.center,
                    labelText: 'current_password'.tr,
                    onTapFunction: () {
                      setState(() {
                        FocusScope.of(context).unfocus();
                        FocusScope.of(context)
                            .requestFocus(_focusNodeCurrentPassword);
                      });
                    },
                    focusNode: _focusNodeCurrentPassword,
                    onChanged: (value) {
                      setState(() {
                     //   currentPassword = value;
                      });
                    },
                    readOnly: false,
                    isPassword: isCurrentPassword,
                    onTapValidator: (value) {
                      if (value!.isEmpty) {
                        return 'must_not_empty'.tr;
                      } else if (value.length <= 6) {
                        return 'short_password'.tr;
                      }
                      return null;
                    },
                    suffixIcon: isCurrentPassword
                        ? Icons.visibility_sharp
                        : Icons.visibility_off,
                    onTapsuffixIcon: () {
                      setState(() {
                        isCurrentPassword = !isCurrentPassword;
                      });
                    },
                    keyboardType: TextInputType.text,
                    maxLines: 1,
                    Controller: CurrentPassword,
                    hintText: 'current_password'.tr,
                  ),
                  SizedBox(
                    height: heightValue * 1,
                  ),
                  FromTextRegisterShared(
                    //  textAlign: TextAlign.center,
                    labelText: 'new_password'.tr,
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
                       // password = value;
                      });
                    },
                    isPassword: isPassword,
                    onTapValidator: (value) {
                      if (value!.isEmpty) {
                        return 'must_not_empty'.tr;
                      } else if (value.length <= 6) {
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
                    hintText: 'new_password'.tr,
                  ),
                  SizedBox(
                    height: heightValue * 1,
                  ),
                  FromTextRegisterShared(
                    //  textAlign: TextAlign.center,
                    labelText: 'confirm_new_password'.tr,
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
                    //    confirmPassword = value;
                      });
                    },
                    isPassword: isConfirmPassword,
                    onTapValidator: (value) {
                      if (value!.isEmpty) {
                        return 'must_not_empty'.tr;
                      } else if (value.length <= 6) {
                        return 'short_password'.tr;
                      } else if (!(value.contains(Password.text))) {
                        return ' Password_does_not_match'.tr;
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
                    hintText: 'confirm_new_password'.tr,
                  ),
                  SizedBox(
                    height: heightValue * 1,
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
                      title: 'change_password'.tr,
                      onTap: () => Get.find<ChangePasswordController>().changePasswordUser('Bearer '+Get.find<StorageService>().GetToken,
                          CurrentPassword.text, Password.text)
                    ),
                  ),
                  SizedBox(
                    height: heightValue * 1,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
