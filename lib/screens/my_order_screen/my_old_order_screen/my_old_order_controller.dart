
import 'package:get/get.dart';
import 'package:nabny/model/my_old_order_model.dart';

import '../../../generated/assets.dart';

class MyOldOrderController extends GetxController{

  bool Loading = false;

  RxList<MyOldOrderModel> myOldOrderModel = List<MyOldOrderModel>.from([
    MyOldOrderModel(Assets.iconsFactoryNamIcon,'شركة بن لادن','#123456','خرسانة','02/07/2022',1000),
    MyOldOrderModel(Assets.iconsFactoryNamIcon,'شركة بن لادن','#123456','خرسانة','02/07/2022',1000),
    MyOldOrderModel(Assets.iconsFactoryNamIcon,'شركة بن لادن','#123456','خرسانة','02/07/2022',1000),
    MyOldOrderModel(Assets.iconsFactoryNamIcon,'شركة بن لادن','#123456','خرسانة','02/07/2022',1000),
    MyOldOrderModel(Assets.iconsFactoryNamIcon,'شركة بن لادن','#123456','خرسانة','02/07/2022',1000),
    MyOldOrderModel(Assets.iconsFactoryNamIcon,'شركة بن لادن','#123456','خرسانة','02/07/2022',1000),
  ]).obs;

}