
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nabny/componant/CustomTextFieldWidget.dart';
import 'package:nabny/utils/Themes.dart';

import '../../componant/CustomButtonWidget.dart';
import '../../generated/assets.dart';
import 'chage_password_screen.dart';

class ActivationPasswordScreen extends StatefulWidget {
  String? registercode;
  ActivationPasswordScreen({required this.registercode});

  @override
  _ActivationPasswordScreenState createState() => _ActivationPasswordScreenState();
}

class _ActivationPasswordScreenState extends State<ActivationPasswordScreen> {

  TextEditingController _Code1 = TextEditingController();
  TextEditingController _Code2 = TextEditingController();
  TextEditingController _Code3 = TextEditingController();
  TextEditingController _Code4 = TextEditingController();

  late String Code1, Code2, Code3, Code4;

  var formKey = GlobalKey<FormState>();

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
          decoration: const BoxDecoration(
              image: const DecorationImage(
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
                                  'forget_code'.tr,
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
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                child: SizedBox(
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
                              const SizedBox(
                                width: 10,
                              ),
                              Expanded(
                                child: SizedBox(
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
                              const SizedBox(
                                width: 10,
                              ),
                              Expanded(
                                child: SizedBox(
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
                              const SizedBox(
                                width: 10,
                              ),
                              Expanded(
                                child: SizedBox(
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
                              const SizedBox(
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
                      ),
                      const SizedBox(
                        height: 25,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 15, vertical: 15),
                        child: CustomButtonImage(
                          hight: 50,
                          title: 'confirm'.tr,
                          onTap: () {
                            if(formKey.currentState!.validate()){
                              String? VerificationCode = _Code1.text.toString() + _Code2.text.toString()+ _Code3.text.toString() + _Code4.text.toString();
                              print(VerificationCode);
                              Get.to(const ChagePasswordScreen());
                            }
                          },
                        ),
                      ),
                      SizedBox(height: valueHight * 3,)
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
