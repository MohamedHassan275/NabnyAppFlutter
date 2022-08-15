import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nabny/componant/CustomButtonWidget.dart';
import 'package:nabny/componant/LoadingWidget.dart';
import 'package:nabny/core/constant/constant.dart';
import 'package:nabny/generated/assets.dart';
import 'package:nabny/model/request_offer_order_model.dart';
import 'package:nabny/screens/factory_offer_price_screen/factory_offer_price_screen.dart';
import 'package:nabny/screens/request_offer_price_screen/request_offer_price_controller.dart';
import 'package:nabny/screens/request_offer_price_screen_menu/request_offer_price_menu_controller.dart';
import 'package:nabny/screens/requirements_request_offer_price_screen/requirements_request_offer_price_controller.dart';
import 'package:nabny/screens/requirements_request_offer_price_screen/requirements_request_offer_price_screen.dart';
import 'package:nabny/utils/Themes.dart';

import '../../core/localization/local_controller.dart';
import '../../core/servies/storage_service.dart';
import '../../model/OfferOrderRequestModel.dart';
import '../home_main_screen/home_main_screen.dart';

class RequestOfferPriceMenuScreen extends StatefulWidget {
  RequestOfferPriceMenuScreen({Key? key}) : super(key: key);

  @override
  State<RequestOfferPriceMenuScreen> createState() => _RequestOfferPriceMenuScreenState();
}

class _RequestOfferPriceMenuScreenState extends State<RequestOfferPriceMenuScreen> {
  RequestOfferPriceMenuController requestOfferPriceController =  Get.put(RequestOfferPriceMenuController());

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Get.put(RequestOfferPriceMenuController());
  }

  @override
  Widget build(BuildContext context) {
    var widthValue = Get.width * 0.024;
    var heightValue = Get.height * 0.024;
    return Scaffold(
      body: RefreshIndicator(

        onRefresh: () async{
          requestOfferPriceController.getRequestOfferPrice();
        },
        child: SingleChildScrollView(
          child: GetBuilder<RequestOfferPriceController>(
            init: RequestOfferPriceController(),
            builder: (controller) {
              if(controller.Loading){
                return LoadingWidget(data: '');
              }
              print("is length ${controller.offerOrderRequestResponseModel!.length}");
              return controller.offerOrderRequestResponseModel!.isNotEmpty ?
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 0),
                child: ListView.builder(
                  itemCount: controller.offerOrderRequestResponseModel!.length,
                  physics: ClampingScrollPhysics(),
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return RequestOfferOrderItems(requestOfferOrderModel: controller.offerOrderRequestResponseModel![index]);
                  },
                ),
              ) : NoItemOFList();
            },),
        )
      ),
    );

  }
}


class RequestOfferOrderItems extends StatefulWidget {
  RequestOfferOrderItems({required this.requestOfferOrderModel});

  OfferOrderRequestResponseModel requestOfferOrderModel;

  @override
  State<RequestOfferOrderItems> createState() => _RequestOfferOrderItemsState();
}

class _RequestOfferOrderItemsState extends State<RequestOfferOrderItems> {

  bool isVisible = false;

