
import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nabny/model/check_mobile_user_model.dart';
import 'package:nabny/screens/forget_password_screen/check_mobile_screen/check_mobile_controller.dart';
import 'package:nabny/screens/forget_password_screen/check_mobile_screen/widget/custom_text_field_widget.dart';
import '../../../componant/CustomButtonWidget.dart';
import '../../../componant/CustomTextFieldWidget.dart';
import '../../../generated/assets.dart';
import '../../../utils/Themes.dart';

class ForgetPasswordByMobile extends StatefulWidget {
  const ForgetPasswordByMobile({Key? key}) : super(key: key);

  @override
  _ForgetPasswordByMobileState createState() => _ForgetPasswordByMobileState();
}

class _ForgetPasswordByMobileState extends State<ForgetPasswordByMobile> {

  var formKey = GlobalKey<FormState>();
  FocusNode? _focusNodePassword;
  bool isPassword = true;
  bool showProgressbar = true;
  String? mobilePhone;
  TextEditingController MobilePhone = new TextEditingController();
  CheckMobileUserModel? _checkMobileModel;

  String? registercode,massageFailer;


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
              image: const DecorationImage(
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
                                  'forget_password'.tr,
                                  style: const TextStyle(
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
                      GetBuilder<CheckMobileController>(
                        init: CheckMobileController(),
                        builder: (controller) =>  Form(
                            key: controller.formKey,
                            child: Column(
                              children: [
                                CustomTextFieldWidget(textEditingController: MobilePhone, value: mobilePhone),
                                SizedBox(
                                  height: valueHight * 1,
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
                                  height: valueHight * .5,
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 15, vertical: 15),
                                  child: CustomButtonImage(
                                      hight: 50,
                                      title: 'confirm'.tr,
                                      onTap: () => Get.find<CheckMobileController>().checkMobilePhone(MobilePhone.text)
                                  ),
                                ),
                                SizedBox(height: valueHight*3.0,),
                              ],
                            )),)
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
