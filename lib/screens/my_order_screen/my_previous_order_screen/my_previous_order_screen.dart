import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nabny/componant/LoadingWidget.dart';
import 'package:nabny/screens/my_order_screen/my_previous_order_screen/details_previous_order_screen.dart';
import 'package:nabny/screens/my_order_screen/my_previous_order_screen/my_previous_order_controller.dart';

import '../../../generated/assets.dart';
import '../../../model/my_previous_order_model.dart';
import '../../../utils/Themes.dart';

class MyPreviousOrderScreen extends StatefulWidget {
  const MyPreviousOrderScreen({Key? key}) : super(key: key);

  @override
  State<MyPreviousOrderScreen> createState() => _MyPreviousOrderScreenState();
}

class _MyPreviousOrderScreenState extends State<MyPreviousOrderScreen> {
  // بنجيب الكنترولر اللي عملناله Put في الشاشة الرئيسية
  final MyPreviousOrderController _controller = Get.find<MyPreviousOrderController>();

  @override
  void initState() {
    super.initState();
    // جلب الداتا فور فتح التاب
    _controller.getPreviousMyOrderUser();
  }

  @override
  Widget build(BuildContext context) {
    var heightValue = Get.height * 0.024;
    var widthValue = Get.width * 0.024;

    return Scaffold(
      body: GetBuilder<MyPreviousOrderController>(
        builder: (controller) {
          return RefreshIndicator(
            onRefresh: () async {
              await controller.getPreviousMyOrderUser();
            },
            child: controller.Loading ? Center(child: LoadingWidget(data: '')) : _buildBody(controller, heightValue, widthValue),
          );
        },
      ),
    );
  }

  Widget _buildBody(MyPreviousOrderController controller, double heightValue, double widthValue) {
    // حالة لو القائمة فاضية
    if (controller.previousOrder == null || controller.previousOrder!.isEmpty) {
      return ListView(
        physics: const AlwaysScrollableScrollPhysics(),
        children: [
          SizedBox(height: Get.height * 0.2),
          NoItemOFList(),
        ],
      );
    }

    // حالة وجود بيانات
    return ListView.builder(
      physics: const AlwaysScrollableScrollPhysics(),
      padding: const EdgeInsets.all(10.0),
      itemCount: controller.previousOrder!.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.only(bottom: 10),
          child: MyPreviousOrderItem(
            previousOrder: controller.previousOrder![index],
            heightValue: heightValue,
            widthValue: widthValue,
          ),
        );
      },
    );
  }
}

class MyPreviousOrderItem extends StatelessWidget {
  MyPreviousOrderItem({Key? key, required this.previousOrder, required this.heightValue, required this.widthValue}) : super(key: key);
  final double heightValue, widthValue;
  final PreviousOrder previousOrder;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.to(DetailsPreviousOrderScreen(
          previousOrder: previousOrder,
        ));
      },
      child: Card(
        elevation: 2,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        child: Padding(
          padding: const EdgeInsets.all(5.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              CompanyDetails(previousOrder),
              SizedBox(
                height: heightValue * 1,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5),
                child: Divider(
                  height: 10,
                  color: Themes.ColorApp2,
                ),
              ),
              SizedBox(
                height: heightValue * .5,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    child: Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            Assets.iconsWalletMenuIcon,
                            width: 15,
                            height: 15,
                            fit: BoxFit.contain,
                          ),
                          SizedBox(
                            width: widthValue * 1,
                          ),
                          Text(
                            '${previousOrder.executionDate}',
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
                  SizedBox(
                    width: widthValue * 3.5,
                  ),
                  Container(
                    child: Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            Assets.iconsWalletMenuIcon,
                            width: 15,
                            height: 15,
                            fit: BoxFit.contain,
                          ),
                          SizedBox(
                            width: widthValue * 1,
                          ),
                          Text(
                            previousOrder.status!.contains('4') ? 'received'.tr : 'no_received'.tr,
                            style: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 12,
                              color: previousOrder.status!.contains('4') ? Themes.ColorApp1 : Themes.ColorApp9,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Icon(
                    Icons.subdirectory_arrow_left,
                    color: Themes.ColorApp1,
                    size: 25,
                  )
                ],
              ),
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

  PreviousOrder? myCurrentOrderModel;
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
                  SizedBox(
                    width: widthValue * 1,
                  ),
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
                '#${myCurrentOrderModel!.orderNumber}',
                style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 13,
                  color: Themes.ColorApp2,
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: heightValue * .5,
        ),
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
                      Image.asset(
                        Assets.iconsWalletMenuIcon,
                        width: 15,
                        height: 15,
                        fit: BoxFit.contain,
                      ),
                      SizedBox(
                        width: widthValue * .5,
                      ),
                      Text(
                        '${myCurrentOrderModel!.offerCost}',
                        style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 12,
                          color: Themes.ColorApp1,
                        ),
                      ),
                      SizedBox(
                        width: widthValue * .5,
                      ),
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
                      SizedBox(
                        width: widthValue * .2,
                      ),
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
