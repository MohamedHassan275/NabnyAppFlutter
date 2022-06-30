class CheckMobileUserModel {
  CheckMobileUserModel({
    required this.success,
    required this.data,
    required this.message,
  });
    bool? success;
    Data? data;
    String? message;

  CheckMobileUserModel.fromJson(Map<String, dynamic> json){
    success = json['success'];
    data = Data.fromJson(json['data']);
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['success'] = success;
    _data['data'] = data!.toJson();
    _data['message'] = message;
    return _data;
  }
}

class Data {
  Data({required this.registercode,});
   int? registercode;

  Data.fromJson(Map<String, dynamic> json){
    registercode = json['registercode'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['registercode'] = registercode;
    return _data;
  }
}