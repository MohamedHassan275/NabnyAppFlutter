
class OfferOrderRequestModel {
  bool? success;
  List<OfferOrderRequestResponseModel>? offerOrderRequestResponseModel;
  String? message;

  OfferOrderRequestModel({this.success, this.offerOrderRequestResponseModel, this.message});

  OfferOrderRequestModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    if (json['data'] != null) {
      offerOrderRequestResponseModel = <OfferOrderRequestResponseModel>[];
      json['data'].forEach((v) {
        offerOrderRequestResponseModel!.add(new OfferOrderRequestResponseModel.fromJson(v));
      });
    }
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    if (this.offerOrderRequestResponseModel != null) {
      data['data'] = this.offerOrderRequestResponseModel!.map((v) => v.toJson()).toList();
    }
    data['message'] = this.message;
    return data;
  }
}

class OfferOrderRequestResponseModel {
  int? id;
  String? castingType;
  String? orderNumber;
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
  String? status;
  int? requestsCount;
  List<Companies>? request;

  OfferOrderRequestResponseModel(
      {this.id,
        this.castingType,
        this.orderNumber,
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
        this.status,
        this.requestsCount,
        this.request});

  OfferOrderRequestResponseModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    castingType = json['casting_type'];
    orderNumber = json['order_number'];
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
    status = json['status'];
    requestsCount = json['requests_count'];
    if (json['request'] != null) {
      request = <Companies>[];
      json['request'].forEach((v) {
        request!.add(new Companies.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['casting_type'] = this.castingType;
    data['order_number'] = this.orderNumber;
    data['execution_date'] = this.executionDate;
    data['qty_m'] = this.qtyM;
    data['mix_type'] = this.mixType;
    data['cement_type'] = this.cementType;
    data['stone_size'] = this.stoneSize;
    data['special_description'] = this.specialDescription;
    data['address'] = this.address;
    data['with_pump'] = this.withPump;
    data['pump_length'] = this.pumpLength;
    data['with_snow'] = this.withSnow;
    data['with_lab'] = this.withLab;
    data['status'] = this.status;
    data['requests_count'] = this.requestsCount;
    if (this.request != null) {
      data['request'] = this.request!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Companies {
  int? id;
  String? company;
  String? image;
  int? distance;
  int? rate;
  String? price;
  String? status;


  Companies(
      {this.id,
        this.company,
        this.image,
        this.distance,
        this.rate,
        this.price,
        this.status});

  Companies.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    company = json['company'];
    image = json['image'];
    distance = json['distance'];
    rate = json['rate'];
    price = json['price'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['company'] = this.company;
    data['image'] = this.image;
    data['distance'] = this.distance;
    data['rate'] = this.rate;
    data['price'] = this.price;
    data['status'] = this.status;
    return data;
  }
}
