
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nabny/componant/CustomTextFieldWidget.dart';
import 'package:nabny/screens/forget_password_screen/chage_password_screen.dart';
import 'package:nabny/utils/Themes.dart';

import '../../componant/CustomButtonWidget.dart';
import '../../generated/assets.dart';

class ActivationPasswordScreen extends StatefulWidget {
  const ActivationPasswordScreen({Key? key}) : super(key: key);

  @override
  _ActivationPasswordScreenState createState() => _ActivationPasswordScreenState();
}

class _ActivationPasswordScreenState extends State<ActivationPasswordScreen> {

  bool showProgressbar = true;
  var formKey = GlobalKey<FormState>();

  TextEditingController _Code1 = TextEditingController();
  TextEditingController _Code2 = TextEditingController();
  TextEditingController _Code3 = TextEditingController();
  TextEditingController _Code4 = TextEditingController();
  TextEditingController _Code5 = TextEditingController();

  late String Code1, Code2, Code3, Code4, Code5;


  Timer? _timer;
  int _start = 60;

  void startTimer() {
    const oneSec = const Duration(seconds: 1);
    _timer = new Timer.periodic(
      oneSec,
          (Timer timer) {
        if (_start == 0) {
          setState(() {
            timer.cancel();
          });
        } else {
          setState(() {
            _start--;
          });
        }
      },
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    startTimer();
  }

  @override
  void dispose() {
    _timer!.cancel();
    super.dispose();
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
                                  'استرجاع كلمة المرور',
                                  style: TextStyle(
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
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 25, vertical: 15),
                              child: CustomButtonImage(
                                hight: 50,
                                title: 'تفعيل',
                                onTap: () {
                                  if (formKey.currentState!.validate()){
                                    Get.to(ChagePasswordScreen());
                                  }
                                },
                              ),
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
