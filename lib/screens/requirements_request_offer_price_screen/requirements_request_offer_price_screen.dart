
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:nabny/componant/CustomButtonWidget.dart';
import 'package:nabny/generated/assets.dart';
import 'package:nabny/screens/my_address_request_offer_screen/my_address_request_offer_screen.dart';
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
  TextEditingController MyLocationInMap = TextEditingController();
  bool isSelected = false;
  String? typeCastingOrderRequest,dateOrderRequest,weightOrderRequest,mixTypeOrderRequest,
      cementTypeOrderRequest,stoneTypeOrderRequest,specialOrderRequest,pumpLengthOrderRequest,myLocationInMap;
  String? formattedDate;
  var formKey = GlobalKey<FormState>();
  String? formattedDateCurrent;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    var now = new DateTime.now();
    var formatter = new DateFormat('yyyy-MM-dd');
    formattedDateCurrent = formatter.format(now);
    print(formattedDateCurrent); // 2016-01-25

  }
  @override
  Widget build(BuildContext context) {
    var widthValue = Get.width * 0.024;
    var heightValue = Get.height * 0.024;
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            width: Get.width,
            child: Column(
              children: [
                AppbarDetailsOrder(widthValue, heightValue),
                SizedBox(height: heightValue * 1.2,),
                Form(
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
                          readOnly: false,
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
                      InkWell(
                        onTap: () async {
                          DateTime? pickedDate = await showDatePicker(
                              context: context,
                              initialDate: DateTime.now(),
                              firstDate: DateTime(2000),
                              //DateTime.now() - not to allow to choose before today.
                              lastDate: DateTime(2101));

                          if (pickedDate != null) {
                            print(pickedDate); //pickedDate output format => 2021-03-10 00:00:00.000 yyyy-MM-dd
                            formattedDate = DateFormat('yyyy-MM-dd').format(pickedDate);
                            print(formattedDate); //formatted date output using intl package =>  2021-03-16
                            //you can implement different kind of Date Format here according to your requirement

                            setState(() {
                              DateOrderRequest.text =
                              formattedDate!; //set output date to TextField value.
                            });
                          }
                        },
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 25),
                          child: Container(
                            height: 65,
                            width: Get.width,
                            decoration: BoxDecoration(
                              color: Themes.whiteColor,
                                borderRadius: BorderRadius.circular(25),
                                border: Border.all(
                                    color: Themes.ColorApp2,
                                    width: 1)),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 10),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text(
                                    formattedDate == null
                                        ? "موعد تنفيذ الطلب"
                                        : "موعد تنفيذ الطلب : ${formattedDate} ",
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 2,
                                    style: TextStyle(
                                        fontFamily: 'FF Shamel Family',
                                        fontSize: 14,
                                        color: Themes.ColorApp8,
                                        fontWeight: FontWeight.w500),
                                  ),
                                  SizedBox(width: widthValue * .5,)

                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: heightValue * .7,),
                      FromTextRegisterShared(
                          labelText: 'الكميه بالمتر المكعب',
                          onChanged: (value) {
                            setState(() {
                              weightOrderRequest = value;
                            });
                          },
                          readOnly: false,
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
                          readOnly: false,
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
                          readOnly: false,
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
                          readOnly: false,
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
                          readOnly: false,
                          maxLines: 3,
                          isPassword: false,
                          onTapValidator: (value) {
                            if (value!.isEmpty) {
                              return 'مواصفات خاصه فارغ';
                            }
                            return null;
                          },
                          keyboardType: TextInputType.text,
                          Controller: SpecialOrderRequest,
                          hintText: 'مواصفات خاصه '),
                      SizedBox(height: heightValue * .7,),
                      FromTextRegisterShared(
                          labelText: 'موقعك علي الخريطه',
                          onChanged: (value) {
                            setState(() {
                              myLocationInMap = value;
                            });
                          },
                          readOnly: false,
                          maxLines: 1,
                          isPassword: false,
                          onTapValidator: (value) {
                            if (value!.isEmpty) {
                              return 'موقعك علي الخريطه فارغ';
                            }
                            return null;
                          },
                          keyboardType: TextInputType.text,
                          Controller: MyLocationInMap,
                          hintText: 'موقعك علي الخريطه '),
                      SizedBox(height: heightValue * .7,),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 15),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                child: Container(
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
                                      SizedBox(width: widthValue * 1,),
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
                              ),
                              SizedBox(width: widthValue * 1.5,),
                              Expanded(
                                child: Container(
                                  width: Get.width,
                                  height: 50,
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                          color: Themes.ColorApp2,
                                          width: 1
                                      ),
                                      borderRadius: BorderRadius.circular(15)
                                  ),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                    //  Image.asset(Assets.imagesSelectedMark,fit: BoxFit.contain,),
                                      SizedBox(width: widthValue * 1,),
                                      Text(
                                        'بدون مضخه',
                                        style: TextStyle(
                                          color: Themes.ColorApp8,
                                          fontSize: 14,
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
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
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 15),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                child: Container(
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
                                      SizedBox(width: widthValue * 1,),
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
                              ),
                              SizedBox(width: widthValue * 1.5,),
                              Expanded(
                                child: Container(
                                  width: Get.width,
                                  height: 50,
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                          color: Themes.ColorApp2,
                                          width: 1
                                      ),
                                      borderRadius: BorderRadius.circular(15)
                                  ),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      //  Image.asset(Assets.imagesSelectedMark,fit: BoxFit.contain,),
                                      SizedBox(width: widthValue * 1,),
                                      Text(
                                        'بدون ثلج',
                                        style: TextStyle(
                                          color: Themes.ColorApp8,
                                          fontSize: 14,
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(height: heightValue * .7,),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 15),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                child: Container(
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
                                      SizedBox(width: widthValue * 1,),
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
                              ),
                              SizedBox(width: widthValue * 1.5,),
                              Expanded(
                                child: Container(
                                  width: Get.width,
                                  height: 50,
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                          color: Themes.ColorApp2,
                                          width: 1
                                      ),
                                      borderRadius: BorderRadius.circular(15)
                                  ),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      //  Image.asset(Assets.imagesSelectedMark,fit: BoxFit.contain,),
                                      SizedBox(width: widthValue * 1,),
                                      Text(
                                        'بدون مختبر',
                                        style: TextStyle(
                                          color: Themes.ColorApp8,
                                          fontSize: 14,
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(height: heightValue * 1.2,),
                      CustomButtonImage(title: 'ارسال', hight: 50, onTap: (){
                        if (formKey.currentState!.validate()){
                          if (formattedDate == null){
                            Fluttertoast.showToast(
                              msg: 'يجب تحديد موعد تنفيذ الطلب',
                              fontSize: 15,
                              backgroundColor: Themes.whiteColor,
                              gravity: ToastGravity.BOTTOM,
                              textColor: Themes.ColorApp1,
                              timeInSecForIosWeb: 1,
                              toastLength: Toast.LENGTH_SHORT,
                            );
                          }else if (!(formattedDateCurrent!.compareTo(formattedDate!)  <= 0)) {
                            Fluttertoast.showToast(
                                msg: "  تاريخ موعد تنفيذ الطلب غير صالح",
                                toastLength: Toast.LENGTH_SHORT,
                                gravity: ToastGravity.BOTTOM,
                                timeInSecForIosWeb: 1,
                                backgroundColor:
                                Colors.grey.shade300,
                                textColor: Colors.black,
                                fontSize: 15.0);
                          } else {
                            Get.to(const MyAddressRequestOfferScreen());
                          }

                        }
                      }),
                      SizedBox(height: heightValue * 1.2,),
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
