
import 'dart:ffi';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:nabny/model/check_mobile_user_model.dart';
import 'package:nabny/repositries/servies_api/MyServiceApi.dart';
import 'package:nabny/screens/forget_password_screen/check_mobile_screen/check_mobile_controller.dart';
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
  String? mobilePhone;
  TextEditingController MobilePhone = new TextEditingController();
  CheckMobileUserModel? checkMobileModel;


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
    CheckMobileController checkMobileController = Get.put(CheckMobileController());

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
                                  'forget_password',
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
                      Form(
                          key: formKey,
                          child: Column(
                            children: [
                              FromTextShared(
                                  labelText: 'mobile_number',
                                  maxLength: 11,
                                  onChanged: (value) {
                                    setState(() {
                                      mobilePhone = value;
                                    });
                                  },
                                  isPassword: false,
                                  onTapValidator: (value) {
                                    if (value!.isEmpty) {
                                      return 'mobile must not be empty';
                                    } else if (!(value.length > 10)) {
                                      return 'mobile is not valid';
                                    }
                                    return null;
                                  },
                                  namePath: Assets.iconsMobilePhoneIcon,
                                  width: 25,
                                  height: 25,
                                  keyboardType: TextInputType.number,
                                  Controller: MobilePhone,
                                  hintText: 'mobile_number'),
                              SizedBox(
                                height: valueHight * 1,
                              ),
                              checkMobileController.isLoading ?  Container(
                                  decoration: const BoxDecoration(
                                    // image: DecorationImage(
                                    //     image: AssetImage(Assets
                                    //         .imagesBackgroundRequestReviewFatora),
                                    //     fit: BoxFit.contain),
                                      color: Colors.transparent),
                                  child: const Center(
                                      child: CircularProgressIndicator(
                                        color: Themes.ColorApp1,
                                      ))) : Container(),
                              SizedBox(
                                height: valueHight * .5,
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 15, vertical: 15),
                                child: CustomButtonImage(
                                  hight: 50,
                                  title: 'confirm',
                                  onTap: () async{
                                    mobilePhone = MobilePhone.text.toString();
                                    print(mobilePhone);
                                    if (formKey.currentState!.validate()){
                                      setState(() {
                                        checkMobileController.setLoading(true);
                                      });
                                      checkMobileController.checkMobilePhone(mobilePhone!);
                                      if (checkMobileController.checkMobileModel?.success == true){
                                        print(checkMobileController.checkMobileModel?.message);
                                        setState(() {
                                          checkMobileController.setLoading(false);
                                        });
                                       String? registercode = checkMobileController.checkMobileModel?.data.registercode.toString();
                                        Fluttertoast.showToast(
                                          msg: '${registercode}',
                                          fontSize: 15,
                                          backgroundColor: Themes.whiteColor,
                                          gravity: ToastGravity.BOTTOM,
                                          textColor: Themes.ColorApp1,
                                          timeInSecForIosWeb: 1,
                                          toastLength: Toast.LENGTH_SHORT,
                                        );
                                        print('${registercode}');
                                      //  Get.to( ActivationPasswordScreen(registercode: registercode,));
                                      }else if (checkMobileController.checkMobileModel?.success == false){
                                        setState(() {
                                          checkMobileController.setLoading(false);
                                        });
                                        Fluttertoast.showToast(
                                          msg: checkMobileController.checkMobileModel!.message,
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
