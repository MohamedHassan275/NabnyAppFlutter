class HomeUserModel {
  bool? success;
  HomeUserResponseModel? homeUserResponseModel;
  String? message;

  HomeUserModel({this.success, this.homeUserResponseModel, this.message});

  HomeUserModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    homeUserResponseModel = json['data'] != null ? new HomeUserResponseModel.fromJson(json['data']) : null;
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    if (this.homeUserResponseModel != null) {
      data['data'] = this.homeUserResponseModel!.toJson();
    }
    data['message'] = this.message;
    return data;
  }
}

class HomeUserResponseModel {
  CurrentLocation? currentLocation;
  List<Sliders>? sliders;
  List<Categories>? categories;
  List<Companies>? companies;

  HomeUserResponseModel({this.currentLocation, this.sliders, this.categories, this.companies});

  HomeUserResponseModel.fromJson(Map<String, dynamic> json) {
    currentLocation = json['current_location'] != null
        ? new CurrentLocation.fromJson(json['current_location'])
        : null;
    if (json['sliders'] != null) {
      sliders = <Sliders>[];
      json['sliders'].forEach((v) {
        sliders!.add(new Sliders.fromJson(v));
      });
    }
    if (json['categories'] != null) {
      categories = <Categories>[];
      json['categories'].forEach((v) {
        categories!.add(new Categories.fromJson(v));
      });
    }
    if (json['companies'] != null) {
      companies = <Companies>[];
      json['companies'].forEach((v) {
        companies!.add(new Companies.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.currentLocation != null) {
      data['current_location'] = this.currentLocation!.toJson();
    }
    if (this.sliders != null) {
      data['sliders'] = this.sliders!.map((v) => v.toJson()).toList();
    }
    if (this.categories != null) {
      data['categories'] = this.categories!.map((v) => v.toJson()).toList();
    }
    if (this.companies != null) {
      data['companies'] = this.companies!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class CurrentLocation {
  String? lat;
  String? lng;
  String? address;

  CurrentLocation({this.lat, this.lng, this.address});

  CurrentLocation.fromJson(Map<String, dynamic> json) {
    lat = json['lat'];
    lng = json['lng'];
    address = json['address'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['lat'] = this.lat;
    data['lng'] = this.lng;
    data['address'] = this.address;
    return data;
  }
}

class Sliders {
  int? id;
  String? image;

  Sliders({this.id, this.image});

  Sliders.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['image'] = this.image;
    return data;
  }
}

class Categories {
  int? id;
  String? name;
  String? image;
  int? count;

  Categories({this.id, this.name, this.image, this.count});

  Categories.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    image = json['image'];
    count = json['count'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['image'] = this.image;
    data['count'] = this.count;
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
