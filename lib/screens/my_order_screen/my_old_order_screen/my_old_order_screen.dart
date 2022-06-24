
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nabny/model/my_old_order_model.dart';
import 'package:nabny/screens/my_order_screen/my_old_order_screen/details_old_order_screen.dart';
import 'package:nabny/screens/my_order_screen/my_old_order_screen/my_old_order_controller.dart';

import '../../../generated/assets.dart';
import '../../../utils/Themes.dart';

class MyOldOrderScreen extends StatelessWidget {
   MyOldOrderScreen({Key? key}) : super(key: key);

  MyOldOrderController myOldOrderController = Get.put(MyOldOrderController());
  @override
  Widget build(BuildContext context) {
    var heightValue = Get.height * 0.024;
    var widthValue = Get.width * 0.024;

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
            child: Obx(() => ListView.builder(
              itemCount: myOldOrderController.myOldOrderModel.length,
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                  child: GestureDetector(
                    onTap: (){
                      Get.to(DetailsOldOrderScreen());
                    },
                    child: Card(
                      elevation: 2,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15)
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            CompanyDetails(myOldOrderController.myOldOrderModel[index]),
                            SizedBox(height: heightValue * 1,),
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 5),
                              child: Divider(height: 10, color: Themes.ColorApp2,),
                            ),
                            SizedBox(height: heightValue * .5,),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Container(
                                  child: Center(
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Image.asset(Assets.iconsWalletMenuIcon,width: 15,height: 15,fit: BoxFit.contain,),
                                        SizedBox(width: widthValue * 1,),
                                        Text(
                                          '${myOldOrderController.myOldOrderModel[index].DateOrder}',
                                          style: TextStyle(
                                            fontWeight: FontWeight.w400,
                                            fontSize: 12,
                                            color: Themes.ColorApp1,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                SizedBox(width: widthValue * 3.5,),
                                Container(
                                  child: Center(
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Image.asset(Assets.iconsWalletMenuIcon,width: 15,height: 15,fit: BoxFit.contain,),
                                        SizedBox(width: widthValue * 1,),
                                        Text(
                                          'received'.tr,
                                          style: TextStyle(
                                            fontWeight: FontWeight.w400,
                                            fontSize: 12,
                                            color: Themes.ColorApp1,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                Icon(Icons.subdirectory_arrow_left,color: Themes.ColorApp1,size: 25,)
                              ],
                            ),
                            SizedBox(height: heightValue * 1,)
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              },),)
        ),
      ),
    );
  }
}

class CompanyDetails extends StatelessWidget {
  CompanyDetails(this.myCurrentOrderModel);

  MyOldOrderModel? myCurrentOrderModel;
  var heightValue = Get.height * 0.024;
  var widthValue = Get.width * 0.024;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 5),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
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
                        image: AssetImage('${myCurrentOrderModel!.ImageCompany}'),
                        fit: BoxFit.contain,
                        width: 35,
                        height: 35,
                      ),
                    ),
                  ),
                  SizedBox(width: widthValue *1,),
                  Text(
                    '${myCurrentOrderModel!.NameCompany}',
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 16,
                      color: Themes.ColorApp1,
                    ),
                  ),
                ],
              ),
              Text(
                '${myCurrentOrderModel!.OrderNumber}',
                style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 13,
                  color: Themes.ColorApp2,
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: heightValue* .5,),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Container(
                child: Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Image.asset(Assets.iconsWalletMenuIcon,width: 15,height: 15,fit: BoxFit.contain,),
                      SizedBox(width: widthValue * 1,),
                      Text(
                        '${myCurrentOrderModel!.PriceOrder} ريال ',
                        style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 12,
                          color: Themes.ColorApp1,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                child: Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'request_type'.tr,
                        style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 12,
                          color: Themes.ColorApp2,
                        ),
                      ),
                      SizedBox(width: widthValue * .2,),
                      Text(
                        '${myCurrentOrderModel!.OrderStyle}',
                        style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 12,
                          color: Themes.ColorApp1,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}