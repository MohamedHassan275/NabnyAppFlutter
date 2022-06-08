import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nabny/componant/CustomButtonWidget.dart';
import 'package:nabny/generated/assets.dart';
import 'package:nabny/model/request_offer_order_model.dart';
import 'package:nabny/screens/request_offer_price_screen/request_offer_price_controller.dart';
import 'package:nabny/utils/Themes.dart';

import '../home_main_screen/home_main_screen.dart';

class RequestOfferPriceScreen extends StatefulWidget {
  const RequestOfferPriceScreen({Key? key}) : super(key: key);

  @override
  _RequestOfferPriceScreenState createState() =>
      _RequestOfferPriceScreenState();
}

class _RequestOfferPriceScreenState extends State<RequestOfferPriceScreen> {
  RequestOfferPriceController requestOfferPriceController =
      Get.put(RequestOfferPriceController());

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
                SizedBox(height: heightValue * 1,),
                Obx(() => Padding(
                  padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 5),
                  child: ListView.builder(
                    itemCount: requestOfferPriceController.requestOfferOrderModel.length,
                        physics: NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          return Column(
                            children: [
                              RequestOfferOrderItems(requestOfferOrderModel: requestOfferPriceController.requestOfferOrderModel[index]),
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
                                        'لديك من العروض',
                                        style: TextStyle(
                                          fontWeight: FontWeight.w500,
                                          fontSize: 18,
                                          color: Themes.ColorApp8,
                                        ),
                                      ),
                                      SizedBox(width: widthValue * .2,),
                                      Container(
                                        width: 40,
                                        height: 20,
                                        decoration: BoxDecoration(
                                            border: Border.all(
                                                width: 1,
                                                color: Themes.ColorApp1
                                            ),
                                            borderRadius: BorderRadius.circular(35)
                                        ),
                                        child: Center(
                                          child:  Text(
                                            '${requestOfferPriceController.requestOfferOrderModel.length}',
                                            style: TextStyle(
                                              fontWeight: FontWeight.w400,
                                              fontSize: 16,
                                              color: Themes.ColorApp1,
                                            ),
                                          ),
                                        ),
                                      ),
                                      SizedBox(width: widthValue * .2,),
                                      Text(
                                        'عروض',
                                        style: TextStyle(
                                          fontWeight: FontWeight.w500,
                                          fontSize: 16,
                                          color: Themes.ColorApp1,
                                        ),
                                      ),
                                      CustomButtonImage(title: 'مشاهدة', hight: 50, onTap: ()=> Get.to(''))
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          );
                        },
                      ),
                )),
               // Align(alignment: Alignment.center, child: NoItemOFList()),
                // Positioned(
                //     bottom: heightValue * 2.5,
                //     child: CustomButtonImage(
                //       title: 'اضافه طلب',
                //       hight: 50,
                //       onTap: () => Get.to(''),
                //     ))
              ],
            ),
          ),
        ),
      ),
    );
  }
}


class RequestOfferOrderItems extends StatelessWidget {
   RequestOfferOrderItems({required this.requestOfferOrderModel});

   RequestOfferOrderModel requestOfferOrderModel;
   var widthValue = Get.width * 0.024;
   var heightValue = Get.height * 0.024;

  @override
  Widget build(BuildContext context) {
    return Padding(
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
              AddressDetailsOrder(requestOfferOrderModel: requestOfferOrderModel,),
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
              DetailsOrder(widthValue, 'نوع الصبة ؟', '${requestOfferOrderModel.typeCastingOrderRequest}'),
              SizedBox(
                height: heightValue * .7,
              ),
              DetailsOrder(widthValue, 'موعد تنفذ الطلبية ؟', '${requestOfferOrderModel.dateOrderRequest}'),
              SizedBox(
                height: heightValue * .7,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  DetailsOrder(widthValue, 'الكميه', '${requestOfferOrderModel.weightOrderRequest}'),
                  SizedBox(
                    height: heightValue * .7,
                  ),
                  DetailsOrder(widthValue, 'نوع الخلطه', '${requestOfferOrderModel.mixTypeOrderRequest}'),
                  SizedBox(
                    height: heightValue * .7,
                  ),
                  DetailsOrder(widthValue, 'نوع الاسمنت', '${requestOfferOrderModel.cementTypeOrderRequest}'),
                  SizedBox(
                    height: heightValue * .7,
                  ),
                  DetailsOrder(widthValue, 'مقاس الحجر', '${requestOfferOrderModel.stoneTypeOrderRequest}'),
                  SizedBox(
                    height: heightValue * .7,
                  ),
                  DetailsOrder(widthValue, 'مواصفات خاصه', '${requestOfferOrderModel.specialOrderRequest}'),
                  SizedBox(
                    height: heightValue * .7,
                  ),
                  DetailsOrder(widthValue, 'طلب مضخه', '${requestOfferOrderModel.pumpLengthOrderRequest}'),
                  SizedBox(
                    height: heightValue * .7,
                  ),
                ],
              ),
              SizedBox(
                height: heightValue * 1.2,
              ),
            ],
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

class NoItemOFList extends StatelessWidget {
  NoItemOFList({Key? key}) : super(key: key);

  var widthValue = Get.width * 0.024;
  var heightValue = Get.height * 0.024;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Get.width,
      height: 100,
      child: Column(
        children: [
          Image.asset(
            Assets.imagesOfferPrice,
            fit: BoxFit.contain,
          ),
          SizedBox(
            height: heightValue * 1,
          ),
          Text(
            'لايوجد اي طلبات عروض تمت اضافتها من قبل',
            style: TextStyle(
              color: Themes.ColorApp8,
              fontSize: 25,
              fontWeight: FontWeight.w400,
            ),
          ),
          SizedBox(
            height: heightValue * .7,
          )
        ],
      ),
    );
  }
}

class AddressDetailsOrder extends StatelessWidget {
  AddressDetailsOrder({required this.requestOfferOrderModel});

  RequestOfferOrderModel requestOfferOrderModel;
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
                    '${requestOfferOrderModel.TitleAddress}',
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 14,
                      color: Themes.ColorApp1,
                    ),
                  ),
                  SizedBox(
                    height: heightValue * .3,
                  ),
                  Text(
                    '${requestOfferOrderModel.DetailsAddress}',
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 12,
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
