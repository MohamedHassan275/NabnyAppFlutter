
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
  String? executionDate;
  String? status;
  int? requestsCount;
  String? address;
  List<Companies>? request;

  OfferOrderRequestResponseModel(
      {this.id,
        this.castingType,
        this.executionDate,
        this.status,
        this.requestsCount,
        this.address,
        this.request});

  OfferOrderRequestResponseModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    castingType = json['casting_type'];
    executionDate = json['execution_date'];
    status = json['status'];
    requestsCount = json['requests_count'];
    address = json['address'];
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
    data['execution_date'] = this.executionDate;
    data['status'] = this.status;
    data['requests_count'] = this.requestsCount;
    data['address'] = this.address;
    if (this.request != null) {
      data['request'] = this.request!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Companies {
  int? id;
  String? category;
  String? name;
  String? image;
  String? about;
  String? lat;
  String? lng;
  int? distance;
  int? rate;
  List<String>? services;

  Companies(
      {this.id,
        this.category,
        this.name,
        this.image,
        this.about,
        this.lat,
        this.lng,
        this.distance,
        this.rate,
        this.services});

  Companies.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    category = json['category'];
    name = json['name'];
    image = json['image'];
    about = json['about'];
    lat = json['lat'];
    lng = json['lng'];
    distance = json['distance'];
    rate = json['rate'];
    services = json['services'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['category'] = this.category;
    data['name'] = this.name;
    data['image'] = this.image;
    data['about'] = this.about;
    data['lat'] = this.lat;
    data['lng'] = this.lng;
    data['distance'] = this.distance;
    data['rate'] = this.rate;
    data['services'] = this.services;
    return data;
  }
}
