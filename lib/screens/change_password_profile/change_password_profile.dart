
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:nabny/screens/setting_profile_screen/setting_profile_screen.dart';

import '../../componant/CustomButtonWidget.dart';
import '../../componant/CustomTextFieldWidget.dart';
import '../../utils/Themes.dart';
import '../home_main_screen/home_main_screen.dart';

class ChangePasswordProfile extends StatefulWidget {
  const ChangePasswordProfile({Key? key}) : super(key: key);

  @override
  _ChangePasswordProfileState createState() => _ChangePasswordProfileState();
}

class _ChangePasswordProfileState extends State<ChangePasswordProfile> {

  TextEditingController CurrentPassword = TextEditingController();
  TextEditingController Password = TextEditingController();
  TextEditingController ConfirmPassword = TextEditingController();
  String? currentPassword, password, confirmPassword;
  FocusNode? _focusNodeCurrentPassword;
  FocusNode? _focusNodePassword;
  FocusNode? _focusNodeConfirmPassword;
  bool isCurrentPassword = true;
  bool isPassword = true;
  bool isConfirmPassword = true;
  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    var widthValue = Get.width * 0.024;
    var heightValue = Get.height * 0.024;

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            width: Get.width,
            height: Get.height,
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
                      child: const Center(
                        child: Text(
                          'تعديل كلمه المرور ',
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
                        onTap: ()=>Get.off(const SettingProfileScreen()),
                        child: const CircleAvatar(
                          backgroundColor: Themes.whiteColor,
                          child: Icon(Icons.arrow_right_alt_rounded,color: Colors.black87,),
                        ),
                      ),
                    )
                  ],
                ),
                SizedBox(height: heightValue * 1.5,),
                FromTextRegisterShared(
                  //  textAlign: TextAlign.center,
                  labelText: 'كلمة المرور الحالية',
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
                      currentPassword = value;
                    });
                  },
                  isPassword: isCurrentPassword,
                  onTapValidator: (value) {
                    if (value!.isEmpty) {
                      return 'كلمة المرور فارغة';
                    } else if (value.length <= 6) {
                      return 'كلمة المرور قصيرة';
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
                  hintText: 'كلمة المرور الحالية',
                ),
                SizedBox(
                  height: heightValue * 1,
                ),
                FromTextRegisterShared(
                  //  textAlign: TextAlign.center,
                  labelText: 'كلمة المرور الجديدة',
                  onTapFunction: () {
                    setState(() {
                      FocusScope.of(context).unfocus();
                      FocusScope.of(context)
                          .requestFocus(_focusNodePassword);
                    });
                  },
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
                  hintText: 'كلمة المرور الجديدة',
                ),
                SizedBox(
                  height: heightValue * 1,
                ),
                FromTextRegisterShared(
                  //  textAlign: TextAlign.center,
                  labelText: 'تأكيد كلمة المرور الجديدة',
                  onTapFunction: () {
                    setState(() {
                      FocusScope.of(context).unfocus();
                      FocusScope.of(context).requestFocus(
                          _focusNodeConfirmPassword);
                    });
                  },
                  focusNode: _focusNodeConfirmPassword,
                  onChanged: (value) {
                    setState(() {
                      confirmPassword = value;
                    });
                  },
                  isPassword: isConfirmPassword,
                  onTapValidator: (value) {
                    if (value!.isEmpty) {
                      return 'تأكيد كلمة المرور الجديدة';
                    } else if (value.length <= 6) {
                      return 'تأكيد كلمة المرور الجديدة';
                    } else if (!(value.contains(Password.text))) {
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
                  hintText: 'تأكيد كلمة المرور الجديدة',
                ),
                SizedBox(
                  height: heightValue * 1,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 15, vertical: 15),
                  child: CustomButtonImage(
                    hight: 50,
                    title: 'تغير كلمة المرور',
                    onTap: () async{
                      //  showProgressbar = false;
                      if (formKey.currentState!.validate()){
                        Fluttertoast.showToast(
                          msg: 'تم تغير كلمة المرور بنجاح',
                          fontSize: 15,
                          backgroundColor: Themes.ColorApp14,
                          gravity: ToastGravity.BOTTOM,
                          textColor: Themes.ColorApp1,
                          timeInSecForIosWeb: 1,
                          toastLength: Toast.LENGTH_SHORT,
                        );
                        Get.to(HomeMainScreen(valueBack: ''));
                      }
                    },
                  ),
                ),
                SizedBox(
                  height: 16,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
