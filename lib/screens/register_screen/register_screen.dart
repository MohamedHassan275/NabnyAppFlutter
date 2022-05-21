
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../componant/CustomButtonWidget.dart';
import '../../componant/CustomTextFieldWidget.dart';
import '../../generated/assets.dart';
import '../../utils/style.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {

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
                              'انشاء حساب',
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
                          height: 25,
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
                              buttonText: 'تسجيل',
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
                                    onTap: () {
                                      //  MyNavigator.NavigatorToPage(context, RegisterUserPage());
                                    },
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
