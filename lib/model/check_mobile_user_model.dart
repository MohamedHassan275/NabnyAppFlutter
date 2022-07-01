class CheckMobileUserModel {
  bool? success;
  Data? data;
  String? message;

  CheckMobileUserModel({this.success, this.data, this.message});

  CheckMobileUserModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    data['message'] = this.message;
    return data;
  }
}

class Data {
  int? registercode;

  Data({this.registercode});

  Data.fromJson(Map<String, dynamic> json) {
    registercode = json['registercode'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['registercode'] = this.registercode;
    return data;
  }
}
