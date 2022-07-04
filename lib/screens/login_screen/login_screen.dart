import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nabny/componant/CustomButtonWidget.dart';
import 'package:nabny/core/widget/custom_circler_progress_indicator_widget.dart';
import 'package:nabny/core/widget/custom_phone_and_password_widget.dart';
import 'package:nabny/generated/assets.dart';
import 'package:nabny/screens/forget_password_screen/check_mobile_screen/forget_password_byMobile_screen.dart';
import 'package:nabny/screens/forget_password_screen/check_mobile_screen/widget/custom_text_field_widget.dart';
import 'package:nabny/screens/get_my_location_screen/GetMyLocationUserPage.dart';
import 'package:nabny/screens/home_main_screen/home_main_screen.dart';
import 'package:nabny/screens/login_screen/login_controller.dart';
import 'package:nabny/screens/register_screen/register_screen.dart';
import 'package:nabny/utils/Themes.dart';

import '../../componant/CustomTextFieldWidget.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  FocusNode? _focusNodePassword;
  bool showProgressbar = true;
  bool isPassword = true;
  String? mobilePhone, password,firebase_token;
  TextEditingController MobilePhone = new TextEditingController();
  TextEditingController Password = new TextEditingController();
  late FirebaseMessaging _firebaseMessaging = FirebaseMessaging.instance;
  var formKey = GlobalKey<FormState>();

  var Scaffoldkey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    // IsUserAcesstoken();
    _focusNodePassword = FocusNode();

 //   Get.lazyPut(()=>LoginController());
    // IsUserAcesstoken();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _focusNodePassword!.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final double valueHight = Get.height * .024;
    final double valueWidth = Get.width * .024;

    return Scaffold(
      body: SafeArea(
        child: Container(
          width: double.infinity,
          height: Get.height,
          decoration: const BoxDecoration(
              image: const DecorationImage(
                  image: const AssetImage(Assets.imagesBackgroundSplash),
                  fit: BoxFit.fill)),
          child: Container(
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
                      mainAxisAlignment: MainAxisAlignment.start,
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
                              child: Text(
                                'welcome_back'.tr,
                                style: const TextStyle(
                                    fontSize: 17,
                                    fontWeight: FontWeight.w700,
                                    color: Themes.ColorApp1),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: valueHight * .2,
                  ),
                  GetBuilder<LoginController>(
                    init: LoginController(),
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
                                  SizedBox(height: valueHight * .5,),
                                  TextFieldPasswordWidget(textEditingController: Password, isPassword: isPassword,),
                                  SizedBox(height: valueHight * 1,),
                                  const ForgetPasswordWidget(),
                                  SizedBox(height: valueHight * .2,),
                                  CirclerProgressIndicatorWidget(isLoading: controller.isLoading ? true : false),
                                  const SizedBox(height: 15),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 25, vertical: 15),
                                    child: CustomButtonImage(
                                      hight: 50,
                                      title: 'login'.tr,
                                      onTap: () => Get.find<LoginController>().checkLoginUser(MobilePhone.text, Password.text,controller.firebase_token)
                                    ),
                                  ),
                                  const CreateAccountFromLoginWidget(),
                                ],
                              )),
                          SizedBox(
                            height: valueHight * 1.5,
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
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
              onTap: () =>  Get.to(ForgetPasswordByMobile())
          ),
        ],
      ),
    );
  }
}

class CreateAccountFromLoginWidget extends StatelessWidget {
  const CreateAccountFromLoginWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
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
                onTap: () => Get.to(const RegisterScreen()),
                child: Text(
                  'create_account'.tr,
                  style: const TextStyle(
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