  void _changed(bool visibility, String field) {
    setState(() {
      if (field == "tag"){
        isVisible = visibility;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    var widthValue = Get.width * 0.024;
    var heightValue = Get.height * 0.024;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5,vertical: 5),
      child: Card(
        elevation: 2.0,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15)),
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              AddressDetailsOrder(requestOfferOrderModel: widget.requestOfferOrderModel,),
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
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  DetailsOrder(widthValue, 'type_of_casting'.tr, '${widget.requestOfferOrderModel.castingType}'),
                  GestureDetector(
                      onTap: (){
                        setState(() {
                          isVisible ? _changed(false, "tag") : _changed(true, "tag");
                          // isVisible = !isVisible;
                          // CustomFlutterToast('msg');
                        });

                      },
                      child: Icon(isVisible ? Icons.keyboard_arrow_up_rounded : Icons.keyboard_arrow_down_rounded,size: 25,color: Themes.ColorApp1,))
                ],
              ),
              SizedBox(
                height: heightValue * .7,
              ),
              DetailsOrder(widthValue, 'execution_date'.tr, '${widget.requestOfferOrderModel.executionDate}'),
              SizedBox(
                height: heightValue * .7,
              ),
              isVisible ? Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  DetailsOrder(widthValue, 'quantity'.tr, '${widget.requestOfferOrderModel.qtyM}'),
                  SizedBox(
                    height: heightValue * .7,
                  ),
                  DetailsOrder(widthValue, 'mix_type'.tr, '${widget.requestOfferOrderModel.mixType}'),
                  SizedBox(
                    height: heightValue * .7,
                  ),
                  DetailsOrder(widthValue, 'cement_type'.tr, '${widget.requestOfferOrderModel.cementType}'),
                  SizedBox(
                    height: heightValue * .7,
                  ),
                  DetailsOrder(widthValue, 'stone_size'.tr, '${widget.requestOfferOrderModel.stoneSize}'),
                  SizedBox(
                    height: heightValue * .7,
                  ),
                  DetailsOrder(widthValue, 'Special_specifications'.tr, '${widget.requestOfferOrderModel.specialDescription}'),
                  SizedBox(
                    height: heightValue * .7,
                  ),
                  DetailsOrder(widthValue, 'pump_order'.tr, widget.requestOfferOrderModel.withPump!.contains('1')? 'طلب مضخه' : 'بدون طلب مضخه',),
                  SizedBox(
                    height: heightValue * .7,
                  ),
                ],
              ) : Container(),
              SizedBox(
                height: heightValue * 1.2,
              ),
              Container(
                height: 53,
                decoration: BoxDecoration(
                    color: Themes.ColorApp14,
                    borderRadius: BorderRadius.circular(25)
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child:
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Text(
                            'you_have_offers'.tr,
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 16,
                              color: Themes.ColorApp8,
                            ),
                          ),
                          SizedBox(width: widthValue * .5,),
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
                                '${widget.requestOfferOrderModel.request!.length}',
                                style: TextStyle(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 16,
                                  color: Themes.ColorApp1,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(width: widthValue * .5,),
                          Text(
                            'offers'.tr,
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 16,
                              color: Themes.ColorApp1,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(width: widthValue *.5,),
                      Expanded(
                        child: CustomButtonImage2(title: 'watch'.tr, hight: 38, width: 85, onTap: (){
                         if (widget.requestOfferOrderModel.request!.isEmpty){
                           CustomFlutterToast('no_companies_here'.tr);
                         }else if (widget.requestOfferOrderModel.request!.isNotEmpty){
                           Get.to(FactoryOfferPriceScreen(offerOrderRequestResponseModel: widget.requestOfferOrderModel,));
                         }
                        }),
                      ),
                    ],
                  ),
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
            GestureDetector(
              // onTap: ()=> myOrderController.getMyOrderUser(),
              child: Image.asset(
                Assets.imagesOfferPrice,
                fit: BoxFit.contain,
              ),
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

class AddressDetailsOrder extends StatelessWidget {
  AddressDetailsOrder({required this.requestOfferOrderModel});

  OfferOrderRequestResponseModel requestOfferOrderModel;
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
              child: Text(
                '${requestOfferOrderModel.address}',
                 textAlign: TextAlign.start,
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 14,
                  color: Themes.ColorApp1,
                ),
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



// Padding(
// padding: const EdgeInsets.symmetric(horizontal: 5),
// child: Row(
// mainAxisAlignment: MainAxisAlignment.center,
// children: [
// SizedBox(
// width: 15,
// height: 15,
// child: CircleAvatar(
// backgroundColor: Themes.ColorApp9,
// ),
// ),
// SizedBox(width: widthValue * 1,),
// Text(
// 'waiting_send_offer_price'.tr,
// style: TextStyle(
// fontWeight: FontWeight.w500,
// fontSize: 13,
// color: Themes.ColorApp9,
// ),
// ),
// ],
// ),
// ),