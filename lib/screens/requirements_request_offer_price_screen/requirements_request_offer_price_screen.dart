
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nabny/componant/CustomButtonWidget.dart';
import 'package:nabny/generated/assets.dart';
import 'package:nabny/utils/Themes.dart';

import '../../componant/CustomTextFieldWidget.dart';
import '../home_main_screen/home_main_screen.dart';

class RequirementsRequestOfferPriceScreen extends StatefulWidget {
  const RequirementsRequestOfferPriceScreen({Key? key}) : super(key: key);

  @override
  _RequirementsRequestOfferPriceScreenState createState() => _RequirementsRequestOfferPriceScreenState();
}

class _RequirementsRequestOfferPriceScreenState extends State<RequirementsRequestOfferPriceScreen> {

  TextEditingController TypeCastingOrderRequest = TextEditingController();
  TextEditingController DateOrderRequest = TextEditingController();
  TextEditingController WeightOrderRequest = TextEditingController();
  TextEditingController MixTypeOrderRequest = TextEditingController();
  TextEditingController CementTypeOrderRequest = TextEditingController();
  TextEditingController StoneTypeOrderRequest = TextEditingController();
  TextEditingController SpecialOrderRequest = TextEditingController();
  TextEditingController PumpLengthOrderRequest = TextEditingController();
  bool isSelected = false;
  String? typeCastingOrderRequest,dateOrderRequest,weightOrderRequest,mixTypeOrderRequest,
      cementTypeOrderRequest,stoneTypeOrderRequest,specialOrderRequest,pumpLengthOrderRequest;
  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    var widthValue = Get.width * 0.024;
    var heightValue = Get.height * 0.024;
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            width: Get.width,
            height: Get.height,
            child: Column(
              children: [
                AppbarDetailsOrder(widthValue, heightValue),
                SizedBox(height: heightValue * 1.2,),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25),
                  child: Form(
                    key: formKey,
                    child: Column(
                      children: [
                        Text(
                          'من فضلك اخبرنا عن متطلباتك',
                          style: TextStyle(
                            color: Themes.ColorApp8,
                            fontSize: 25,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        SizedBox(height: heightValue * 1.2,),
                        FromTextRegisterShared(
                            labelText: 'نوع الصبة  ',
                            onChanged: (value) {
                              setState(() {
                                typeCastingOrderRequest = value;
                              });
                            },
                            isPassword: false,
                            onTapValidator: (value) {
                              if (value!.isEmpty) {
                                return 'نوع الصبة فارغ';
                              }
                              return null;
                            },
                            keyboardType: TextInputType.text,
                            Controller: TypeCastingOrderRequest,
                            hintText: 'نوع الصبة '),
                        SizedBox(height: heightValue * .7,),
                        FromTextRegisterShared(
                            labelText: 'موعد تنفذ الطلبية ؟',
                            onChanged: (value) {
                              setState(() {
                                dateOrderRequest = value;
                              });
                            },
                            readOnly: true,
                            isPassword: false,
                            onTapValidator: (value) {
                              if (value!.isEmpty) {
                                return 'موعد تنفذ الطلبية فارغ';
                              }
                              return null;
                            },
                            keyboardType: TextInputType.text,
                            Controller: DateOrderRequest,
                            hintText: 'موعد تنفذ الطلبية ؟ '),
                        SizedBox(height: heightValue * .7,),
                        FromTextRegisterShared(
                            labelText: 'الكميه بالمتر المكعب',
                            onChanged: (value) {
                              setState(() {
                                weightOrderRequest = value;
                              });
                            },
                            isPassword: false,
                            onTapValidator: (value) {
                              if (value!.isEmpty) {
                                return 'الكميه فارغ';
                              }
                              return null;
                            },
                            keyboardType: TextInputType.number,
                            Controller: WeightOrderRequest,
                            hintText: 'الكميه بالمتر المكعب '),
                        SizedBox(height: heightValue * .7,),
                        FromTextRegisterShared(
                            labelText: 'نوع الخلطه',
                            onChanged: (value) {
                              setState(() {
                                mixTypeOrderRequest = value;
                              });
                            },
                            isPassword: false,
                            onTapValidator: (value) {
                              if (value!.isEmpty) {
                                return 'نوع الخلطه فارغ';
                              }
                              return null;
                            },
                            keyboardType: TextInputType.text,
                            Controller: MixTypeOrderRequest,
                            hintText: 'نوع الخلطه '),
                        SizedBox(height: heightValue * .7,),
                        FromTextRegisterShared(
                            labelText: 'نوع الاسمنت',
                            onChanged: (value) {
                              setState(() {
                                cementTypeOrderRequest = value;
                              });
                            },
                            isPassword: false,
                            onTapValidator: (value) {
                              if (value!.isEmpty) {
                                return 'نوع الاسمنت فارغ';
                              }
                              return null;
                            },
                            keyboardType: TextInputType.text,
                            Controller: CementTypeOrderRequest,
                            hintText: 'نوع الاسمنت '),
                        SizedBox(height: heightValue * .7,),
                        FromTextRegisterShared(
                            labelText: 'مقاس الحجر',
                            onChanged: (value) {
                              setState(() {
                                stoneTypeOrderRequest = value;
                              });
                            },
                            isPassword: false,
                            onTapValidator: (value) {
                              if (value!.isEmpty) {
                                return 'مقاس الحجر فارغ';
                              }
                              return null;
                            },
                            keyboardType: TextInputType.number,
                            Controller: StoneTypeOrderRequest,
                            hintText: 'مقاس الحجر '),
                        SizedBox(height: heightValue * .7,),
                        FromTextRegisterShared(
                            labelText: 'مواصفات خاصه',
                            onChanged: (value) {
                              setState(() {
                                specialOrderRequest = value;
                              });
                            },
                            maxLines: 3,
                            isPassword: false,
                            onTapValidator: (value) {
                              if (value!.isEmpty) {
                                return 'مواصفات خاصه فارغ';
                              }
                              return null;
                            },
                            keyboardType: TextInputType.number,
                            Controller: SpecialOrderRequest,
                            hintText: 'مواصفات خاصه '),
                        SizedBox(height: heightValue * .7,),
                        FromTextRegisterShared(
                            labelText: 'موقعك علي الخريطه',
                            onChanged: (value) {
                              setState(() {
                                specialOrderRequest = value;
                              });
                            },
                            readOnly: true,
                            maxLines: 1,
                            isPassword: false,
                            onTapValidator: (value) {
                              if (value!.isEmpty) {
                                return 'موقعك علي الخريطه فارغ';
                              }
                              return null;
                            },
                            keyboardType: TextInputType.number,
                            Controller: SpecialOrderRequest,
                            hintText: 'موقعك علي الخريطه '),
                        SizedBox(height: heightValue * .7,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              width: Get.width,
                              height: 50,
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: Themes.ColorApp1,
                                  width: 1
                                ),
                                borderRadius: BorderRadius.circular(15)
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Image.asset(Assets.imagesSelectedMark,fit: BoxFit.contain,),
                                  SizedBox(width: widthValue * .2,),
                                  Text(
                                    'بمضخه',
                                    style: TextStyle(
                                      color: Themes.ColorApp1,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              width: Get.width,
                              height: 50,
                              decoration: BoxDecoration(
                                  border: Border.all(
                                      color: Themes.ColorApp1,
                                      width: 1
                                  ),
                                  borderRadius: BorderRadius.circular(15)
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Image.asset(Assets.imagesSelectedMark,fit: BoxFit.contain,),
                                  SizedBox(width: widthValue * .2,),
                                  Text(
                                    'بدون مضخه',
                                    style: TextStyle(
                                      color: Themes.ColorApp1,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                        SizedBox(height: heightValue * .7,),
                        FromTextRegisterShared(
                            labelText: 'طول المضخة',
                            onChanged: (value) {
                              setState(() {
                                pumpLengthOrderRequest = value;
                              });
                            },
                            readOnly: false,
                            maxLines: 1,
                            isPassword: false,
                            onTapValidator: (value) {
                              if (value!.isEmpty) {
                                return 'طول المضخة فارغ';
                              }
                              return null;
                            },
                            keyboardType: TextInputType.number,
                            Controller: PumpLengthOrderRequest,
                            hintText: 'طول المضخة '),
                        SizedBox(height: heightValue * .7,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              width: Get.width,
                              height: 50,
                              decoration: BoxDecoration(
                                  border: Border.all(
                                      color: Themes.ColorApp1,
                                      width: 1
                                  ),
                                  borderRadius: BorderRadius.circular(15)
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Image.asset(Assets.imagesSelectedMark,fit: BoxFit.contain,),
                                  SizedBox(width: widthValue * .2,),
                                  Text(
                                    'بمختبر',
                                    style: TextStyle(
                                      color: Themes.ColorApp1,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              width: Get.width,
                              height: 50,
                              decoration: BoxDecoration(
                                  border: Border.all(
                                      color: Themes.ColorApp1,
                                      width: 1
                                  ),
                                  borderRadius: BorderRadius.circular(15)
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Image.asset(Assets.imagesSelectedMark,fit: BoxFit.contain,),
                                  SizedBox(width: widthValue * .2,),
                                  Text(
                                    'بدون بمختبر',
                                    style: TextStyle(
                                      color: Themes.ColorApp1,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                        SizedBox(height: heightValue * .7,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              width: Get.width,
                              height: 50,
                              decoration: BoxDecoration(
                                  border: Border.all(
                                      color: Themes.ColorApp1,
                                      width: 1
                                  ),
                                  borderRadius: BorderRadius.circular(15)
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Image.asset(Assets.imagesSelectedMark,fit: BoxFit.contain,),
                                  SizedBox(width: widthValue * .2,),
                                  Text(
                                    'بثلج',
                                    style: TextStyle(
                                      color: Themes.ColorApp1,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              width: Get.width,
                              height: 50,
                              decoration: BoxDecoration(
                                  border: Border.all(
                                      color: Themes.ColorApp1,
                                      width: 1
                                  ),
                                  borderRadius: BorderRadius.circular(15)
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Image.asset(Assets.imagesSelectedMark,fit: BoxFit.contain,),
                                  SizedBox(width: widthValue * .2,),
                                  Text(
                                    'بدون بثلج',
                                    style: TextStyle(
                                      color: Themes.ColorApp1,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                        SizedBox(height: heightValue * 1.2,),
                        CustomButtonImage(title: 'ارسال', hight: 50, onTap: ()=> Get.to(''))
                      ],
                    ),
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

class AppbarDetailsOrder extends StatelessWidget {
  AppbarDetailsOrder(this.widthValue, this.heightValue);

  double heightValue, widthValue;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: Get.width,
          height: 119,
          decoration: BoxDecoration(
              color: Themes.ColorApp14,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(35), topRight: Radius.circular(35))),
          child: Center(
            child: Text(
              'طلب عروض اسعار',
              style: TextStyle(
                color: Themes.ColorApp15,
                fontSize: 20,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ),
        Positioned(
          top: heightValue * 2.3,
          right: heightValue * 1.5,
          child: GestureDetector(
            onTap: () => Get.off(HomeMainScreen(valueBack: '')),
            child: CircleAvatar(
              backgroundColor: Themes.ColorApp5,
              child: Icon(
                Icons.arrow_right_alt_rounded,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
