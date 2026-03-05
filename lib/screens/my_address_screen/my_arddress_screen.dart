import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nabny/componant/CustomButtonWidget.dart';
import 'package:nabny/componant/LoadingWidget.dart';
import 'package:nabny/componant/nabny_app_bar.dart';
import 'package:nabny/model/LocationModel.dart';
import 'package:nabny/screens/my_address_screen/MyAddressController.dart';

import '../../generated/assets.dart';
import '../../utils/Themes.dart';
import '../save_location_map_user_screen/save_my_locaiton_user_screen.dart';

class MyAddressScreen extends StatelessWidget {
  const MyAddressScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final MyAddressController myAddressController =
        Get.put(MyAddressController());
    final heightValue = Get.height * 0.024;

    return Scaffold(
      backgroundColor: Themes.ColorApp7,
      appBar: NabnyAppBar(title: 'my_addresses'.tr),
      body: Column(
        children: [
          SizedBox(height: heightValue * 1),
          Expanded(
            flex: 5,
            child: RefreshIndicator(
              onRefresh: () async {
                myAddressController.getMyLocationUser();
              },
              child: SingleChildScrollView(
                physics: const AlwaysScrollableScrollPhysics(),
                child: GetBuilder<MyAddressController>(
                  builder: (controller) {
                    if (controller.loading) {
                      return LoadingWidget(data: '');
                    }
                    if (controller.locationResponseModel?.isNotEmpty == true) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: ListView.separated(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount:
                              controller.locationResponseModel!.length,
                          separatorBuilder: (_, __) =>
                              const SizedBox(height: 12),
                          itemBuilder: (context, index) =>
                              AddressDetailsOrder(
                            locationResponseModel:
                                controller.locationResponseModel![index],
                          ),
                        ),
                      );
                    } else {
                      return NoItemOFList();
                    }
                  },
                ),
              ),
            ),
          ),
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            child: CustomButtonImage(
              title: 'add_new_address'.tr,
              hight: 52,
              onTap: () async {
                // الانتظار حتى يرجع المستخدم من شاشة إضافة العنوان
                await Get.to(
                  SaveMyLocationUserScreen(
                      result: 'myAddress', companyId: ''),
                );
                // تحديث الداتا عند الرجوع
                myAddressController.getMyLocationUser();
              },
            ),
          ),
        ],
      ),
    );
  }
}

class NoItemOFList extends StatelessWidget {
  NoItemOFList({Key? key}) : super(key: key);

  final widthValue = Get.width * 0.024;
  final heightValue = Get.height * 0.024;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: Get.height * 0.6,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 100,
            height: 100,
            decoration: BoxDecoration(
              color: Themes.ColorApp4,
              shape: BoxShape.circle,
            ),
            child: const Icon(
              Icons.location_off_outlined,
              size: 50,
              color: Themes.ColorApp1,
            ),
          ),
          SizedBox(height: heightValue * 1.5),
          Text(
            'no_location_have'.tr,
            textAlign: TextAlign.center,
            maxLines: 2,
            style: const TextStyle(
              color: Themes.ColorApp8,
              fontSize: 18,
              fontWeight: FontWeight.w500,
            ),
          ),
          SizedBox(height: heightValue * 0.5),
          Text(
            'add_new_address'.tr,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Themes.ColorApp1.withOpacity(0.6),
              fontSize: 14,
              fontWeight: FontWeight.w400,
            ),
          ),
          SizedBox(height: heightValue * .7),
        ],
      ),
    );
  }
}

class AddressDetailsOrder extends StatelessWidget {
  AddressDetailsOrder({required this.locationResponseModel});
  final LocationResponseModel locationResponseModel;
  final heightValue = Get.height * 0.024;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.07),
            blurRadius: 12,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(14),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // ── أيقونة الموقع ──
            Container(
              width: 52,
              height: 52,
              decoration: BoxDecoration(
                color: Themes.ColorApp1.withOpacity(0.08),
                borderRadius: BorderRadius.circular(14),
              ),
              child: const Center(
                child: Icon(
                  Icons.location_on_rounded,
                  color: Themes.ColorApp1,
                  size: 28,
                ),
              ),
            ),
            const SizedBox(width: 14),
            // ── نص العنوان ──
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'delivery_address'.tr,
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                      color: Themes.ColorApp8,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    '${locationResponseModel.address}',
                    style: const TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 14,
                      color: Themes.ColorApp15,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
            const SizedBox(width: 8),
            // ── تحديد ──
            Container(
              width: 32,
              height: 32,
              decoration: BoxDecoration(
                color: Themes.ColorApp4,
                borderRadius: BorderRadius.circular(10),
              ),
              child: const Icon(
                Icons.chevron_right_rounded,
                color: Themes.ColorApp1,
                size: 20,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
