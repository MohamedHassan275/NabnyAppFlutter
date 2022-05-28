
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nabny/generated/assets.dart';
import 'package:nabny/screens/home_main_screen/home_main_screen.dart';

import '../../componant/CustomButtonWidget.dart';
import '../../componant/CustomTextFieldWidget.dart';
import '../../utils/style.dart';

class CompleteRegisterScreen extends StatefulWidget {
  const CompleteRegisterScreen({Key? key}) : super(key: key);

  @override
  _CompleteRegisterScreenState createState() => _CompleteRegisterScreenState();
}

class _CompleteRegisterScreenState extends State<CompleteRegisterScreen> {

  TextEditingController MobilePhone = TextEditingController();
  String? mobilePhone;

  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    var widthValue = Get.width *0.024;
    var heightValue = Get.height*0.024;
    return Scaffold(
      body: SafeArea(
        child: Container(
          height: Get.height,
          width: Get.width,
          decoration: BoxDecoration(
            image: DecorationImage(image: AssetImage(Assets.imagesBackgroundBording),
            fit: BoxFit.fill),
          ),
          child: Column(
            children: [
              SizedBox(
                height: heightValue * 15,
              ),
              Flexible(
                child: Card(
                  color: Colors.white,
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(topRight: Radius.circular(15) , topLeft: Radius.circular(15) ,
                    bottomRight: Radius.zero , bottomLeft: Radius.zero)
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(10.0),
                    child: Container(
                      width: Get.width,
                      height: Get.height,
                      child: Form(
                        key: formKey,
                        child: SingleChildScrollView(
                          child: Column(
                            children: [
                              FromTextShared(
                                  labelText: 'رقم الموبيل',
                                  onChanged: (value) {
                                    setState(() {
                                      mobilePhone = value;
                                    });
                                  },
                                  isPassword: false,
                                  maxLength: 11,
                                  maxLines: 11,
                                  onTapValidator: (value) {
                                    if (value!.isEmpty) {
                                      return 'mobile must not be empty';
                                    } else if (!(value.length > 10)) {
                                      return 'mobile is not valid';
                                    }
                                    return null;
                                  },
                                  prefixIcon: Icons.phone_android,
                                  keyboardType: TextInputType.number,
                                  Controller: MobilePhone,
                                  hintText: 'رقم الموبيل'),
                              FromTextShared(
                                  labelText: 'رقم الموبيل',
                                  onChanged: (value) {
                                    setState(() {
                                      mobilePhone = value;
                                    });
                                  },
                                  isPassword: false,
                                  maxLength: 11,
                                  maxLines: 11,
                                  onTapValidator: (value) {
                                    if (value!.isEmpty) {
                                      return 'mobile must not be empty';
                                    } else if (!(value.length > 10)) {
                                      return 'mobile is not valid';
                                    }
                                    return null;
                                  },
                                  prefixIcon: Icons.phone_android,
                                  keyboardType: TextInputType.number,
                                  Controller: MobilePhone,
                                  hintText: 'رقم الموبيل'),
                              FromTextShared(
                                  labelText: 'رقم الموبيل',
                                  onChanged: (value) {
                                    setState(() {
                                      mobilePhone = value;
                                    });
                                  },
                                  isPassword: false,
                                  maxLength: 11,
                                  maxLines: 11,
                                  onTapValidator: (value) {
                                    if (value!.isEmpty) {
                                      return 'mobile must not be empty';
                                    } else if (!(value.length > 10)) {
                                      return 'mobile is not valid';
                                    }
                                    return null;
                                  },
                                  prefixIcon: Icons.phone_android,
                                  keyboardType: TextInputType.number,
                                  Controller: MobilePhone,
                                  hintText: 'رقم الموبيل'),
                              FromTextShared(
                                  labelText: 'رقم الموبيل',
                                  onChanged: (value) {
                                    setState(() {
                                      mobilePhone = value;
                                    });
                                  },
                                  isPassword: false,
                                  maxLength: 11,
                                  maxLines: 11,
                                  onTapValidator: (value) {
                                    if (value!.isEmpty) {
                                      return 'mobile must not be empty';
                                    } else if (!(value.length > 10)) {
                                      return 'mobile is not valid';
                                    }
                                    return null;
                                  },
                                  prefixIcon: Icons.phone_android,
                                  keyboardType: TextInputType.number,
                                  Controller: MobilePhone,
                                  hintText: 'رقم الموبيل'),
                              FromTextShared(
                                  labelText: 'رقم الموبيل',
                                  onChanged: (value) {
                                    setState(() {
                                      mobilePhone = value;
                                    });
                                  },
                                  isPassword: false,
                                  maxLength: 11,
                                  maxLines: 11,
                                  onTapValidator: (value) {
                                    if (value!.isEmpty) {
                                      return 'mobile must not be empty';
                                    } else if (!(value.length > 10)) {
                                      return 'mobile is not valid';
                                    }
                                    return null;
                                  },
                                  prefixIcon: Icons.phone_android,
                                  keyboardType: TextInputType.number,
                                  Controller: MobilePhone,
                                  hintText: 'رقم الموبيل'),
                              FromTextShared(
                                  labelText: 'رقم الموبيل',
                                  onChanged: (value) {
                                    setState(() {
                                      mobilePhone = value;
                                    });
                                  },
                                  isPassword: false,
                                  maxLength: 11,
                                  maxLines: 11,
                                  onTapValidator: (value) {
                                    if (value!.isEmpty) {
                                      return 'mobile must not be empty';
                                    } else if (!(value.length > 10)) {
                                      return 'mobile is not valid';
                                    }
                                    return null;
                                  },
                                  prefixIcon: Icons.phone_android,
                                  keyboardType: TextInputType.number,
                                  Controller: MobilePhone,
                                  hintText: 'رقم الموبيل'),
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
                                      Get.to(HomeMainScreen());
                                    },
                                    height: 50,
                                    color: primaryColor),
                              ),
                              SizedBox(
                                height: 16,
                              ),
                            ],
                          ),
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
