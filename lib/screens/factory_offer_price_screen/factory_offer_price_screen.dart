import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nabny/core/constant/constant.dart';
import 'package:nabny/screens/factory_offer_price_screen/factory_offer_price_controller.dart';
import 'package:nabny/screens/my_address_request_offer_screen/my_address_request_offer_screen.dart';
import 'package:nabny/screens/request_offer_price_screen_menu/request_offer_price_menu_controller.dart';
import 'package:nabny/utils/Themes.dart';

import '../../componant/CustomButtonWidget.dart';
import '../../core/localization/local_controller.dart';
import '../../core/servies/storage_service.dart';
import '../../core/widget/custom_circler_progress_indicator_widget.dart';
import '../../generated/assets.dart';
import '../../model/OfferOrderRequestModel.dart';
import '../home_main_screen/home_main_screen.dart';

class FactoryOfferPriceScreen extends StatelessWidget {
  FactoryOfferPriceScreen({Key? key, required this.offerOrderRequestResponseModel}) : super(key: key);

  OfferOrderRequestResponseModel offerOrderRequestResponseModel;
  RequestOfferPriceMenuController requestOfferPriceMenuController = Get.put(RequestOfferPriceMenuController());


  @override
  Widget build(BuildContext context) {
    var widthValue = Get.width * 0.024;
    var heightValue = Get.height * 0.024;

    return Scaffold(
      body: RefreshIndicator(
        onRefresh: () async{
          requestOfferPriceMenuController.getRequestOfferPrice();
        },
        child: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                AppbarDetailsOrder(widthValue, heightValue),
                SizedBox(
                  height: heightValue * 1.2,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: NumberOfOfferPrice(companies: offerOrderRequestResponseModel.request!.length,),
                ),
                SizedBox(
                  height: heightValue * .7,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: ListView.builder(
                    shrinkWrap: true,
                    scrollDirection: Axis.vertical,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: offerOrderRequestResponseModel.request!.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(vertical: 5),
                        child: FactoryItemList(
                            factoryOfferPriceModel: offerOrderRequestResponseModel.request![index],offerOrderRequestResponseModel: offerOrderRequestResponseModel),
                      );
                    },
                  ),
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
  NumberOfOfferPrice({Key? key, required this.companies}) : super(key: key);

  int? companies;
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
              width: 1.5,
              color: Themes.ColorApp1,
            ),
            SizedBox(
              width: widthValue * 1,
            ),
            Text(
              'you_have_offers'.tr,
              style: TextStyle(
                color: Themes.ColorApp8,
                fontSize: 17,
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
                  borderRadius: BorderRadius.circular(25)),
              child: Center(
                child: Text(
                  '${companies}',
                  style: TextStyle(
                    color: Themes.whiteColor,
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            ),
            SizedBox(
              width: widthValue * .5,
            ),
            Text(
              'view'.tr,
              style: TextStyle(
                color: Themes.ColorApp8,
                fontSize: 17,
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
              'request_offer_price2'.tr,
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
                Get.find<StorageService>().activeLocale.languageCode == "en" ? Icons.keyboard_arrow_right : Icons.keyboard_arrow_left,
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
  FactoryItemList({required this.factoryOfferPriceModel,required this.offerOrderRequestResponseModel});

  OfferOrderRequestResponseModel offerOrderRequestResponseModel;
  Companies factoryOfferPriceModel;
  var heightValue = Get.height * 0.024;
  var widthValue = Get.width * 0.024;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Get.to(FactoryDetailsScreen());
      },
      child: Card(
        elevation: 2,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
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
                  image: NetworkImage(factoryOfferPriceModel.image!),
                  fit: BoxFit.fill,
                  height: 175,
                  width: Get.width,
                  placeholder: AssetImage(Assets.imagesFactoryImage),
                ),
              ),
              SizedBox(
                height: heightValue * .5,
              ),
              DetailsCompany(
                  factoryOfferPriceModel: factoryOfferPriceModel,
                  heightValue: heightValue,
                  widthValue: widthValue),
              SizedBox(
                height: heightValue * 1,
              ),
              OfferPriceAndAcceptedOffer(
                  factoryOfferPriceModel: factoryOfferPriceModel, offerOrderRequestResponseModel: offerOrderRequestResponseModel,),
              SizedBox(
                height: heightValue * 1,
              )
            ],
          ),
        ),
      ),
    );
  }
}

class DetailsCompany extends StatelessWidget {
  DetailsCompany(
      {required this.factoryOfferPriceModel,
      required this.heightValue,
      required this.widthValue});

