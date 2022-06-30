
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nabny/generated/assets.dart';
import 'package:nabny/screens/forget_password_screen/chage_password/chage_password_controller.dart';
import 'package:nabny/screens/forget_password_screen/chage_password/widget/custom_change_password_widget.dart';
import 'package:nabny/screens/login_screen/login_screen.dart';

import '../../../componant/CustomButtonWidget.dart';
import '../../../componant/CustomTextFieldWidget.dart';
import '../../../utils/Themes.dart';

class ChagePasswordScreen extends StatefulWidget {
  String? mobilePhone;
   ChagePasswordScreen({required this.mobilePhone});

  @override
  _ChagePasswordScreenState createState() => _ChagePasswordScreenState();
}

class _ChagePasswordScreenState extends State<ChagePasswordScreen> {

  TextEditingController Password = TextEditingController();
  FocusNode? _focusNodePassword;
  FocusNode? _focusNodeConfirmPassword;
  TextEditingController ConfirmPassword = TextEditingController();
  String? password, confirmPassword;
  bool isPassword = true;
  bool isConfirmPassword = true;
  bool isCheckAccepted = false;
  var formKey = GlobalKey<FormState>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print('this is my phone ${widget.mobilePhone}');
  }
  @override
  Widget build(BuildContext context) {
    var widthValue = Get.width * 0.024;
    var heightValue = Get.height * 0.024;
    double paddingWidget = heightValue * 10;

    return Scaffold(
      body: SafeArea(
        child: Container(
          width: Get.width,
          height: Get.height,
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(Assets.imagesBackgroundSplash),
                  fit: BoxFit.fill)),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: heightValue * 6.0,
                ),
                Image.asset(
                  Assets.imagesLogoImage,
                  fit: BoxFit.contain,
                ),
                SizedBox(
                  height: heightValue * 5.5,
                ),
              const ForgetPasswordWidget(),
                SizedBox(height: heightValue*.2,),
                GetBuilder<ChangePasswordController>(
                  init: ChangePasswordController(),
                    builder: (controller) => Container(
                  width: Get.width,
                  color: Colors.white,
                  child: Form(
                    key: controller.formKey,
                    child: Column(
                      children: [
                        SizedBox(
                          height: heightValue * 2,
                        ),
                        FromTextShared(
                          //  textAlign: TextAlign.center,
                          labelText: 'password'.tr,
                          onTapFunction: () {
                            setState(() {
                              FocusScope.of(context).unfocus();
                              FocusScope.of(context)
                                  .requestFocus(_focusNodePassword);
                            });
                          },
                          namePath: Assets.iconsPasswordIcon,
                          width: 25,
                          height: 25,
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
                        FromTextShared(
                          //  textAlign: TextAlign.center,
                          labelText: 'confirm_password'.tr,
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
                          namePath: Assets.iconsPasswordIcon,
                          width: 25,
                          height: 25,
                          isPassword: isConfirmPassword,
                          onTapValidator: (value) {
                            if (value!.isEmpty) {
                              return 'تأكيد كلمة المرور فارغة';
                            } else if (value.length <= 6) {
                              return ' تأكيد كلمة المرور قصيرة';
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
                          hintText: 'confirm_password'.tr,
                        ),
                        SizedBox(
                          height: heightValue * 1,
                        ),
                        Visibility(
                          visible: controller.isLoading ? true : false,
                          child: Container(
                              decoration: const BoxDecoration(
                                // image: DecorationImage(
                                //     image: AssetImage(Assets
                                //         .imagesBackgroundRequestReviewFatora),
                                //     fit: BoxFit.contain),
                                  color: Colors.transparent),
                              child: const Center(
                                  child: CircularProgressIndicator(
                                    color: Themes.ColorApp1,
                                  ))),
                        ),
                        SizedBox(
                          height: heightValue * .5,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 15, vertical: 15),
                          child: CustomButtonImage(
                            hight: 50,
                            title: 'confirm'.tr,
                            onTap: () => Get.find<ChangePasswordController>().changePasswordByForgetPassword(widget.mobilePhone,Password.text)
                          ),
                        ),
                        SizedBox(
                          height: 16,
                        ),
                      ],
                    ),
                  ),
                )),
              ],
            ),
          ),
        ),
      ),
    );
  }
}


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

