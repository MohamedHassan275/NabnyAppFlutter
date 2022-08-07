import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:nabny/componant/CustomButtonWidget.dart';
import 'package:nabny/core/constant/constant.dart';
import 'package:nabny/core/localization/local_controller.dart';
import 'package:nabny/generated/assets.dart';
import 'package:nabny/model/my_new_order_model.dart';
import 'package:nabny/model/my_send_order_model.dart';
import 'package:nabny/screens/my_order_screen/my_sender_order_screen/my_send_order_controller.dart';

import '../../../core/servies/storage_service.dart';
import '../../../core/widget/custom_circler_progress_indicator_widget.dart';
import '../../../utils/Themes.dart';
import '../../home_main_screen/home_main_screen.dart';


class DetailsSenderOrderScreen extends StatelessWidget {
   DetailsSenderOrderScreen({Key? key,required this.sendOrder}) : super(key: key);
   SendOrder sendOrder;
  @override
  Widget build(BuildContext context) {
    var heightValue = Get.height * 0.024;
    var widthValue = Get.width * 0.024;
    MySendOrderController mySendOrderController = Get.put(MySendOrderController());
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            width: Get.width,
            height: Get.height,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AppbarDetailsOrder(widthValue, heightValue),
                      SizedBox(
                        height: heightValue * 1.2,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 5),
                        child: Card(
                          elevation: 2.0,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15)),
                          child: Padding(
                            padding: const EdgeInsets.all(10),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                AddressDetailsOrder(sendOrder: sendOrder,),
                                SizedBox(
                                  height: heightValue * .7,
                                ),
                                Divider(
                                  height: 10,
                                  color: Themes.ColorApp2,
                                ),
                                SizedBox(
                                  height: heightValue * .7,
                                ),
                                DetailsOrder(widthValue, 'type_of_casting'.tr, '${sendOrder.castingType}'),
                                SizedBox(
                                  height: heightValue * .7,
                                ),
                                DetailsOrder(widthValue, 'execution_date'.tr, '${sendOrder.executionDate}'),
                                SizedBox(
                                  height: heightValue * .7,
                                ),
                                DetailsOrder(widthValue, 'quantity'.tr, '${sendOrder.qtyM}'),
                                SizedBox(
                                  height: heightValue * .7,
                                ),
                                DetailsOrder(widthValue, 'mix_type'.tr, '${sendOrder.mixType}'),
                                SizedBox(
                                  height: heightValue * .7,
                                ),
                                DetailsOrder(widthValue, 'cement_type'.tr, '${sendOrder.cementType}'),
                                SizedBox(
                                  height: heightValue * .7,
                                ),
                                DetailsOrder(widthValue, 'stone_size'.tr, '${sendOrder.stoneSize}'),
                                SizedBox(
                                  height: heightValue * .7,
                                ),
                                DetailsOrder(widthValue, 'Special_specifications'.tr, '${sendOrder.specialDescription}'),
                                SizedBox(
                                  height: heightValue * .7,
                                ),
                                DetailsOrder(widthValue, 'pump_order'.tr, sendOrder.withPump!.contains('1')? 'طلب مضخه' : 'بدون طلب مضخه'),
                                SizedBox(
                                  height: heightValue * .7,
                                ),
                                Container(
                                  height: 50,
                                  decoration: BoxDecoration(
                                      color: Themes.ColorApp14,
                                      borderRadius: BorderRadius.circular(25)
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(horizontal: 10),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children: [
                                        Text(
                                          'The_cost_bid'.tr,
                                          style: TextStyle(
                                            fontWeight: FontWeight.w500,
                                            fontSize: 18,
                                            color: Themes.ColorApp8,
                                          ),
                                        ),
                                        Row(
                                          children: [
                                            Text(
                                              '${sendOrder.qtyM}',
                                              style: TextStyle(
                                                fontWeight: FontWeight.w500,
                                                fontSize: 16,
                                                color: Themes.ColorApp1,
                                              ),
                                            ),
                                            SizedBox(width: widthValue * .3,),
                                            Text(
                                              'sar'.tr,
                                              style: TextStyle(
                                                fontWeight: FontWeight.w500,
                                                fontSize: 16,
                                                color: Themes.ColorApp1,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: heightValue * 1.2,
                                ),
                              ],
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                  SizedBox(height: heightValue * 2,),
                  CirclerProgressIndicatorWidget(isLoading: mySendOrderController.loading ? true : false),
                  SizedBox(height: heightValue * 1.5,),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      CustomButtonImage(title: 'accept'.tr, hight: 50, onTap: (){
                        CustomFlutterToast(sendOrder.id.toString());
                        mySendOrderController.AcceptOrder(sendOrder.id.toString(), '');
                        // Get.off(HomeMainScreen(valueBack: ''));
                        // Fluttertoast.showToast(msg: 'accepted_order'.tr,
                        //   backgroundColor: Themes.ColorApp8,
                        //   toastLength: Toast.LENGTH_LONG,
                        //   textColor: Themes.whiteColor,
                        //   gravity: ToastGravity.BOTTOM,
                        //   fontSize: 13,);
                      }),
                      SizedBox(height: heightValue * 1.2,),
                      GestureDetector(
                        onTap: (){
                          CustomFlutterToast(sendOrder.id.toString());
                          mySendOrderController.AcceptOrder(sendOrder.id.toString(), '');
                          // Get.off(HomeMainScreen(valueBack: ''));
                          // Fluttertoast.showToast(msg: 'canceled_order'.tr,
                          //   backgroundColor: Themes.ColorApp8,
                          //   toastLength: Toast.LENGTH_LONG,
                          //   textColor: Themes.whiteColor,
                          //   gravity: ToastGravity.BOTTOM,
                          //   fontSize: 13,);
                        },
                        child: Container(
                          width: Get.width,
                          height: 50,
                          child: Center(
                            child:  Text(
                              'cancel_order'.tr,
                              style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 16,
                                color: Themes.ColorApp9,
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: heightValue * 1.5,),
                    ],
                  ),
                  SizedBox(height: heightValue * 2,)
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class AppbarDetailsOrder extends StatelessWidget {
   AppbarDetailsOrder(this.widthValue,this.heightValue);

   double heightValue,widthValue;
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
                  topLeft: Radius.circular(35),
                  topRight: Radius.circular(35))),
          child: Center(
            child: Text(
              'contract_details'.tr,
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
                Get.find<StorageService>().activeLocale.languageCode == "en"
                    ? Icons.keyboard_arrow_right
                    : Icons.keyboard_arrow_left,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class AddressDetailsOrder extends StatelessWidget {
  AddressDetailsOrder({required this.sendOrder});
  SendOrder sendOrder;
  var heightValue = Get.height * 0.024;
  var widthValue = Get.width * 0.024;
  @override
  Widget build(BuildContext context) {
    return  Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              width: 50,
              height: 50,
              decoration: BoxDecoration(
                color: Themes.ColorApp14,
                borderRadius: BorderRadius.circular(15),
              ),
              child: Center(
                child: Image(
                  image: AssetImage(Assets.iconsDistanceIcon),
                  fit: BoxFit.contain,
                  width: 35,
                  height: 35,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '${sendOrder.address}',
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 14,
                      color: Themes.ColorApp1,
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ],
    );
  }
}

class DetailsOrder extends StatelessWidget {
  DetailsOrder(this.widthValue,this.title,this.details);

  double widthValue;
  String title, details;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(
            fontWeight: FontWeight.w400,
            fontSize: 14,
            color: Themes.ColorApp8,
          ),
        ),
        SizedBox(
          width: widthValue * .7,
        ),
        Text(
          details,
          style: TextStyle(
            fontWeight: FontWeight.w400,
            fontSize: 14,
            color: Themes.ColorApp1,
          ),
        ),
      ],
    );
  }
}
