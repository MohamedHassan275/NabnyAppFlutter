class FavouriteModel {
  bool? success;
  List<FavouriteResponseModel>? favoriteResponseModel;

  String? message;

  FavouriteModel({this.success, this.favoriteResponseModel, this.message});

  FavouriteModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    if (json['favoriteResponseModel'
            ''] !=
        null) {
      favoriteResponseModel = <FavouriteResponseModel>[];
      json['favoriteResponseModel'
              '']
          .forEach((v) {
        favoriteResponseModel!.add(new FavouriteResponseModel.fromJson(v));
      });
    }
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> favoriteResponseModel =
        new Map<String, dynamic>();
    favoriteResponseModel['success'] = this.success;
    if (this.favoriteResponseModel != null) {
      favoriteResponseModel['favoriteResponseModel'
          ''] = this.favoriteResponseModel!.map((v) => v.toJson()).toList();
    }
    favoriteResponseModel['message'] = this.message;
    return favoriteResponseModel;
  }
}

class FavouriteResponseModel {
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

  FavouriteResponseModel(
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

  FavouriteResponseModel.fromJson(Map<String, dynamic> json) {
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
    final Map<String, dynamic> favoriteResponseModel =
        new Map<String, dynamic>();
    favoriteResponseModel['id'] = this.id;
    favoriteResponseModel['category'] = this.category;
    favoriteResponseModel['name'] = this.name;
    favoriteResponseModel['image'] = this.image;
    favoriteResponseModel['about'] = this.about;
    favoriteResponseModel['lat'] = this.lat;
    favoriteResponseModel['lng'] = this.lng;
    favoriteResponseModel['distance'] = this.distance;
    favoriteResponseModel['rate'] = this.rate;
    favoriteResponseModel['services'] = this.services;
    return favoriteResponseModel;
  }
}
