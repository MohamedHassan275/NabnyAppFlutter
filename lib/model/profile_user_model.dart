class ProfileUserModel {
  bool? success;
  ProfileUserResponseModel? profileUserResponseModel;
  String? message;

  ProfileUserModel({this.success, this.profileUserResponseModel, this.message});

  ProfileUserModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    profileUserResponseModel = json['data'] != null ? new ProfileUserResponseModel.fromJson(json['data']) : null;
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    if (this.profileUserResponseModel != null) {
      data['data'] = this.profileUserResponseModel!.toJson();
    }
    data['message'] = this.message;
    return data;
  }
}

class ProfileUserResponseModel {
  int? id;
  String? firstname;
  String? lastname;
  String? email;
  String? phone;
  String? image;
  String? lat;
  String? lng;
  String? address;

  ProfileUserResponseModel(
      {this.id,
        this.firstname,
        this.lastname,
        this.email,
        this.phone,
        this.image,
        this.lat,
        this.lng,
        this.address});

  ProfileUserResponseModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    firstname = json['firstname'];
    lastname = json['lastname'];
    email = json['email'];
    phone = json['phone'];
    image = json['image'];
    lat = json['lat'];
    lng = json['lng'];
    address = json['address'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['firstname'] = this.firstname;
    data['lastname'] = this.lastname;
    data['email'] = this.email;
    data['phone'] = this.phone;
    data['image'] = this.image;
    data['lat'] = this.lat;
    data['lng'] = this.lng;
    data['address'] = this.address;
    return data;
  }
}
