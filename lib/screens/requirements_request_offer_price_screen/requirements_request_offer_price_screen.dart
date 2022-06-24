import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:nabny/componant/CustomButtonWidget.dart';
import 'package:nabny/core/localization/local_controller.dart';
import 'package:nabny/generated/assets.dart';
import 'package:nabny/screens/my_address_request_offer_screen/my_address_request_offer_screen.dart';
import 'package:nabny/utils/Themes.dart';
import '../../componant/CustomTextFieldWidget.dart';
import '../home_main_screen/home_main_screen.dart';

class RequirementsRequestOfferPriceScreen extends StatefulWidget {
  const RequirementsRequestOfferPriceScreen({Key? key}) : super(key: key);

  @override
  _RequirementsRequestOfferPriceScreenState createState() =>
      _RequirementsRequestOfferPriceScreenState();
}

class _RequirementsRequestOfferPriceScreenState
    extends State<RequirementsRequestOfferPriceScreen> {
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
  String? typeCastingOrderRequest,
      dateOrderRequest,
      weightOrderRequest,
      mixTypeOrderRequest,
      cementTypeOrderRequest,
      stoneTypeOrderRequest,
      specialOrderRequest,
      pumpLengthOrderRequest,
      myLocationInMap;
  String? formattedDate;
  bool isVisiblePump = true;
  bool isVisibleNotPump = false;
  bool isVisibleIce = true;
  bool isVisibleNotIce = false;
  bool isVisibleLab = true;
  bool isVisibleNotLab = false;
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

  MyLocalController myLocalController = Get.put(MyLocalController());

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
                AppbarDetailsOrder(widthValue, heightValue, myLocalController),
                SizedBox(
                  height: heightValue * 1.2,
                ),
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
                      SizedBox(
                        height: heightValue * 1.2,
                      ),
                      FromTextRegisterShared(
                          labelText: 'type_of_casting'.tr,
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
                          hintText: 'type_of_casting'.tr),
                      SizedBox(
                        height: heightValue * .7,
                      ),
                      InkWell(
                        onTap: () async {
                          DateTime? pickedDate = await showDatePicker(
                              context: context,
                              initialDate: DateTime.now(),
                              firstDate: DateTime(2000),
                              //DateTime.now() - not to allow to choose before today.
                              lastDate: DateTime(2101));

                          if (pickedDate != null) {
                            print(
                                pickedDate); //pickedDate output format => 2021-03-10 00:00:00.000 yyyy-MM-dd
                            formattedDate =
                                DateFormat('yyyy-MM-dd').format(pickedDate);
                            print(
                                formattedDate); //formatted date output using intl package =>  2021-03-16
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
                                    color: Themes.ColorApp2, width: 1)),
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text(
                                    "execution_date".tr,
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 2,
                                    style: TextStyle(
                                        fontFamily: 'FF Shamel Family',
                                        fontSize: 14,
                                        color: Themes.ColorApp8,
                                        fontWeight: FontWeight.w500),
                                  ),
                                  SizedBox(
                                    width: widthValue * .5,
                                  ),
                                  Text(
                                    formattedDate == null ? "" : formattedDate!,
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 2,
                                    style: TextStyle(
                                        fontFamily: 'FF Shamel Family',
                                        fontSize: 14,
                                        color: Themes.ColorApp8,
                                        fontWeight: FontWeight.w500),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: heightValue * .7,
                      ),
                      FromTextRegisterShared(
                          labelText: 'quantity'.tr,
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
                          hintText: 'quantity'.tr),
                      SizedBox(
                        height: heightValue * .7,
                      ),
                      FromTextRegisterShared(
                          labelText: 'mix_type'.tr,
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
                          hintText: 'mix_type'.tr),
                      SizedBox(
                        height: heightValue * .7,
                      ),
                      FromTextRegisterShared(
                          labelText: 'cement_type'.tr,
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
                          hintText: 'cement_type'.tr),
                      SizedBox(
                        height: heightValue * .7,
                      ),
                      FromTextRegisterShared(
                          labelText: 'stone_size'.tr,
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
                          hintText: 'stone_size'.tr),
                      SizedBox(
                        height: heightValue * .7,
                      ),
                      FromTextRegisterShared(
                          labelText: 'Special_specifications'.tr,
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
                          hintText: 'Special_specifications'.tr),
                      SizedBox(
                        height: heightValue * .7,
                      ),
                      FromTextRegisterShared(
                          labelText: 'Your_location_map'.tr,
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
                          hintText: 'Your_location_map'.tr),
                      SizedBox(
                        height: heightValue * .7,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 15),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              isVisiblePump ?
                              ActiveWidgetChoseItem(
                                  widthValue: widthValue,
                                  name: 'with_pump'.tr,
                                  image: Assets.imagesSelectedMark,
                                  onTap: () {
                                    setState(() {
                                      isVisiblePump = true;
                                      isVisibleNotPump = false;
                                    });
                                  }) : NotActiveWidgetChoseItem(
                                widthValue: widthValue,
                                name: 'with_pump'.tr,
                                onTap: () {
                                  setState(() {
                                    isVisiblePump = true;
                                    isVisibleNotPump = false;
                                  });
                                },
                              ),
                              SizedBox(
                                width: widthValue * 1.5,
                              ),
                              isVisibleNotPump ?
                              ActiveWidgetChoseItem(
                                  widthValue: widthValue,
                                  name: 'with_out_pump'.tr,
                                  image: Assets.imagesSelectedMark,
                                  onTap: () {
                                    setState(() {
                                      isVisibleNotPump = true;
                                      isVisiblePump = false;
                                    });
                                  }) :
                              NotActiveWidgetChoseItem(
                                widthValue: widthValue,
                                name: 'with_out_pump'.tr,
                                onTap: () {
                                  setState(() {
                                    isVisibleNotPump = true;
                                    isVisiblePump = false;
                                  });
                                },
                              )
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: heightValue * .7,
                      ),
                      FromTextRegisterShared(
                          labelText: 'pump_length'.tr,
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
                          hintText: 'pump_length'.tr),
                      SizedBox(
                        height: heightValue * .7,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 15),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              isVisibleIce ?
                              ActiveWidgetChoseItem(
                                  widthValue: widthValue,
                                  name: 'with_ice'.tr,
                                  image: Assets.imagesSelectedMark,
                                  onTap: () {
                                    setState(() {
                                      isVisibleIce = true;
                                      isVisibleNotIce = false;
                                    });
                                  }) :
                              NotActiveWidgetChoseItem(
                                  widthValue: widthValue,
                                  name: 'with_ice'.tr,
                                  onTap: () {
                                    setState(() {
                                      isVisibleIce = true;
                                      isVisibleNotIce = false;
                                    });
                                  }),
                              SizedBox(
                                width: widthValue * 1.5,
                              ),
                              isVisibleNotIce ?
                              ActiveWidgetChoseItem(
                                  widthValue: widthValue,
                                  name: 'with_out_ice'.tr,
                                  image: Assets.imagesSelectedMark,
                                  onTap: () {
                                    setState(() {
                                      isVisibleNotIce = true;
                                      isVisibleIce = false;
                                    });
                                  }) :
                              NotActiveWidgetChoseItem(
                                  widthValue: widthValue,
                                  name: 'with_out_ice'.tr,
                                  onTap: () {
                                    setState(() {
                                      isVisibleNotIce = true;
                                      isVisibleIce = false;
                                    });
                                  })
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: heightValue * .7,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 15),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              isVisibleLab ?
                              ActiveWidgetChoseItem(
                                  widthValue: widthValue,
                                  name: 'with_lab'.tr,
                                  image: Assets.imagesSelectedMark,
                                  onTap: () {
                                    setState(() {
                                      isVisibleLab = true;
                                      isVisibleNotLab = false;
                                    });
                                  }) :
                              NotActiveWidgetChoseItem(
                                  widthValue: widthValue,
                                  name: 'with_lab'.tr,
                                  onTap: () {
                                   setState(() {
                                     isVisibleLab = true;
                                     isVisibleNotLab = false;
                                   });
                                  }),
                              SizedBox(
                                width: widthValue * 1.5,
                              ),
                              isVisibleNotLab ?
                              ActiveWidgetChoseItem(
                                  widthValue: widthValue,
                                  name: 'with_out_lab'.tr,
                                  image: Assets.imagesSelectedMark,
                                  onTap: () {
                                    setState(() {
                                      isVisibleNotLab = true;
                                      isVisibleLab = false;
                                    });
                                  }) :
                              NotActiveWidgetChoseItem(
                                  widthValue: widthValue,
                                  name: 'with_out_lab'.tr,
                                  onTap: () {
                                    setState(() {
                                      isVisibleNotLab = true;
                                      isVisibleLab = false;
                                    });
                                  }),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: heightValue * 1.2,
                      ),
                      CustomButtonImage(
                          title: 'send'.tr,
                          hight: 50,
                          onTap: () {
                            if (formKey.currentState!.validate()) {
                              if (formattedDate == null) {
                                Fluttertoast.showToast(
                                  msg: 'date_must_request'.tr,
                                  fontSize: 15,
                                  backgroundColor: Themes.whiteColor,
                                  gravity: ToastGravity.BOTTOM,
                                  textColor: Themes.ColorApp1,
                                  timeInSecForIosWeb: 1,
                                  toastLength: Toast.LENGTH_SHORT,
                                );
                              } else if (!(formattedDateCurrent!
                                      .compareTo(formattedDate!) <=
                                  0)) {
                                Fluttertoast.showToast(
                                    msg: "Invalid_order_date".tr,
                                    toastLength: Toast.LENGTH_SHORT,
                                    gravity: ToastGravity.BOTTOM,
                                    timeInSecForIosWeb: 1,
                                    backgroundColor: Colors.grey.shade300,
                                    textColor: Colors.black,
                                    fontSize: 15.0);
                              } else {
                                Get.to(const MyAddressRequestOfferScreen());
                              }
                            }
                          }),
                      SizedBox(
                        height: heightValue * 1.2,
                      ),
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

