class MyOrderModel {
  bool? success;
  MyOrderResponseModel? myOrderResponseModel;
  String? message;

  MyOrderModel({this.success, this.myOrderResponseModel, this.message});

  MyOrderModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    myOrderResponseModel = json['data'] != null ? new MyOrderResponseModel.fromJson(json['data']) : null;
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> myOrderResponseModel =
        new Map<String, dynamic>();
    myOrderResponseModel['success'] = this.success;
    if (this.myOrderResponseModel != null) {
      myOrderResponseModel['data'] = this.myOrderResponseModel!.toJson();
    }
    myOrderResponseModel['message'] = this.message;
    return myOrderResponseModel;
  }
}

class MyOrderResponseModel {
  List<NewOrder>? newOrder;
  List<SendOrder>? sentOrder;
  List<CurrentOrder>? currentOrder;
  List<PreviousOrder>? previousOrder;

  MyOrderResponseModel(
      {this.newOrder, this.sentOrder, this.currentOrder, this.previousOrder});

  MyOrderResponseModel.fromJson(Map<String, dynamic> json) {
    if (json['new'] != null) {
      newOrder = <NewOrder>[];
      json['new'].forEach((v) {
        newOrder!.add(new NewOrder.fromJson(v));
      });
    }
    if (json['sent'] != null) {
      sentOrder = <SendOrder>[];
      json['sent'].forEach((v) {
        sentOrder!.add(new SendOrder.fromJson(v));
      });
    }
    if (json['current'] != null) {
      currentOrder = <CurrentOrder>[];
      json['current'].forEach((v) {
        currentOrder!.add(new CurrentOrder.fromJson(v));
      });
    }
    if (json['previous'] != null) {
      previousOrder = <PreviousOrder>[];
      json['previous'].forEach((v) {
        previousOrder!.add(new PreviousOrder.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> myOrderResponseModel =
        new Map<String, dynamic>();
    if (this.newOrder != null) {
      myOrderResponseModel['new'] =
          this.newOrder!.map((v) => v.toJson()).toList();
    }
    if (this.sentOrder != null) {
      myOrderResponseModel['sent'] =
          this.sentOrder!.map((v) => v.toJson()).toList();
    }
    if (this.currentOrder != null) {
      myOrderResponseModel['current'] =
          this.currentOrder!.map((v) => v.toJson()).toList();
    }
    if (this.previousOrder != null) {
      myOrderResponseModel['previous'] =
          this.previousOrder!.map((v) => v.toJson()).toList();
    }
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
  String? withPump;
  String? pumpLength;
  String? withSnow;
  String? withLab;
  String? offerCost;
  String? status;

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

class SendOrder {
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

  SendOrder(
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

  SendOrder.fromJson(Map<String, dynamic> json) {
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

class PreviousOrder {
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

  PreviousOrder(
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

  PreviousOrder.fromJson(Map<String, dynamic> json) {
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