  Companies factoryOfferPriceModel;
  double heightValue, widthValue;

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
                      '${factoryOfferPriceModel.company}',
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 16,
                        color: Themes.ColorApp1,
                      ),
                    ),
                    SizedBox(
                      height: heightValue * .3,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        // Text(
                        //   '${factoryOfferPriceModel.RateText}',
                        //   style: TextStyle(
                        //     fontWeight: FontWeight.w400,
                        //     fontSize: 15,
                        //     color: Themes.ColorApp8,
                        //   ),
                        // ),
                        // SizedBox(width: widthValue * 1,),
                        Container(
                          width: 70,
                          height: 30,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(35),
                              color: Themes.ColorApp12),
                          child: Center(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  '${factoryOfferPriceModel.rate}',
                                  style: TextStyle(
                                    fontWeight: FontWeight.w400,
                                    fontSize: 12,
                                    color: Themes.ColorApp13,
                                  ),
                                ),
                                SizedBox(
                                  width: widthValue * .2,
                                ),
                                Icon(
                                  Icons.star,
                                  color: Themes.ColorApp13,
                                )
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
                '${factoryOfferPriceModel.distance}',
                style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 12,
                  color: Themes.ColorApp8,
                ),
              ),
              SizedBox(
                width: widthValue * .5,
              ),
              Text(
                'km'.tr,
                style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 12,
                  color: Themes.ColorApp8,
                ),
              ),
              SizedBox(
                width: widthValue * 1,
              ),
              Image.asset(
                Assets.iconsDistanceIcon,
                fit: BoxFit.contain,
                width: 35,
                height: 35,
              )
            ],
          )
        ],
      ),
    );
  }
}

class OfferPriceAndAcceptedOffer extends StatelessWidget {
  OfferPriceAndAcceptedOffer({required this.factoryOfferPriceModel,required this.offerOrderRequestResponseModel});

  OfferOrderRequestResponseModel offerOrderRequestResponseModel;
  Companies factoryOfferPriceModel;

  @override
  Widget build(BuildContext context) {
    var heightValue = Get.height * 0.024;
    var widthValue = Get.width * 0.024;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Column(
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
              SizedBox(
                width: widthValue * 1,
              ),
              Text(
                'cost_of_bid'.tr,
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 14,
                  color: Themes.ColorApp8,
                ),
              ),
              SizedBox(
                width: widthValue * .5,
              ),
              Text(
                '${factoryOfferPriceModel.price}',
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 14,
                  color: Themes.ColorApp1,
                ),
              ),
              SizedBox(
                width: widthValue * .5,
              ),
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
          SizedBox(
            height: heightValue * .7,
          ),
          GestureDetector(
            onTap: () {
              Get.bottomSheet(
                BottomSheetItem(companies: factoryOfferPriceModel, offerOrderRequestResponseModel: offerOrderRequestResponseModel,),
                backgroundColor: Themes.whiteColor,
                shape:  RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(25),
                        topRight: Radius.circular(25))),
                elevation: 2.0,
              );
            },
            child: Container(
              width: Get.width,
              height: 50,
              decoration: BoxDecoration(
                  color: Themes.ColorApp14,
                  borderRadius: BorderRadius.circular(15)),
              child: Center(
                child: Text(
                  'accept_offer'.tr,
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
      ),
    );
  }
}

class BottomSheetItem extends StatelessWidget {
  BottomSheetItem({Key? key,required this.companies,required this.offerOrderRequestResponseModel}) : super(key: key);
  OfferOrderRequestResponseModel offerOrderRequestResponseModel;
  Companies companies;

  @override
  Widget build(BuildContext context) {
    var heightValue = Get.height * 0.024;
    var widthValue = Get.width * 0.024;
    return SizedBox(
      width: Get.width,
      height: 485,
      child: Padding(
        padding: const EdgeInsets.all(7.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 100),
              child: Container(
                width: Get.width,
                height: 5,
                decoration: BoxDecoration(
                    color: Themes.ColorApp11,
                    borderRadius: BorderRadius.circular(10)),
              ),
            ),
            SizedBox(
              height: heightValue * 1.5,
            ),
            Image.asset(
              Assets.imagesAcceptedOfferPrice,
              fit: BoxFit.contain,
            ),
            SizedBox(
              height: heightValue * 1,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 35),
              child: Text(
                'you_will_accept_Bin_Laden_offer'.tr,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Themes.ColorApp8,
                  fontSize: 15,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
            SizedBox(
              height: heightValue * 1,
            ),
            GetBuilder<FactoryOfferPriceController>(
              init: FactoryOfferPriceController(),
              builder: (controller) {
                return Column(
                  children: [
                    CirclerProgressIndicatorWidget(isLoading: controller.loading ? true : false),
                    SizedBox(
                      height: heightValue * .5,
                    ),
                    CustomButtonImage(
                        title: 'confirm'.tr,
                        hight: 50,
                        onTap: () {
                          // CustomFlutterToast(offerOrderRequestResponseModel.id.toString());
                         // CustomFlutterToast(companies.id.toString());
                          controller.AcceptOfferRequest(offerOrderRequestResponseModel.id.toString(), companies.id.toString());
                          // setState(() {
                          //
                          //   // Get.off(HomeMainScreen(valueBack: ''));
                          // });
                        }),
                    SizedBox(
                      height: heightValue * 1.2,
                    ),
                    GestureDetector(
                      onTap: () {
                      //  CustomFlutterToast(companies.id.toString());
                        controller.CancelOfferRequest(companies.id.toString());
                        // setState(() {
                        // //  Get.off(HomeMainScreen(valueBack: ''));
                        // });
                      },
                      child: Container(
                        width: Get.width,
                        child: Center(
                          child: Text(
                            'cancel'.tr,
                            style: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 16,
                              color: Themes.ColorApp1,
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: heightValue * .7,
                    )
                  ],
                );
            },)
          ],
        ),
      ),
    );
  }
}
