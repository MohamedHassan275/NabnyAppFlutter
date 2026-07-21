class MyNewOrderModel {
  bool? success;
  List<NewOrder>? newOrder;
  String? message;

  MyNewOrderModel({this.success, this.newOrder, this.message});

  MyNewOrderModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    if (json['data'] != null) {
      newOrder = <NewOrder>[];
      json['data'].forEach((v) {
        newOrder!.add(new NewOrder.fromJson(v));
      });
    }
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> myOrderResponseModel = new Map<String, dynamic>();
    myOrderResponseModel['success'] = this.success;
    if (this.newOrder != null) {
      myOrderResponseModel['data'] = newOrder!.map((e) => e.toJson()).toList();
    }
    myOrderResponseModel['message'] = this.message;
    return myOrderResponseModel;
  }
}

class NewOrder {
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
  int? withPump;
  String? pumpLength;
  int? withSnow;
  int? withLab;
  int? offerCost;
  int? status;

  NewOrder(
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

  NewOrder.fromJson(Map<String, dynamic> json) {
    id = json['id'] is int ? json['id'] : int.tryParse(json['id']?.toString() ?? '');
    company = json['company']?.toString();
    orderNumber = json['order_number']?.toString();
    castingType = json['casting_type']?.toString();
    executionDate = json['execution_date']?.toString();
    qtyM = json['qty_m']?.toString();
    mixType = json['mix_type']?.toString();
    cementType = json['cement_type']?.toString();
    stoneSize = json['stone_size']?.toString();
    specialDescription = json['special_description']?.toString();
    address = json['address']?.toString();
    withPump = json['with_pump'] is int ? json['with_pump'] : int.tryParse(json['with_pump']?.toString() ?? '');
    pumpLength = json['pump_length']?.toString();
    withSnow = json['with_snow'] is int ? json['with_snow'] : int.tryParse(json['with_snow']?.toString() ?? '');
    withLab = json['with_lab'] is int ? json['with_lab'] : int.tryParse(json['with_lab']?.toString() ?? '');
    offerCost = json['offer_cost'] is int ? json['offer_cost'] : int.tryParse(json['offer_cost']?.toString() ?? '');
    status = json['status'] is int ? json['status'] : int.tryParse(json['status']?.toString() ?? '');
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> myOrderResponseModel = new Map<String, dynamic>();
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
