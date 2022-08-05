class MyCurrentOrderModel {
  bool? success;
  List<CurrentOrder>? currentOrder;
  String? message;

  MyCurrentOrderModel({this.success, this.currentOrder, this.message});

  MyCurrentOrderModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    if (json['data'] != null) {
      currentOrder = <CurrentOrder>[];
      json['data'].forEach((v) {
        currentOrder!.add(new CurrentOrder.fromJson(v));
      });
    }
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> myOrderResponseModel =
        new Map<String, dynamic>();
    myOrderResponseModel['success'] = this.success;
    if (this.currentOrder != null) {
      myOrderResponseModel['data'] =
          this.currentOrder!.map((v) => v.toJson()).toList();
    }
    myOrderResponseModel['message'] = this.message;
    return myOrderResponseModel;
  }
}


class CurrentOrder {
  int? id;
  String? company;
  String? orderNumber;
  String? castingType;
  String? executionDate;
  String? qtyM;
  String? mixType;
  String? cementType;
  String? stoneSize;
  String? specialDescription;
  String? address;
  String? withPump;
  String? pumpLength;
  String? withSnow;
  String? withLab;
  String? offerCost;
  String? status;

  CurrentOrder(
      {this.id,
      this.company,
      this.orderNumber,
      this.castingType,
      this.executionDate,
      this.qtyM,
      this.mixType,
      this.cementType,
      this.stoneSize,
      this.specialDescription,
      this.address,
      this.withPump,
      this.pumpLength,
      this.withSnow,
      this.withLab,
      this.offerCost,
      this.status});

  CurrentOrder.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    company = json['company'];
    orderNumber = json['order_number'];
    castingType = json['casting_type'];
    executionDate = json['execution_date'];
    qtyM = json['qty_m'];
    mixType = json['mix_type'];
    cementType = json['cement_type'];
    stoneSize = json['stone_size'];
    specialDescription = json['special_description'];
    address = json['address'];
    withPump = json['with_pump'];
    pumpLength = json['pump_length'];
    withSnow = json['with_snow'];
    withLab = json['with_lab'];
    offerCost = json['offer_cost'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> myOrderResponseModel =
        new Map<String, dynamic>();
    myOrderResponseModel['id'] = this.id;
    myOrderResponseModel['company'] = this.company;
    myOrderResponseModel['order_number'] = this.orderNumber;
    myOrderResponseModel['casting_type'] = this.castingType;
    myOrderResponseModel['execution_date'] = this.executionDate;
    myOrderResponseModel['qty_m'] = this.qtyM;
    myOrderResponseModel['mix_type'] = this.mixType;
    myOrderResponseModel['cement_type'] = this.cementType;
    myOrderResponseModel['stone_size'] = this.stoneSize;
    myOrderResponseModel['special_description'] = this.specialDescription;
    myOrderResponseModel['address'] = this.address;
    myOrderResponseModel['with_pump'] = this.withPump;
    myOrderResponseModel['pump_length'] = this.pumpLength;
    myOrderResponseModel['with_snow'] = this.withSnow;
    myOrderResponseModel['with_lab'] = this.withLab;
    myOrderResponseModel['offer_cost'] = this.offerCost;
    myOrderResponseModel['status'] = this.status;
    return myOrderResponseModel;
  }
}

