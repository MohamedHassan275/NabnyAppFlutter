
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nabny/core/widget/custom_circler_progress_indicator_widget.dart';
import 'package:nabny/core/widget/custom_phone_and_password_widget.dart';
import 'package:nabny/screens/login_screen/login_screen.dart';
import 'package:nabny/screens/register_screen/register_controller.dart';
import 'package:nabny/screens/verification_code/verification_code_screen.dart';
import 'package:nabny/utils/Themes.dart';

import '../../componant/CustomButtonWidget.dart';
import '../../componant/CustomTextFieldWidget.dart';
import '../../generated/assets.dart';


class RegisterScreen extends StatelessWidget {
  RegisterScreen({Key? key}) : super(key: key);

  final double valueHight = Get.height * .024;
  final double valueWidth = Get.width * .024;
  FocusNode? _focusNodePassword;
  bool showProgressbar = true;
  bool isPassword = true;
  String? mobilePhone, password;
  TextEditingController MobilePhone = new TextEditingController();
  TextEditingController Password = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          width: Get.width,
          height: Get.height,
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image: const AssetImage(Assets.imagesBackgroundSplash),
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
                        width: 160,
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
                                  'create_account'.tr,
                                  style: const TextStyle(
                                      fontSize: 17,
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
                GetBuilder<RegisterController>(
                  init: RegisterController(),
                  builder: (controller) => Container(
                    width: Get.width,
                    color: Colors.white,
                    child: Column(
                      children: [
                        SizedBox(
                          height: valueHight * 1.5,
                        ),
                        Form(
                            key: controller.formKey,
                            child: Column(
                              children: [
                                TextFieldMobileWidget(textEditingController: MobilePhone, value: mobilePhone),
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
                                      title: 'register'.tr,
                                      onTap: () {
                                        print(MobilePhone.text);
                                        Get.find<RegisterController>().createAccount(MobilePhone.text);
                                      }
                                  ),
                                ),
                                const LoginUserFromRegisterWidget()
                              ],
                            )),
                        SizedBox(height: valueHight*2.0,),
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


class LoginUserFromRegisterWidget extends StatelessWidget {
  const LoginUserFromRegisterWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: 50,
        decoration: BoxDecoration(
          color: Themes.ColorApp7,
          borderRadius: BorderRadius.circular(17),
        ),
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'have_account'.tr,
                style: const TextStyle(
                  fontSize: 12,
                  color: Themes.ColorApp2,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                width: 5,
              ),
              InkWell(
                onTap: () {
                  //  MyNavigator.NavigatorToPage(context, RegisterUserPage());
                  Get.to(const LoginScreen());
                },
                child: Text(
                  'login'.tr,
                  style: const TextStyle(
                    fontSize: 14,
                    color: Themes.ColorApp6,
                    fontWeight: FontWeight.bold,
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
