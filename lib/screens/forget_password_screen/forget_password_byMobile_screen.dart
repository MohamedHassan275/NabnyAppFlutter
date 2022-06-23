
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nabny/screens/forget_password_screen/activation_password_screen.dart';
import 'package:nabny/screens/success_register_screen/success_register_screen.dart';

import '../../componant/CustomButtonWidget.dart';
import '../../componant/CustomTextFieldWidget.dart';
import '../../generated/assets.dart';
import '../../utils/Themes.dart';
import '../verification_code/verification_code_screen.dart';

class ForgetPasswordByMobile extends StatefulWidget {
  const ForgetPasswordByMobile({Key? key}) : super(key: key);

  @override
  _ForgetPasswordByMobileState createState() => _ForgetPasswordByMobileState();
}

class _ForgetPasswordByMobileState extends State<ForgetPasswordByMobile> {

  var formKey = GlobalKey<FormState>();
  FocusNode? _focusNodePassword;
  bool showProgressbar = true;
  bool isPassword = true;
  String? mobilePhone;
  TextEditingController MobilePhone = new TextEditingController();



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
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(Assets.imagesBackgroundSplash),
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
                                  'forget_password2'.tr,
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
                                  decoration: BoxDecoration(
                                    // image: DecorationImage(
                                    //     image: AssetImage(Assets
                                    //         .imagesBackgroundRequestReviewFatora),
                                    //     fit: BoxFit.contain),
                                      color: Colors.transparent),
                                  child: Center(
                                      child: CircularProgressIndicator(
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
                                  title: 'confirm'.tr,
                                  onTap: () async{
                                    if (formKey.currentState!.validate()){
                                      showProgressbar = false;
                                      Get.to(ActivationPasswordScreen());
                                    }
                                  },
                                ),
                              ),
                              SizedBox(height: valueHight*3.0,),
                            ],
                          )),

                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
