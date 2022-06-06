
import 'package:get/get.dart';
import 'package:nabny/generated/assets.dart';

import '../../../model/my_waiting_order_model.dart';

class MyWaitingOrderController extends GetxController {

  bool Loading = false;

  RxList<MyWaitingtOrderModel> myCurrentOrderModel = List<MyWaitingtOrderModel>.from([
    MyWaitingtOrderModel(Assets.iconsFactoryNamIcon,'شركة بن لادن','#123456','خرسانة',1000),
    MyWaitingtOrderModel(Assets.iconsFactoryNamIcon,'شركة بن لادن','#123456','خرسانة',1000),
    MyWaitingtOrderModel(Assets.iconsFactoryNamIcon,'شركة بن لادن','#123456','خرسانة',1000),
    MyWaitingtOrderModel(Assets.iconsFactoryNamIcon,'شركة بن لادن','#123456','خرسانة',1000),
    MyWaitingtOrderModel(Assets.iconsFactoryNamIcon,'شركة بن لادن','#123456','خرسانة',1000),
  ]).obs;

}