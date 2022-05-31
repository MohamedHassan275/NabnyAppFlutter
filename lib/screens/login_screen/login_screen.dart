import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nabny/componant/CustomButtonWidget.dart';
import 'package:nabny/generated/assets.dart';
import 'package:nabny/screens/home_main_screen/home_main_screen.dart';
import 'package:nabny/screens/register_screen/register_screen.dart';
import 'package:nabny/utils/Themes.dart';
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
          width: double.infinity,
          height: Get.height,
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(Assets.imagesBackgroundSplash),
                  fit: BoxFit.fill)),
          child: Container(
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
                      mainAxisAlignment: MainAxisAlignment.start,
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
                              child: Text(
                                'اهلا بعودتك',
                                style: TextStyle(
                                    fontSize: 17,
                                    fontWeight: FontWeight.w700,
                                    color: Themes.ColorApp1),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: valueHight * .2,
                  ),
                  Container(
                    child: Container(
                      width: Get.width,
                      color: Colors.white,
                      child: Stack(
                        children: [
                          Column(
                            children: [
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
                                        height: valueHight * .5,
                                      ),
                                      FromTextShared(
                                        //  textAlign: TextAlign.center,
                                        labelText: 'password',
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
                                        height: valueHight * 1,
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.symmetric(horizontal: 25),
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.start,
                                          children: [
                                            GestureDetector(
                                              child: Text('نسيت كلمه المرور ؟',
                                                  textAlign: TextAlign.start,
                                                  style: TextStyle(
                                                    color: Themes.ColorApp6,
                                                    fontSize: 17,
                                                  )),
                                              onTap: () {
                                                // MyNavigator.NavigatorToPage(
                                                //     context, ConfirmMobilePhonePage());
                                              },
                                            ),
                                          ],
                                        ),
                                      ),
                                      SizedBox(
                                        height: valueHight * .2,
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
                                                  child:
                                                      CircularProgressIndicator(
                                                color: Themes.ColorApp1,
                                              ))),
                                      SizedBox(
                                        height: 15,
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 25, vertical: 15),
                                        child: CustomButtonImage(
                                          hight: 50,
                                          title: 'دخول',
                                          onTap: () {
                                            Get.to(HomeMainScreen());
                                          },
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 25),
                                        child: Container(
                                          width: Get.width,
                                          height: 50,
                                          decoration: BoxDecoration(
                                            color: Themes.ColorApp7,
                                            borderRadius: BorderRadius.circular(15),
                                          ),
                                          child: Center(
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Text(
                                                  ' ليس لديك حساب ؟',
                                                  style: TextStyle(
                                                    fontSize: 15,
                                                    color: Themes.ColorApp2,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                                SizedBox(
                                                  width: 5,
                                                ),
                                                InkWell(
                                                  onTap: () =>
                                                      Get.to(RegisterScreen()),
                                                  child: Text(
                                                    'انشاء حساب',
                                                    style: TextStyle(
                                                      fontSize: 17,
                                                      color: Themes.ColorApp6,
                                                      fontWeight:
                                                          FontWeight.bold,
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
                              SizedBox(
                                height: valueHight * 1.5,
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
