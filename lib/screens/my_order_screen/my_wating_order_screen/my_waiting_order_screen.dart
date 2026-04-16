import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nabny/componant/LoadingWidget.dart';
import 'package:nabny/model/my_new_order_model.dart';
import 'package:nabny/screens/my_order_screen/my_wating_order_screen/details_waiting_order_screen.dart';
import 'package:nabny/screens/my_order_screen/my_wating_order_screen/my_waiting_order_controller.dart';

import '../../../generated/assets.dart';
import '../../../utils/Themes.dart';

class MyWaitingOrderScreen extends StatefulWidget {
  MyWaitingOrderScreen({Key? key}) : super(key: key);

  @override
  State<MyWaitingOrderScreen> createState() => _MyWaitingOrderScreenState();
}

class _MyWaitingOrderScreenState extends State<MyWaitingOrderScreen> {
  // بنعرف الكنترولر هنا عشان نستخدمه في الـ initState بس
  final MyNewOrderController _controller = Get.find<MyNewOrderController>();

  var heightValue = Get.height * 0.024;
  var widthValue = Get.width * 0.024;

  @override
  void initState() {
    super.initState();
    // استدعاء الداتا عند فتح الشاشة
    _controller.getMyNewOrderUser();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<MyNewOrderController>(
        builder: (controller) {
          return RefreshIndicator(
            onRefresh: () async {
              // بننادي الدالة اللي بتجيب الداتا من السيرفر
              await controller.getMyNewOrderUser();
            },
            child: controller.Loading ? Center(child: LoadingWidget(data: '')) : _buildBody(controller),
          );
        },
      ),
    );
  }

  // دالة لفصل المحتوى وتنظيمه
  Widget _buildBody(MyNewOrderController controller) {
    // لو مفيش داتا، هنعرض واجهة "لا يوجد طلبات" جوه ListView عشان الريفرش يشتغل
    if (controller.newOrder.isEmpty) {
      return ListView(
        physics: const AlwaysScrollableScrollPhysics(), // سطر جوهري عشان يخلي الشاشة تقبل السحب حتى وهي فاضية
        children: [
          SizedBox(height: Get.height * 0.2), // توسيط وهمي
          NoItemOFList(),
        ],
      );
    }

    // لو فيه داتا، هنعرض الـ List العادي
    return ListView.builder(
      physics: const AlwaysScrollableScrollPhysics(), // سطر جوهري لضمان عمل الريفرش دائماً
      padding: const EdgeInsets.all(5.0),
      itemCount: controller.newOrder.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
          child: MyWaitingOrderItem(
            MyNewOder: controller.newOrder[index],
            heightValue: heightValue,
            widthValue: widthValue,
          ),
        );
      },
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

class MyWaitingOrderItem extends StatelessWidget {
  MyWaitingOrderItem({Key? key, required this.MyNewOder, required this.widthValue, required this.heightValue}) : super(key: key);
  double heightValue, widthValue;
  NewOrder MyNewOder;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      // onTap: (){
      //   Get.to(DetailsWaitingOrderScreen());
      // },
      child: Card(
        elevation: 2,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        child: Padding(
          padding: const EdgeInsets.all(5.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              CompanyDetails(MyNewOder),
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
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5),
                child: Row(
                  children: [
                    SizedBox(
                      width: 15,
                      height: 15,
                      child: CircleAvatar(
                        backgroundColor: Themes.ColorApp9,
                      ),
                    ),
                    SizedBox(
                      width: widthValue * 1,
                    ),
                    Text(
                      'waiting_send_offer_price'.tr,
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 13,
                        color: Themes.ColorApp9,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: heightValue * 1,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: GestureDetector(
                  onTap: () {
                    Get.to(DetailsWaitingOrderScreen(
                      newOrder: MyNewOder,
                    ));
                  },
                  child: Container(
                    width: Get.width,
                    height: 50,
                    decoration: BoxDecoration(
                      color: Themes.ColorApp14,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Center(
                      child: Text(
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

class CompanyDetails extends StatelessWidget {
  CompanyDetails(this.myCurrentOrderModel);

  NewOrder? myCurrentOrderModel;
  var heightValue = Get.height * 0.024;
  var widthValue = Get.width * 0.024;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 5),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
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
        ),
        SizedBox(
          height: heightValue * .5,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
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
                          SizedBox(
                            width: widthValue * .2,
                          ),
                          Text(
                            '${myCurrentOrderModel!.qtyM}',
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
                  Text(
                    '#${myCurrentOrderModel!.orderNumber}',
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 12,
                      color: Themes.ColorApp2,
                    ),
                  ),
                ],
              )
            ],
          ),
        )
      ],
    );
  }
}
