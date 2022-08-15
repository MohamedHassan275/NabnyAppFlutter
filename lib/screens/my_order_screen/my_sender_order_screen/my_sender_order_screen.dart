
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nabny/componant/LoadingWidget.dart';
import 'package:nabny/model/my_new_order_model.dart';
import 'package:nabny/screens/my_order_screen/my_sender_order_screen/details_sender_order_screen.dart';
import 'package:nabny/screens/my_order_screen/my_sender_order_screen/my_send_order_controller.dart';

import '../../../generated/assets.dart';
import '../../../model/my_send_order_model.dart';
import '../../../utils/Themes.dart';

class MySenderOrderScreen extends StatefulWidget {
  const MySenderOrderScreen({Key? key}) : super(key: key);

  @override
  State<MySenderOrderScreen> createState() => _MySenderOrderScreenState();
}

class _MySenderOrderScreenState extends State<MySenderOrderScreen> {

  var heightValue = Get.height * 0.024;
  var widthValue = Get.width * 0.024;
  MySendOrderController mySendOrderController = Get.put(MySendOrderController());


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: RefreshIndicator(
        onRefresh: () async{
          setState(() {
            mySendOrderController.getMySendOrderUser();
          });
        },
        child: SafeArea(
            child: SingleChildScrollView(
              child: Container(
                child: Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: GetBuilder<MySendOrderController>(
                    init: MySendOrderController(),
                    builder: (controller) {
                      if(controller.Loading){
                        return LoadingWidget(data: '');
                      }
                      return controller.sendOrder!.isNotEmpty ?
                      ListView.builder(
                        itemCount: controller.sendOrder!.length,
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                            child: MySendOrderListItem(sendOrder: controller.sendOrder![index], heightValue: heightValue,widthValue: widthValue,),
                          );
                        },) : NoItemOFList();
                    },),
                ),
              ),)
        ),
      ),
    );
  }
}

class MySendOrderListItem extends StatelessWidget {
   MySendOrderListItem({Key? key,required this.sendOrder,required this.widthValue,required this.heightValue}) : super(key: key);
   double heightValue,widthValue;
   SendOrder sendOrder;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      // onTap: (){
      //   Get.to(DetailsSenderOrderScreen());
      // },
      child: Card(
        elevation: 2,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15)
        ),
        child: Padding(
          padding: const EdgeInsets.all(0.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              CompanyDetails(sendOrder),
              SizedBox(height: heightValue * 1,),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5),
                child: Divider(height: 10, color: Themes.ColorApp2,),
              ),
              SizedBox(height: heightValue * .5,),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5),
                child: Row(
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
                    SizedBox(width: widthValue * .5,),
                    Text(
                      '${sendOrder.offerCost}',
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 14,
                        color: Themes.ColorApp1,
                      ),
                    ),
                    SizedBox(width: widthValue * .3,),
                    Text(
                      'sar'.tr,
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 14,
                        color: Themes.ColorApp1,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: heightValue * 1,),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: GestureDetector(
                  onTap: (){
                    Get.to(DetailsSenderOrderScreen(sendOrder: sendOrder,));
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
    );
  }
}

class NoItemOFList extends StatelessWidget {
  NoItemOFList({Key? key}) : super(key: key);

  var widthValue = Get.width * 0.024;
  var heightValue = Get.height * 0.024;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: SizedBox(
        width: Get.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: heightValue * 2,
            ),
            Image.asset(
              Assets.imagesOfferPrice,
              fit: BoxFit.contain,
            ),
            SizedBox(
              height: heightValue * 1,
            ),
            Text(
              'no_requests_offers_have_added_before'.tr,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Themes.ColorApp8,
                fontSize: 17,
                fontWeight: FontWeight.w400,
              ),
            ),
            SizedBox(
              height: heightValue * .7,
            )
          ],
        ),
      ),
    );
  }
}

class CompanyDetails extends StatelessWidget {
  CompanyDetails(this.myCurrentOrderModel);

  SendOrder? myCurrentOrderModel;
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
                        image: AssetImage(Assets.iconsFactoryNamIcon),
                        fit: BoxFit.contain,
                        width: 35,
                        height: 35,
                      ),
                    ),
                  ),
                  SizedBox(width: widthValue *1,),
                  Text(
                    '${myCurrentOrderModel!.company}',
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 16,
                      color: Themes.ColorApp1,
                    ),
                  ),
                ],
              ),
              Text(
                '${myCurrentOrderModel!.orderNumber}#',
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
                        '${myCurrentOrderModel!.offerCost}',
                        style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 12,
                          color: Themes.ColorApp1,
                        ),
                      ),
                      SizedBox(width: widthValue *.2,),
                      Text(
                        'sar'.tr,
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
                        '${myCurrentOrderModel!.castingType}',
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
