import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nabny/componant/CustomButtonWidget.dart';
import 'package:nabny/core/widget/custom_widget.dart';
import 'package:nabny/generated/assets.dart';
import 'package:nabny/screens/forget_password_screen/check_mobile_screen/forget_password_byMobile_screen.dart';
import 'package:nabny/screens/forget_password_screen/check_mobile_screen/widget/custom_text_field_widget.dart';
import 'package:nabny/screens/get_my_location_screen/GetMyLocationUserPage.dart';
import 'package:nabny/screens/home_main_screen/home_main_screen.dart';
import 'package:nabny/screens/login_screen/login_controller.dart';
import 'package:nabny/screens/login_screen/widget/custom_text_field_widget.dart';
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
  String? mobilePhone, password;
  TextEditingController MobilePhone = new TextEditingController();
  TextEditingController Password = new TextEditingController();

  var formKey = GlobalKey<FormState>();

  var Scaffoldkey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    // IsUserAcesstoken();
    _focusNodePassword = FocusNode();

    setState(() {
      //   Firebase.initializeApp().whenComplete(() {
      //     print("completed");
      //     setState(() {});
      //   });
      //   _firebaseMessaging.getToken().then((value){
      //     print('The Token is $value');
      //     firebase_token = value!;
      //     print(firebase_token);
      //   });
    });

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
                                  CustomTextFieldLoginWidget(textEditingController: MobilePhone, value: mobilePhone),
                                  SizedBox(height: valueHight * .5,),
                                  FormFieldPasswordWidget(textEditingController: Password, isPassword: isPassword,),
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
                                      onTap: () => Get.find<LoginController>().checkLoginUser(MobilePhone.text, Password.text, 'token')
                                    ),
                                  ),
                                  const CreateAccountFromLogin(),
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
