import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nabny/generated/assets.dart';
import 'package:nabny/utils/Themes.dart';

import '../../componant/CustomButtonWidget.dart';
import '../../componant/CustomTextFieldWidget.dart';
import '../complete_register_screen/complete_register_screen.dart';

class VerificationCodeScreen extends StatefulWidget {
  const VerificationCodeScreen({Key? key}) : super(key: key);

  @override
  _VerificationCodeScreenState createState() => _VerificationCodeScreenState();
}

class _VerificationCodeScreenState extends State<VerificationCodeScreen> {
  TextEditingController _Code1 = TextEditingController();
  TextEditingController _Code2 = TextEditingController();
  TextEditingController _Code3 = TextEditingController();
  TextEditingController _Code4 = TextEditingController();
  TextEditingController _Code5 = TextEditingController();

  late String Code1, Code2, Code3, Code4, Code5;

  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    var widthValue = Get.width * .024;
    var heightValue = Get.height * .024;
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: heightValue * 3,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                        child: Image.asset(
                          Assets.imagesImageConfirmActivation,
                        )),
                    SizedBox(
                      height: heightValue * 3,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'تم ارسال كود التحقق مكون من 4 ارقام',
                          textAlign: TextAlign.start,
                          style: TextStyle(
                              fontSize: 14,
                              color: Themes.ColorApp5,
                              fontWeight: FontWeight.w500),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          ' علي رقم هاتفك 0096645678765',
                          textAlign: TextAlign.start,
                          style: TextStyle(fontSize: 14, color: Themes.ColorApp5),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    SizedBox(
                      height: 35,
                    ),
                    Form(
                      key: formKey,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: Container(
                              height: 100,
                              child: SharedFromTextField(
                                  textAlign: TextAlign.center,
                                  hintText: 'ـــــ',
                                  onChanged: (value) {
                                    setState(() {
                                      Code1 = value;
                                    });
                                  },
                                  onTapValidator: (value) {
                                    if (value!.isEmpty) {
                                      return 'Code  must not be empty';
                                    }
                                    return null;
                                  },
                                  keyboardType: TextInputType.number,
                                  maxLines: 1,
                                  Controller: _Code1),
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Expanded(
                            child: Container(
                              height: 100,
                              child: SharedFromTextField(
                                  textAlign: TextAlign.center,
                                  hintText: 'ـــــ',
                                  onChanged: (value) {
                                    setState(() {
                                      Code2 = value;
                                    });
                                  },
                                  onTapValidator: (value) {
                                    if (value!.isEmpty) {
                                      return 'Code  must not be empty';
                                    }
                                    return null;
                                  },
                                  keyboardType: TextInputType.number,
                                  maxLines: 1,
                                  Controller: _Code2),
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Expanded(
                            child: Container(
                              height: 100,
                              child: SharedFromTextField(
                                  textAlign: TextAlign.center,
                                  hintText: 'ـــــ',
                                  onChanged: (value) {
                                    setState(() {
                                      Code3 = value;
                                    });
                                  },
                                  onTapValidator: (value) {
                                    if (value!.isEmpty) {
                                      return 'Code  must not be empty';
                                    }
                                    return null;
                                  },
                                  keyboardType: TextInputType.number,
                                  maxLines: 1,
                                  Controller: _Code3),
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Expanded(
                            child: Container(
                              height: 100,
                              child: SharedFromTextField(
                                  textAlign: TextAlign.center,
                                  hintText: 'ـــــ',
                                  onChanged: (value) {
                                    setState(() {
                                      Code4 = value;
                                    });
                                  },
                                  onTapValidator: (value) {
                                    if (value!.isEmpty) {
                                      return 'Code  must not be empty';
                                    }
                                    return null;
                                  },
                                  keyboardType: TextInputType.number,
                                  maxLines: 1,
                                  Controller: _Code4),
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          // Expanded(
                          //   child: Container(
                          //     height: 100,
                          //     child: SharedFromTextField(
                          //         textAlign: TextAlign.center,
                          //         hintText: 'ـــــ',
                          //         onChanged: (value) {
                          //           setState(() {
                          //             Code5 = value;
                          //           });
                          //         },
                          //         onTapValidator: (value) {
                          //           if (value!.isEmpty) {
                          //             return 'Code  must not be empty';
                          //           }
                          //           return null;
                          //         },
                          //         keyboardType: TextInputType.number,
                          //         maxLines: 1,
                          //         Controller: _Code5),
                          //   ),
                          // ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 35,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Row(
                          children: [
                            Text(
                              'اعاده ارسال الكود',
                              textAlign: TextAlign.start,
                              style: TextStyle(
                                  fontSize: 14, color: Themes.ColorApp2),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            InkWell(
                              onTap: () {
                                //  startTimer();
                              },
                              child: Text(
                                '00:02',
                                textAlign: TextAlign.start,
                                style: TextStyle(
                                    fontSize: 14,
                                    decoration: TextDecoration.underline,
                                    color: Themes.ColorApp1,
                                    fontWeight: FontWeight.w500),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Text(
                              'wait 02 s',
                              textAlign: TextAlign.start,
                              style: TextStyle(
                                  fontSize: 14, color: Themes.whiteColor),
                            ),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 25,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 0, vertical: 15),
                      child: FromButtonShared(
                          buttonText: 'Verify',
                          height: 50,
                          width: MediaQuery.of(context).size.width,
                          onPressed: () {
                            if (formKey.currentState!.validate()) {
                              // MyNavigator.NavigatorToPage(
                              //     context, HomeMainCotchPage());
                              Get.to(CompleteRegisterScreen());
                            }
                          },
                          color: Themes.ColorApp3,
                          sizeText: 15,
                          TextColors: Colors.white),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
