
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nabny/model/factory_offer_price_model.dart';
import 'package:nabny/screens/factory_offer_price_screen/factory_offer_price_controller.dart';
import 'package:nabny/screens/my_address_request_offer_screen/my_address_request_offer_screen.dart';
import 'package:nabny/utils/Themes.dart';

import '../../componant/CustomButtonWidget.dart';
import '../../generated/assets.dart';
import '../home_main_screen/home_main_screen.dart';

class FactoryOfferPriceScreen extends StatefulWidget {
  const FactoryOfferPriceScreen({Key? key}) : super(key: key);

  @override
  _FactoryOfferPriceScreenState createState() => _FactoryOfferPriceScreenState();
}

class _FactoryOfferPriceScreenState extends State<FactoryOfferPriceScreen> {

  FactoryOfferPriceController factoryOfferPriceController = Get.put(FactoryOfferPriceController());

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
                NumberOfOfferPrice(),
                SizedBox(height: heightValue * .7,),
                Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: ListView.builder(
                    shrinkWrap: true,
                    scrollDirection: Axis.vertical,
                    physics: ScrollPhysics(),
                    itemCount: factoryOfferPriceController.factoryOfferPriceModel.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(vertical: 5),
                        child: FactoryItemList(factoryOfferPriceModel: factoryOfferPriceController.factoryOfferPriceModel[index]),
                      );
                    },),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}


class NumberOfOfferPrice extends StatelessWidget {
   NumberOfOfferPrice({Key? key}) : super(key: key);
  var widthValue = Get.width * 0.024;
  var heightValue = Get.height * 0.024;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              height: 25,
              width: 1,
              color: Themes.ColorApp1,
            ),
            Text(
              'لديك من العروض',
              style: TextStyle(
                color: Themes.ColorApp8,
                fontSize: 25,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              width: 50,
              height: 20,
              decoration: BoxDecoration(
                  color: Themes.ColorApp1,
                  borderRadius: BorderRadius.circular(25)
              ),
              child: Center(
                child: Text(
                  'لديك من العروض',
                  style: TextStyle(
                    color: Themes.whiteColor,
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            ),
            SizedBox(width: widthValue * .2,),
            Text(
              'عرض',
              style: TextStyle(
                color: Themes.ColorApp8,
                fontSize: 20,
                fontWeight: FontWeight.w400,
              ),
            ),
          ],
        )
      ],
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

class FactoryItemList extends StatelessWidget {
  FactoryItemList({required this.factoryOfferPriceModel});

  FactoryOfferPriceModel factoryOfferPriceModel;
  var heightValue = Get.height * 0.024;
  var widthValue = Get.width * 0.024;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
       // Get.to(FactoryDetailsScreen());
      },
      child: Card(
        elevation: 2,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15)
        ),
        child: Container(
          width: Get.width,
          decoration: BoxDecoration(
            color: Themes.whiteColor,
            borderRadius: BorderRadius.circular(15),
          ),
          child: Column(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: FadeInImage(
                  image: AssetImage(factoryOfferPriceModel.ImageCompany!),
                  fit: BoxFit.fill,
                  height: 175,
                  width: Get.width,
                  placeholder: AssetImage(Assets.imagesFactoryImage),
                ),
              ),
              SizedBox(
                height: heightValue * .5,
              ),
              Padding(
                padding: const EdgeInsets.all(5.0),
                child: DetailsCompany(factoryOfferPriceModel: factoryOfferPriceModel, heightValue: heightValue, widthValue: widthValue),
              ),
              SizedBox(height: heightValue * 1,),
              OfferPriceAndAcceptedOffer(factoryOfferPriceModel: factoryOfferPriceModel),
              SizedBox(height: heightValue * 1,)
            ],
          ),
        ),
      ),
    );
  }
}


class DetailsCompany extends StatelessWidget {
  DetailsCompany({required this.factoryOfferPriceModel,required this.heightValue,required this.widthValue});

