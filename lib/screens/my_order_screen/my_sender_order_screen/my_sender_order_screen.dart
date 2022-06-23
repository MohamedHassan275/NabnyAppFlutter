
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nabny/componant/LoadingWidget.dart';
import 'package:nabny/model/my_sender_order_model.dart';
import 'package:nabny/model/my_waiting_order_model.dart';
import 'package:nabny/screens/my_order_screen/my_sender_order_screen/details_sender_order_screen.dart';

import '../../../generated/assets.dart';
import '../../../utils/Themes.dart';
import 'my_sender_order_controller.dart';

class MySenderOrderScreen extends StatefulWidget {
   MySenderOrderScreen({Key? key}) : super(key: key);

  @override
  State<MySenderOrderScreen> createState() => _MySenderOrderScreenState();
}

class _MySenderOrderScreenState extends State<MySenderOrderScreen> {

  MySenderOrderController myWaitingOrderController = Get.put(MySenderOrderController());

  @override
  Widget build(BuildContext context) {
    var heightValue = Get.height * 0.024;
    var widthValue = Get.width * 0.024;

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Obx(() => ListView.builder(
            itemCount: myWaitingOrderController.mySenderOrderModel.length,
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
             return Padding(
               padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
               child: GestureDetector(
                 // onTap: (){
                 //   Get.to(DetailsSenderOrderScreen());
                 // },
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
                         CompanyDetails(myWaitingOrderController.mySenderOrderModel[index]),
                         SizedBox(height: heightValue * 1,),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 5),
                            child: Divider(height: 10, color: Themes.ColorApp2,),
                          ),
                         SizedBox(height: heightValue * .5,),
                         Row(
                           children: [
                             SizedBox(
                               width: 15,
                               height: 15,
                               child: CircleAvatar(
                                 backgroundColor: Themes.ColorApp17,
                               ),
                             ),
                             SizedBox(width: widthValue * 1,),
                             Text(
                               'cost_of_bid'.tr,
                               style: TextStyle(
                                 fontWeight: FontWeight.w500,
                                 fontSize: 14,
                                 color: Themes.ColorApp17,
                               ),
                             ),
                             SizedBox(width: widthValue * 1,),
                             Text(
                               '${myWaitingOrderController.mySenderOrderModel[index].PriceOrder}',
                               style: TextStyle(
                                 fontWeight: FontWeight.w500,
                                 fontSize: 14,
                                 color: Themes.ColorApp1,
                               ),
                             ),
                           ],
                         ),
                         SizedBox(height: heightValue * 1,),
                         Padding(
                           padding: const EdgeInsets.symmetric(horizontal: 10),
                           child: GestureDetector(
                             onTap: (){
                               Get.to(DetailsSenderOrderScreen());
                             },
                             child: Container(
                               width: Get.width,
                               height: 50,
                               decoration: BoxDecoration(
                                 color: Themes.ColorApp14,
                                 borderRadius: BorderRadius.circular(15),
                               ),
                               child: Center(
                                 child:  Text(
                                   'order_details'.tr,
                                   style: TextStyle(
                                     fontWeight: FontWeight.w500,
                                     fontSize: 16,
                                     color: Themes.ColorApp1,
                                   ),
                                 ),
                               ),
                             ),
                           ),
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

  MySenderOrderModel? myCurrentOrderModel;
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
                  image: AssetImage('${myCurrentOrderModel!.ImageCompany}'),
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
                    '${myCurrentOrderModel!.NameCompany}',
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 16,
                      color: Themes.ColorApp1,
                    ),
                  ),
                  SizedBox(height: heightValue * .3,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
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
                      SizedBox(width: widthValue * 3.5,),
                      Container(
                        child: Center(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                               Text(
                                'quantity'.tr,
                                style: TextStyle(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 12,
                                  color: Themes.ColorApp2,
                                ),
                              ),
                              SizedBox(width: widthValue * .2,),
                              Text(
                                '${myCurrentOrderModel!.Wight}',
                                style: TextStyle(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 12,
                                  color: Themes.ColorApp1,
                                ),
                              ),
                            ],
                          ),
                        ),
                      )
                    ],
                  )
                ],
              ),
            )
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              '${myCurrentOrderModel!.OrderNumber}',
              style: TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 12,
                color: Themes.ColorApp2,
              ),
            ),
            SizedBox(width: widthValue * 1,),
          ],
        )
      ],
    );
  }
}
