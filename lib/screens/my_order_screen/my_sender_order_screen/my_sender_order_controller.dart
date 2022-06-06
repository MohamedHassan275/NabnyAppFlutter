
import 'package:get/get.dart';
import 'package:nabny/generated/assets.dart';
import 'package:nabny/model/my_sender_order_model.dart';

import '../../../model/my_waiting_order_model.dart';

class MySenderOrderController extends GetxController {

  bool Loading = false;

  RxList<MySenderOrderModel> mySenderOrderModel = List<MySenderOrderModel>.from([
    MySenderOrderModel(Assets.iconsFactoryNamIcon,'شركة بن لادن','#123456','خرسانة',1000,'1500 ريال'),
    MySenderOrderModel(Assets.iconsFactoryNamIcon,'شركة بن لادن','#123456','خرسانة',1000,'1500 ريال'),
    MySenderOrderModel(Assets.iconsFactoryNamIcon,'شركة بن لادن','#123456','خرسانة',1000,'1500 ريال'),
    MySenderOrderModel(Assets.iconsFactoryNamIcon,'شركة بن لادن','#123456','خرسانة',1000,'1500 ريال'),
    MySenderOrderModel(Assets.iconsFactoryNamIcon,'شركة بن لادن','#123456','خرسانة',1000,'1500 ريال'),
  ]).obs;

}