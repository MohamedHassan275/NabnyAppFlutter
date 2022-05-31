
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nabny/generated/assets.dart';
import 'package:nabny/screens/home_main_screen/home_main_screen.dart';
import 'package:nabny/utils/Themes.dart';

import '../../componant/CustomButtonWidget.dart';
import '../../componant/CustomTextFieldWidget.dart';
import '../../utils/style.dart';

class CompleteRegisterScreen extends StatefulWidget {
  const CompleteRegisterScreen({Key? key}) : super(key: key);

  @override
  _CompleteRegisterScreenState createState() => _CompleteRegisterScreenState();
}

class _CompleteRegisterScreenState extends State<CompleteRegisterScreen> {

  TextEditingController FirstName = TextEditingController();
  TextEditingController LastName = TextEditingController();
  TextEditingController Email = TextEditingController();
  TextEditingController Password = TextEditingController();
  FocusNode? _focusNodePassword;
  FocusNode? _focusNodeConfirmPassword;
  TextEditingController ConfirmPassword = TextEditingController();
  String? firstName,lastName,email,password,confirmPassword;
  bool isPassword = true;
  bool isConfirmPassword = true;
  var formKey = GlobalKey<FormState>();


  @override
  Widget build(BuildContext context) {
    var widthValue = Get.width *0.024;
    var heightValue = Get.height*0.024;
    double paddingWidget = heightValue * 10;
    return Scaffold(
      body: SafeArea(
        child: Container(
          height: Get.height,
          width: Get.width,
          decoration: BoxDecoration(
            image: DecorationImage(image: AssetImage(Assets.imagesBackgroundSplash),
            fit: BoxFit.fill),
          ),
          child: Column(
            children: [
              SizedBox(
                height: heightValue * 5,
              ),
              Flexible(
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                    borderRadius: BorderRadius.only(topRight: Radius.circular(50), topLeft: Radius.circular(50))
                  ),
                  child: Container(
                    width: Get.width,
                    height: Get.height,
                    child: Form(
                      key: formKey,
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            SizedBox(height: 6,),
                           Container(
                             height: 200,
                             decoration: BoxDecoration(
                                 color: Themes.ColorApp4,
                                 borderRadius: BorderRadius.only(topRight: Radius.circular(50), topLeft: Radius.circular(50))
                             ),
                             child: Column(
                               mainAxisAlignment: MainAxisAlignment.start,
                               crossAxisAlignment: CrossAxisAlignment.start,
                               children: [
                                 Padding(
                                   padding: const EdgeInsets.symmetric(horizontal: 25 , vertical: 25),
                                   child: CircleAvatar(
                                     backgroundColor: Themes.ColorApp5,
                                     radius: 25,
                                     child: Icon(Icons.arrow_right_alt_rounded,color: Colors.white,),
                                   ),
                                 ),
                                 SizedBox(
                                   height: heightValue * 3,
                                 ),
                                 Padding(
                                   padding: const EdgeInsets.symmetric(horizontal: 25),
                                   child: Row(
                                     mainAxisAlignment: MainAxisAlignment.start,
                                     children: [
                                       Text(
                                         'معلومات الحساب',
                                         style: TextStyle(
                                             fontSize: 17,
                                             fontWeight: FontWeight.w700,
                                             color: Themes.ColorApp1),
                                       ),
                                     ],
                                   ),
                                 ),
                               ],
                             ),
                           ),
                          Column(
                            children: [
                              SizedBox(height: heightValue *2,),
                              FromTextShared(
                                  labelText: 'الاسم الاول ',
                                  onChanged: (value) {
                                    setState(() {
                                      firstName = value;
                                    });
                                  },
                                  isPassword: false,
                                  onTapValidator: (value) {
                                    if (value!.isEmpty) {
                                      return 'الاسم الاول فارغ';
                                    }
                                    return null;
                                  },
                                  keyboardType: TextInputType.text,
                                  Controller: FirstName,
                                  hintText: 'الاسم الاول'),
                              SizedBox(height: heightValue *1,),
                              FromTextShared(
                                  labelText: 'اسم العائله ',
                                  onChanged: (value) {
                                    setState(() {
                                      lastName = value;
                                    });
                                  },
                                  onTapValidator: (value) {
                                    if (value!.isEmpty) {
                                      return 'اسم العائله فارغ';
                                    }
                                    return null;
                                  },
                                  isPassword: false,
                                  keyboardType: TextInputType.text,
                                  Controller: LastName,
                                  hintText: 'اسم العائله'),
                              SizedBox(height: heightValue *1,),
                              FromTextShared(
                                  labelText: 'البريد الالكتروني ',
                                  onChanged: (value) {
                                    setState(() {
                                      email = value;
                                    });
                                  },
                                  onTapValidator: (value) {
                                    if (value!.isEmpty) {
                                      return 'البريد الالكتروني فارغ';
                                    }else if (!(value.contains("@"))) {
                                      return 'البريد الالكتروني غير صالح';
                                    }
                                    return null;
                                  },
                                  isPassword: false,
                                  keyboardType: TextInputType.emailAddress,
                                  Controller: Email,
                                  hintText: 'البريد الالكتروني'),
                              SizedBox(height: heightValue *1,),
                              FromTextShared(
                                //  textAlign: TextAlign.center,
                                labelText: 'كلمة المرور',
                                onTapFunction: () {
                                  setState(() {
                                    FocusScope.of(context).unfocus();
                                    FocusScope.of(context).requestFocus(
                                        _focusNodePassword);
                                  });
                                },
                                focusNode: _focusNodePassword,
                                onChanged: (value) {
                                  setState(() {
                                    password = value;
                                  });
                                },
                                isPassword: isPassword,
                                onTapValidator: (value) {
                                  if (value!.isEmpty) {
                                    return 'كلمة المرور فارغة';
                                  } else if (value.length <= 6) {
                                    return 'كلمة المرور قصيرة';
                                  }
                                  return null;
                                },
                                suffixIcon: isPassword
                                    ? Icons.visibility_sharp
                                    : Icons.visibility_off,
                                onTapsuffixIcon: () {
                                  setState(() {
                                    isPassword = !isPassword;
                                  });
                                },
                                keyboardType: TextInputType.text,
                                maxLines: 1,
                                Controller: Password,
                                hintText: 'كلمة المرور',
                              ),
                              SizedBox(height: heightValue *1,),
                              FromTextShared(
                                //  textAlign: TextAlign.center,
                                labelText: 'تأكيد كلمة المرور',
                                onTapFunction: () {
                                  setState(() {
                                    FocusScope.of(context).unfocus();
                                    FocusScope.of(context).requestFocus(
                                        _focusNodeConfirmPassword);
                                  });
                                },
                                focusNode: _focusNodeConfirmPassword,
                                onChanged: (value) {
                                  setState(() {
                                    confirmPassword = value;
                                  });
                                },
                                isPassword: isConfirmPassword,
                                onTapValidator: (value) {
                                  if (value!.isEmpty) {
                                    return 'تأكيد كلمة المرور';
                                  } else if (value.length <= 6) {
                                    return 'تأكيد كلمة المرور';
                                  }else if (value.contains(Password.text)) {
                                    return ' كلمة المرور غير متطابقة';
                                  }
                                  return null;
                                },
                                suffixIcon: isConfirmPassword
                                    ? Icons.visibility_sharp
                                    : Icons.visibility_off,
                                onTapsuffixIcon: () {
                                  setState(() {
                                    isConfirmPassword = !isConfirmPassword;
                                  });
                                },
                                keyboardType: TextInputType.text,
                                maxLines: 1,
                                Controller: ConfirmPassword,
                                hintText: 'تأكيد كلمة المرور',
                              ),
                              SizedBox(height: heightValue *1,),

                              SizedBox(
                                height: 15,
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 15),
                                child: FromButtonShared(
                                    width: MediaQuery.of(context).size.width,
                                    sizeText: 17,
                                    TextColors: Colors.white,
                                    buttonText: 'دخول',
                                    onPressed: () async {
                                      if(formKey.currentState!.validate()){
                                        Get.to(HomeMainScreen());
                                      }
                                    },
                                    height: 50,
                                    color: primaryColor),
                              ),
                              SizedBox(
                                height: 16,
                              ),
                            ],
                          )
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