class ActiveWidgetChoseItem extends StatelessWidget {
  ActiveWidgetChoseItem(
      {Key? key,
      required this.widthValue,
      required this.name,
      required this.image,
      required this.onTap})
      : super(key: key);

  double? widthValue;
  String? name, image;
  void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          width: Get.width,
          height: 50,
          decoration: BoxDecoration(
              border: Border.all(color: Themes.ColorApp1, width: 1),
              borderRadius: BorderRadius.circular(15)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                image!,
                fit: BoxFit.contain,
              ),
              SizedBox(
                width: widthValue! * 1,
              ),
              Text(
                name!,
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
    );
  }
}

class NotActiveWidgetChoseItem extends StatelessWidget {
  NotActiveWidgetChoseItem(
      {Key? key,
      required this.widthValue,
      required this.name,
      required this.onTap})
      : super(key: key);

  double? widthValue;
  String? name;
  void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          width: Get.width,
          height: 50,
          decoration: BoxDecoration(
              border: Border.all(color: Themes.ColorApp2, width: 1),
              borderRadius: BorderRadius.circular(15)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                name!,
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
    );
  }
}

class AppbarDetailsOrder extends StatelessWidget {
  AppbarDetailsOrder(this.widthValue, this.heightValue, this.myLocalController);

  MyLocalController myLocalController;
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
              'request_offer_price'.tr,
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
                myLocalController.language!.languageCode == "ar"
                    ? Icons.subdirectory_arrow_right
                    : Icons.subdirectory_arrow_left,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
