
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nabny/generated/assets.dart';
import 'package:nabny/screens/login_screen/login_screen.dart';

import '../../componant/CustomButtonWidget.dart';
import '../../componant/CustomTextFieldWidget.dart';
import '../../utils/Themes.dart';

class ChagePasswordScreen extends StatefulWidget {
  const ChagePasswordScreen({Key? key}) : super(key: key);

  @override
  _ChagePasswordScreenState createState() => _ChagePasswordScreenState();
}

class _ChagePasswordScreenState extends State<ChagePasswordScreen> {

  TextEditingController Password = TextEditingController();
  FocusNode? _focusNodePassword;
  FocusNode? _focusNodeConfirmPassword;
  TextEditingController ConfirmPassword = TextEditingController();
  String? password, confirmPassword;
  bool isPassword = true;
  bool isConfirmPassword = true;
  bool isCheckAccepted = false;
  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    var widthValue = Get.width * 0.024;
    var heightValue = Get.height * 0.024;
    double paddingWidget = heightValue * 10;

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
                  height: heightValue * 6.0,
                ),
                Image.asset(
                  Assets.imagesLogoImage,
                  fit: BoxFit.contain,
                ),
                SizedBox(
                  height: heightValue * 5.5,
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
                                  'كود الاسترجاع',
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
                SizedBox(height: heightValue*.2,),
                Container(
                  width: Get.width,
                  color: Colors.white,
                  child: Form(
                    key: formKey,
                    child: Column(
                      children: [
                        SizedBox(
                          height: heightValue * 2,
                        ),
                        FromTextShared(
                          //  textAlign: TextAlign.center,
                          labelText: 'كلمة المرور',
                          onTapFunction: () {
                            setState(() {
                              FocusScope.of(context).unfocus();
                              FocusScope.of(context)
                                  .requestFocus(_focusNodePassword);
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
                        SizedBox(
                          height: heightValue * 1,
                        ),
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
                              return 'تأكيد كلمة المرور فارغة';
                            } else if (value.length <= 6) {
                              return ' تأكيد كلمة المرور قصيرة';
                            } else if (!(value.contains(Password.text))) {
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
                        SizedBox(
                          height: heightValue * 1,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 15, vertical: 15),
                          child: CustomButtonImage(
                            hight: 50,
                            title: 'استرجاع كلمة المرور',
                            onTap: () async{
                              //  showProgressbar = false;
                              if (formKey.currentState!.validate()){
                                Get.to(const LoginScreen());
                              }
                            },
                          ),
                        ),
                        SizedBox(
                          height: 16,
                        ),
                      ],
                    ),
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