  FactoryOfferPriceModel factoryOfferPriceModel;
  double heightValue,widthValue;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Row(
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
                    image: AssetImage(Assets.iconsFactoryNamIcon),
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
                      '${factoryOfferPriceModel.NameCompany}',
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
                        Text(
                          '${factoryOfferPriceModel.RateText}',
                          style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 15,
                            color: Themes.ColorApp8,
                          ),
                        ),
                        SizedBox(width: widthValue * 1,),
                        Container(
                          width: 70,
                          height: 30,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(35),
                              color: Themes.ColorApp12
                          ),
                          child: Center(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  '${factoryOfferPriceModel.RateNumber}',
                                  style: TextStyle(
                                    fontWeight: FontWeight.w400,
                                    fontSize: 12,
                                    color: Themes.ColorApp13,
                                  ),
                                ),
                                SizedBox(width: widthValue * .2,),
                                Icon(Icons.star,color: Themes.ColorApp13,)
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
                '${factoryOfferPriceModel.DistanceCompany}',
                style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 12,
                  color: Themes.ColorApp8,
                ),
              ),
              SizedBox(width: widthValue * 1,),
              Image.asset(Assets.iconsDistanceIcon,fit: BoxFit.contain,width: 35,height: 35,)
            ],
          )
        ],
      ),
    );
  }
}

class OfferPriceAndAcceptedOffer extends StatefulWidget {
   OfferPriceAndAcceptedOffer({required this.factoryOfferPriceModel});
   FactoryOfferPriceModel factoryOfferPriceModel;

  @override
  State<OfferPriceAndAcceptedOffer> createState() => _OfferPriceAndAcceptedOfferState();
}

class _OfferPriceAndAcceptedOfferState extends State<OfferPriceAndAcceptedOffer> {

  @override
  Widget build(BuildContext context) {
    var heightValue = Get.height * 0.024;
    var widthValue = Get.width * 0.024;
    return Column(
      children: [
        Row(
          children: [
            SizedBox(
              width: 15,
              height: 15,
              child: CircleAvatar(
                backgroundColor: Themes.ColorApp1,
              ),
            ),
            SizedBox(width: widthValue * 1,),
            Text(
              'تكلفه العرض المقدم',
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 14,
                color: Themes.ColorApp11,
              ),
            ),
            SizedBox(width: widthValue * 1,),
            Text(
              '${widget.factoryOfferPriceModel.PriceOffer}',
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 14,
                color: Themes.ColorApp1,
              ),
            ),
          ],
        ),
        GestureDetector(
          onTap: (){
            Get.bottomSheet(
             const BottomSheetItem(),
              backgroundColor: Themes.whiteColor,
              shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(25),
                      topRight:  Radius.circular(25))),
              elevation: 2.0,
            );
          },
          child: Container(
            width: Get.width,
            height: 50,
            decoration: BoxDecoration(
              color: Themes.ColorApp2,
              borderRadius: BorderRadius.circular(15)
            ),
            child: Center(
              child:  Text(
                'قبول العرض',
                style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 16,
                  color: Themes.ColorApp1,
                ),
              ),
            ),
          ),
        )
      ],
    );
  }
}

class BottomSheetItem extends StatefulWidget {
  const BottomSheetItem({Key? key}) : super(key: key);

  @override
  _BottomSheetItemState createState() => _BottomSheetItemState();
}

class _BottomSheetItemState extends State<BottomSheetItem> {
  @override
  Widget build(BuildContext context) {
    var heightValue = Get.height * 0.024;
    var widthValue = Get.width * 0.024;
    return Container(
      width: Get.width,
      height: 325,
      child: Padding(
        padding: const EdgeInsets.all(7.0),
        child: Column(
          mainAxisAlignment:
          MainAxisAlignment.center,
          crossAxisAlignment:
          CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 100),
              child: Container(
                width: Get.width,
                height: 5,
                decoration: BoxDecoration(
                    color: Themes.ColorApp11,
                    borderRadius:
                    BorderRadius.circular(10)),
              ),
            ),
            SizedBox(
              height: heightValue * 2,
            ),
            Image.asset(Assets.imagesAcceptedOfferPrice,fit: BoxFit.contain,),
            SizedBox(
              height: heightValue * 1,
            ),
            Text(
              'هل انت متاكد من قبول عرض شركه بن لادن',
              style: TextStyle(
                color: Themes.ColorApp8,
                fontSize: 22,
                fontWeight: FontWeight.w400,
              ),
            ),

            SizedBox(
              height: heightValue * 1.5,
            ),
            CustomButtonImage(
                title: 'تاكيد',
                hight: 50,
                onTap: (){
                  setState(() {
                      Get.off(const MyAddressRequestOfferScreen());
                  });
                }),
            SizedBox(height: heightValue * .1,),
            Container(
              width: Get.width,
              child: Center(
                child:  Text(
                  'الغاء',
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 16,
                    color: Themes.ColorApp1,
                  ),
                ),
              ),
            ),
            SizedBox(height: heightValue * .7,)
          ],
        ),
      ),
    );
  }
}
