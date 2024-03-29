
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nabny/model/my_current_order_model.dart';
import 'package:nabny/model/my_new_order_model.dart';
import 'package:nabny/screens/home_main_screen/home_main_screen.dart';
import 'package:nabny/screens/my_order_screen/my_current_order_screen/my_current_order_controller.dart';

import '../../../componant/CustomButtonWidget.dart';
import '../../../core/constant/Themes.dart';
import '../../../core/constant/constant.dart';
import '../../../core/localization/local_controller.dart';
import '../../../core/servies/storage_service.dart';
import '../../../core/widget/custom_circler_progress_indicator_widget.dart';
import '../../../generated/assets.dart';

class DetailsMyCurrentOrder extends StatelessWidget {
  DetailsMyCurrentOrder({Key? key,required this.currentOrder}) : super(key: key);
  CurrentOrder currentOrder;
  MyCurrentOrderController myCurrentOrderController = Get.put(MyCurrentOrderController());
  @override
  Widget build(BuildContext context) {
    var heightValue = Get.height * 0.024;
    var widthValue = Get.width * 0.024;
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: SizedBox(
            width: Get.width,
            height: Get.height,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
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
                                AddressDetailsOrder(currentOrder: currentOrder,),
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
                                DetailsOrder(widthValue, 'type_of_casting'.tr, '${currentOrder.castingType}'),
                                SizedBox(
                                  height: heightValue * .7,
                                ),
                                DetailsOrder(widthValue, 'execution_date'.tr, '${currentOrder.executionDate}'),
                                SizedBox(
                                  height: heightValue * .7,
                                ),
                                DetailsOrder(widthValue, 'quantity'.tr, '${currentOrder.qtyM}'),
                                SizedBox(
                                  height: heightValue * .7,
                                ),
                                DetailsOrder(widthValue, 'mix_type'.tr, '${currentOrder.mixType}'),
                                SizedBox(
                                  height: heightValue * .7,
                                ),
                                DetailsOrder(widthValue, 'cement_type'.tr, '${currentOrder.cementType}'),
                                SizedBox(
                                  height: heightValue * .7,
                                ),
                                DetailsOrder(widthValue, 'stone_size'.tr, '${currentOrder.stoneSize}'),
                                SizedBox(
                                  height: heightValue * .7,
                                ),
                                DetailsOrder(widthValue, 'Special_specifications'.tr, '${currentOrder.specialDescription}'),
                                SizedBox(
                                  height: heightValue * .7,
                                ),
                                DetailsOrder(widthValue, 'pump_order'.tr, currentOrder.withPump!.contains('1') ? 'pump_order'.tr : 'with_out_pump'.tr),
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
                                          'request_price'.tr,
                                          style: TextStyle(
                                            fontWeight: FontWeight.w500,
                                            fontSize: 18,
                                            color: Themes.ColorApp17,
                                          ),
                                        ),
                                        Row(
                                          children: [
                                            Text(
                                              '${currentOrder.offerCost}',
                                              style: TextStyle(
                                                fontWeight: FontWeight.w500,
                                                fontSize: 16,
                                                color: Themes.ColorApp1,
                                              ),
                                            ),
                                            SizedBox(width: widthValue* .3,),
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
                                  height: heightValue * .7,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Text(
                                      'Payment_completed_successfully'.tr,
                                      style: TextStyle(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 16,
                                        color: Themes.ColorApp17,
                                      ),
                                    ),
                                    SizedBox(
                                      height: heightValue * .5,
                                    ),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          'order_will_be_received'.tr,
                                          style: TextStyle(
                                            fontWeight: FontWeight.w500,
                                            fontSize: 15,
                                            color: Themes.ColorApp8,
                                          ),
                                        ),
                                        SizedBox(width: widthValue * .5,),
                                        Text(
                                          '${currentOrder.executionDate}',
                                          style: TextStyle(
                                            fontWeight: FontWeight.w500,
                                            fontSize: 15,
                                            color: Themes.ColorApp8,
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: heightValue * .6,
                                    ),
                                    // Text(
                                    //   'order_been_successfully_received'.tr,
                                    //   style: TextStyle(
                                    //     fontWeight: FontWeight.w500,
                                    //     fontSize: 19,
                                    //     color: Themes.ColorApp17,
                                    //   ),
                                    // ),
                                  ],
                                ),
                              GetBuilder<MyCurrentOrderController>(
                                init: MyCurrentOrderController(),
                                  builder: (controller) =>  Column(
                                    children: [
                                      SizedBox(
                                        height: heightValue * 1.5,
                                      ),
                                      CirclerProgressIndicatorWidget(isLoading: myCurrentOrderController.loading ? true : false),
                                      SizedBox(height: heightValue * .7,),
                                      CustomButtonImage(title: 'received_order'.tr, hight: 50, onTap: (){
                                        // CustomFlutterToast(currentOrder.id.toString());
                                        // CustomFlutterToast(currentOrder.executionDate);
                                        // CustomFlutterToast(myCurrentOrderController.formattedDateCurrent);
                                        if ((currentOrder.executionDate!.compareTo(myCurrentOrderController.formattedDateCurrent!) <= 0 &&
                                            currentOrder.executionDate!.compareTo(myCurrentOrderController.formattedDateCurrent!) >= 0)){
                                          Get.find<MyCurrentOrderController>().ReceivedOrder('${currentOrder.id}');
                                        }else {
                                          CustomFlutterToast('operation_cannot_be_completed'.tr);
                                        }

                                      }),
                                      SizedBox(height: heightValue * 1,),
                                      GestureDetector(
                                        onTap: (){
                                          //   CustomFlutterToast(currentOrder.id.toString());
                                          // CustomFlutterToast(currentOrder.executionDate);
                                          // CustomFlutterToast(myCurrentOrderController.formattedDateCurrent);
                                          controller.CancelOrder(currentOrder.id.toString());
                                          //   Get.find<MyCurrentOrderController>().CancelOrder('${currentOrder.id}');
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
                                      SizedBox(height: heightValue * 2,)
                                    ],
                                  ),)
                              ],
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
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
  AddressDetailsOrder({required this.currentOrder});

  CurrentOrder currentOrder;
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
              width: 65,
              height: 65,
              decoration: BoxDecoration(
                color: Themes.ColorApp14,
                borderRadius: BorderRadius.circular(15),
              ),
              child: Center(
                child: Image(
                  image: AssetImage(Assets.iconsDistanceIcon),
                  fit: BoxFit.contain,
                  width: 50,
                  height: 50,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '${currentOrder.address}',
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

