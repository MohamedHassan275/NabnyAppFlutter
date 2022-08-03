class CompaniesModel {
  bool? success;
  List<CompaniesResponseModel>? companiesResponseModel;

  String? message;

  CompaniesModel({this.success, this.companiesResponseModel, this.message});

  CompaniesModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    if (json['data'] != null) {
      companiesResponseModel = <CompaniesResponseModel>[];
      json['data'].forEach((v) {
        companiesResponseModel!.add(new CompaniesResponseModel.fromJson(v));
      });
    }
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> companiesResponseModel =
        new Map<String, dynamic>();
    companiesResponseModel['success'] = this.success;
    if (this.companiesResponseModel != null) {
      companiesResponseModel['companiesResponseModel'
          ''] = this.companiesResponseModel!.map((v) => v.toJson()).toList();
    }
    companiesResponseModel['message'] = this.message;
    return companiesResponseModel;
  }
}

class CompaniesResponseModel {
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

  CompaniesResponseModel(
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

  CompaniesResponseModel.fromJson(Map<String, dynamic> json) {
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
