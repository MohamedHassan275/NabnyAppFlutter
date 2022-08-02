class LocationModel {
  bool? success;
  List<LocationResponseModel>? locationResponseModel;
  String? message;

  LocationModel({this.success, this.locationResponseModel, this.message});

  LocationModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    if (json['data'] != null) {
      locationResponseModel = <LocationResponseModel>[];json['data'].forEach((v) {
        locationResponseModel!.add(new LocationResponseModel.fromJson(v));
      });
    }
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> locationResponseModel =
        new Map<String, dynamic>();

    locationResponseModel['success'] = this.success;
    if (this.locationResponseModel != null) {
      locationResponseModel[''
              'locationResponseModel'] =
          this.locationResponseModel!.map((v) => v.toJson()).toList();
    }

    locationResponseModel['message'] = this.message;
    return locationResponseModel;
  }
}

class LocationResponseModel {
  int? id;
  String? address;

  LocationResponseModel({this.id, this.address});

  LocationResponseModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    address = json['address'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> locationResponseModel =
        new Map<String, dynamic>();

    locationResponseModel['id'] = this.id;

    locationResponseModel['address'] = this.address;
    return locationResponseModel;
  }
}
