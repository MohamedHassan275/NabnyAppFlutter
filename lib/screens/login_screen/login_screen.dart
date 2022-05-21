import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nabny/componant/CustomButtonWidget.dart';
import 'package:nabny/generated/assets.dart';
import 'package:nabny/screens/register_screen/register_screen.dart';
import 'package:nabny/utils/style.dart';

import '../../componant/CustomTextFieldWidget.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  FocusNode? _focusNodePassword;
  bool showProgressbar = true;
  bool isPassword = true;
  String? mobilePhone, password;
  TextEditingController MobilePhone = new TextEditingController();
  TextEditingController Password = new TextEditingController();

  var formKey = GlobalKey<FormState>();

  var Scaffoldkey = GlobalKey<ScaffoldState>();

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
                  image: AssetImage(Assets.imagesBackgroundBording),
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
                  height: valueHight * 6.5,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: SizedBox(
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
                              'اهلا بعودتك',
                              style: TextStyle(
                                  fontSize: 17,
                                  fontWeight: FontWeight.w700,
                                  color: Colors.lightBlue.shade700),
                            )),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: valueHight * 1.5,
                ),
                Form(
                    key: formKey,
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
                            onTapValidator: (value) {
                              if (value!.isEmpty) {
                                return 'mobile must not be empty';
                              } else if (!(value.length > 10)) {
                                return 'mobile is not valid';
                              }
                              return null;
                            },
                            prefixIcon: Icons.phone_android,
                            keyboardType: TextInputType.emailAddress,
                            Controller: MobilePhone,
                            hintText: 'رقم الموبيل'),
                        SizedBox(
                          height: 15,
                        ),
                        FromTextShared(
                          //  textAlign: TextAlign.center,
                          labelText: 'password',
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
                              return 'password must not be empty';
                            } else if (value.length <= 6) {
                              return 'password is short';
                            }
                            return null;
                          },
                          prefixIcon: Icons.lock,
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
                          height: 25,
                        ),
                        GestureDetector(
                          child: Text('نسيت كلمه المرور ؟',
                              textAlign: TextAlign.start,
                              style: TextStyle(
                                color: primaryColor,
                                fontSize: 17,
                              )),
                          onTap: () {
                            // MyNavigator.NavigatorToPage(
                            //     context, ConfirmMobilePhonePage());
                          },
                        ),
                        SizedBox(
                          height: 15,
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
                                  color: primaryColor,
                                ))),
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
                              onPressed: () async {},
                              height: 50,
                              color: primaryColor),
                        ),
                        SizedBox(
                          height: 16,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 15),
                          child: Container(
                            width: MediaQuery.of(context).size.width,
                            height: 50,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(3),
                              border: Border.all(
                                  color: primaryColor,
                                  width: 1,
                                  style: BorderStyle.solid),
                            ),
                            child: Center(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    ' ليس لديك حساب ؟',
                                    style: TextStyle(
                                      fontSize: 15,
                                      color: primaryColor,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  InkWell(
                                    onTap: () => Get.to(RegisterScreen()),
                                    child: Text(
                                      'انشاء حساب',
                                      style: TextStyle(
                                        fontSize: 17,
                                        color: primaryColor,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    )),
                SizedBox(height: valueHight*2.0,)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
