class CompaniesModel {
  bool? success;
  List<CompaniesResponseModel>? companiesResponseModel;

  String? message;

  CompaniesModel({this.success, this.companiesResponseModel, this.message});

  CompaniesModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    if (json['companiesResponseModel'
            ''] !=
        null) {
      companiesResponseModel = <CompaniesResponseModel>[];
      json['companiesResponseModel'
              '']
          .forEach((v) {
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
    final Map<String, dynamic> companiesResponseModel =
        new Map<String, dynamic>();
    companiesResponseModel['id'] = this.id;
    companiesResponseModel['category'] = this.category;
    companiesResponseModel['name'] = this.name;
    companiesResponseModel['image'] = this.image;
    companiesResponseModel['about'] = this.about;
    companiesResponseModel['lat'] = this.lat;
    companiesResponseModel['lng'] = this.lng;
    companiesResponseModel['distance'] = this.distance;
    companiesResponseModel['rate'] = this.rate;
    companiesResponseModel['services'] = this.services;
    return companiesResponseModel;
  }
}
