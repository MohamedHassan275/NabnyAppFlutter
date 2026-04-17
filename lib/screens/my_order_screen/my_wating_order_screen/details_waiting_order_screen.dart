import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nabny/componant/nabny_app_bar.dart';
import 'package:nabny/generated/assets.dart';
import 'package:nabny/model/my_new_order_model.dart';

import '../../../utils/Themes.dart';

class DetailsWaitingOrderScreen extends StatelessWidget {
  DetailsWaitingOrderScreen({Key? key, required this.newOrder}) : super(key: key);
  NewOrder newOrder;
  @override
  Widget build(BuildContext context) {
    var heightValue = Get.height * 0.024;
    var widthValue = Get.width * 0.024;
    return Scaffold(
      backgroundColor: Themes.ColorApp7,
      appBar: NabnyAppBar(title: 'contract_details'.tr),
      body: SingleChildScrollView(
          child: Container(
            width: Get.width,
            child: Column(
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: heightValue * 1.2,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 5),
                      child: Card(
                        elevation: 2.0,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              AddressDetailsOrder(
                                newOrder: newOrder,
                              ),
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
                              DetailsOrder(widthValue, 'type_of_casting'.tr, '${newOrder.castingType}'),
                              SizedBox(
                                height: heightValue * .7,
                              ),
                              DetailsOrder(widthValue, 'execution_date'.tr, '${newOrder.executionDate}'),
                              SizedBox(
                                height: heightValue * .7,
                              ),
                              DetailsOrder(widthValue, 'quantity'.tr, '${newOrder.qtyM}'),
                              SizedBox(
                                height: heightValue * .7,
                              ),
                              DetailsOrder(widthValue, 'mix_type'.tr, '${newOrder.mixType}'),
                              SizedBox(
                                height: heightValue * .7,
                              ),
                              DetailsOrder(widthValue, 'cement_type'.tr, '${newOrder.cementType}'),
                              SizedBox(
                                height: heightValue * .7,
                              ),
                              DetailsOrder(widthValue, 'stone_size'.tr, '${newOrder.stoneSize}'),
                              SizedBox(
                                height: heightValue * .7,
                              ),
                              DetailsOrder(widthValue, 'Special_specifications'.tr, '${newOrder.specialDescription}'),
                              SizedBox(
                                height: heightValue * .7,
                              ),
                              DetailsOrder(widthValue, 'pump_order'.tr, newOrder.withPump == 1 ? 'pump_order'.tr : 'with_out_pump'.tr),
                              SizedBox(
                                height: heightValue * .7,
                              ),
                              Container(
                                height: 50,
                                decoration: BoxDecoration(color: Themes.ColorApp14, borderRadius: BorderRadius.circular(25)),
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 10),
                                  child: Center(
                                    child: Text(
                                      'Please_wait_request'.tr,
                                      style: TextStyle(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 15,
                                        color: Themes.ColorApp8,
                                      ),
                                    ),
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
                SizedBox(
                  height: heightValue * 2,
                ),
              ],
            ),
          ),
        ),
    );
  }
}


class AddressDetailsOrder extends StatelessWidget {
  AddressDetailsOrder({required this.newOrder});

  NewOrder newOrder;
  var heightValue = Get.height * 0.024;
  var widthValue = Get.width * 0.024;
  @override
  Widget build(BuildContext context) {
    return Row(
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
                    '${newOrder.address}',
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
  DetailsOrder(this.widthValue, this.title, this.details);

  double widthValue;
  String title, details;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text(
          '$title : ',
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
