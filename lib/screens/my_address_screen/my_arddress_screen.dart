import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nabny/componant/CustomButtonWidget.dart';
import 'package:nabny/componant/LoadingWidget.dart';
import 'package:nabny/core/localization/local_controller.dart';
import 'package:nabny/model/LocationModel.dart';
import 'package:nabny/screens/home_main_screen/home_main_screen.dart';
import 'package:nabny/screens/my_address_screen/MyAddressController.dart';

import '../../generated/assets.dart';
import '../../utils/Themes.dart';
import '../save_location_map_user_screen/save_my_locaiton_user_screen.dart';

class MyAddressScreen extends StatelessWidget {
  const MyAddressScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    MyAddressController myAddressController = Get.put(MyAddressController());
    var heightValue = Get.height * 0.024;
    var widthValue = Get.width * 0.024;
    return Scaffold(
      body: RefreshIndicator(
        onRefresh: () async{
          myAddressController.getMyLocationUser();
        },
        child: SafeArea(
          child: SingleChildScrollView(
            child: Container(
              width: Get.width,
              height: Get.height,
              child: Stack(
                children: [
                  AppbarDetailsOrder(widthValue, heightValue),
                  SizedBox(
                    height: heightValue * 1.2,
                  ),
                  Positioned(
                    top: heightValue * 8,
                    right: widthValue * 1,
                    left: widthValue * 1,
                    child: GetBuilder<MyAddressController>(
                      init: MyAddressController(),
                        builder: (controller){
                        if (controller.Loading){
                          return LoadingWidget(data: '');
                        }
                        if (controller.locationResponseModel!.isNotEmpty){
                          return ListView.builder(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: controller.locationResponseModel!.length,
                            itemBuilder: (context, index) => AddressDetailsOrder(locationResponseModel: controller.locationResponseModel![index],));
                        }else {
                          return NoItemOFList();
                        }
                    }),
                  ),
                  SizedBox(
                    height: heightValue * 5,
                  ),
                  Positioned(
                      bottom: heightValue * 3,
                      child: CustomButtonImage(
                          title: 'add_new_address'.tr,
                          hight: 50,
                          onTap: () => Get.to(const SaveMyLocationUserScreen())))
                ],
              ),
            ),
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
    return Container(
      width: Get.width,
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
            'no_location_have'.tr,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Themes.ColorApp8,
              fontSize: 19,
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
  AddressDetailsOrder({required this.locationResponseModel});
  LocationResponseModel locationResponseModel;
  var heightValue = Get.height * 0.024;
  var widthValue = Get.width * 0.024;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 1,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: Padding(
        padding: const EdgeInsets.all(5.0),
        child: SizedBox(
          width: Get.width,
          height: 110,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    width: 60,
                    height: 60,
                    decoration: BoxDecoration(
                      color: Themes.ColorApp14,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Center(
                      child: Image(
                        image: AssetImage(Assets.iconsDistanceIcon),
                        fit: BoxFit.contain,
                        width: 45,
                        height: 45,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          '${locationResponseModel.address}',
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 14,
                            color: Themes.ColorApp1,
                          ),
                        ),
                        SizedBox(
                          height: heightValue * .3,
                        ),
                      ],
                    ),
                  )
                ],
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
              'my_addresses'.tr,
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
               Get.find<MyLocalController>().language!.languageCode == 'ar' ? Icons.subdirectory_arrow_right : Icons.subdirectory_arrow_left,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
