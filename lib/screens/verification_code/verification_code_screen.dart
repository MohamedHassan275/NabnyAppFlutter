import 'dart:async';

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
                          'verification_code'.tr,
                          textAlign: TextAlign.start,
                          style: const TextStyle(
                              fontSize: 14,
                              color: Themes.ColorApp5,
                              fontWeight: FontWeight.w500),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'on_mobile'.tr,
                          textAlign: TextAlign.start,
                          style:
                              const TextStyle(fontSize: 14, color: Themes.ColorApp5),
                        ),
                        SizedBox(width: widthValue * .2,),
                        const Text(
                          '56486123',
                          textAlign: TextAlign.start,
                          style:
                          TextStyle(fontSize: 14, color: Themes.ColorApp5),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const SizedBox(
                      height: 35,
                    ),
                    Form(
                      key: formKey,
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
                    const SizedBox(
                      height: 35,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Row(
                          children: [
                            GestureDetector(
                              onTap: (){
                               setState(() {
                                 startTimer();
                               });
                              },
                              child: Text(
                                'resend_code'.tr,
                                textAlign: TextAlign.start,
                                style: TextStyle(
                                    fontSize: 16,
                                    color: _start == 0
                                        ? Themes.ColorApp1
                                        : Themes.ColorApp2),
                              ),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            InkWell(
                              onTap: () {
                                //  startTimer();
                              },
                              child: Text(
                                '00:$_start',
                                textAlign: TextAlign.start,
                                style: const TextStyle(
                                    fontSize: 14,
                                    //    decoration: TextDecoration.underline,
                                    color: Themes.ColorApp1,
                                    fontWeight: FontWeight.w500),
                              ),
                            ),
                          ],
                        ),
                      ],
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
                           Get.to(const CompleteRegisterScreen());
                         }
                        },
                      ),
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
