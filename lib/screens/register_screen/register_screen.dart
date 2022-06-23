
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nabny/screens/login_screen/login_screen.dart';
import 'package:nabny/screens/verification_code/verification_code_screen.dart';
import 'package:nabny/utils/Themes.dart';

import '../../componant/CustomButtonWidget.dart';
import '../../componant/CustomTextFieldWidget.dart';
import '../../generated/assets.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {

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
                Container(
                  width: Get.width,
                  color: Colors.white,
                  child: Column(
                    children: [
                      SizedBox(
                        height: valueHight * 1.5,
                      ),
                      Form(
                          key: formKey,
                          child: Column(
                            children: [
                              FromTextShared(
                                  labelText: 'mobile_number'.tr,
                                  maxLength: 6,
                                  onChanged: (value) {
                                    setState(() {
                                      mobilePhone = value;
                                    });
                                  },
                                  isPassword: false,
                                  onTapValidator: (value) {
                                    if (value!.isEmpty) {
                                      return 'mobile must not be empty';
                                    } else if (!(value.length > 5)) {
                                      return 'mobile is not valid';
                                    }
                                    return null;
                                  },
                                  namePath: Assets.iconsMobilePhoneIcon,
                                  width: 25,
                                  height: 25,
                                  keyboardType: TextInputType.number,
                                  Controller: MobilePhone,
                                  hintText: 'mobile_number'.tr),
                              SizedBox(
                                height: valueHight * 1,
                              ),
                              showProgressbar
                                  ? Container()
                                  : Container(
                                  decoration: const BoxDecoration(
                                    // image: DecorationImage(
                                    //     image: AssetImage(Assets
                                    //         .imagesBackgroundRequestReviewFatora),
                                    //     fit: BoxFit.contain),
                                      color: Colors.transparent),
                                  child: const Center(
                                      child: const CircularProgressIndicator(
                                        color: Themes.ColorApp1,
                                      ))),
                              SizedBox(
                                height: valueHight * .5,
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 15, vertical: 15),
                                child: CustomButtonImage(
                                  hight: 50,
                                  title: 'register'.tr,
                                  onTap: () async{
                                  //  showProgressbar = false;
                                    if (formKey.currentState!.validate()){
                                      Get.to(const VerificationCodeScreen());
                                    }
                                  },
                                ),
                              ),
                              Padding(
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
                              ),
                            ],
                          )),
                      SizedBox(height: valueHight*2.0,),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
