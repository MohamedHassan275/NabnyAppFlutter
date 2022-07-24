class SettingModel {
  bool? success;
  SettingResponseModel? settingResponseModel;
  String? message;

  SettingModel({this.success, this.settingResponseModel, this.message});

  SettingModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    settingResponseModel = json['data'] != null ? new SettingResponseModel.fromJson(json['data']) : null;
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    if (this.settingResponseModel != null) {
      data['data'] = this.settingResponseModel!.toJson();
    }
    data['message'] = this.message;
    return data;
  }
}

class SettingResponseModel {
  List<Policy>? policy;
  List<Privacy>? privacy;
  List<About>? about;
  List<Socialmedia>? socialmedia;

  SettingResponseModel({this.policy, this.privacy, this.about, this.socialmedia});

  SettingResponseModel.fromJson(Map<String, dynamic> json) {
    if (json['policy'] != null) {
      policy = <Policy>[];
      json['policy'].forEach((v) {
        policy!.add(new Policy.fromJson(v));
      });
    }
    if (json['privacy'] != null) {
      privacy = <Privacy>[];
      json['privacy'].forEach((v) {
        privacy!.add(new Privacy.fromJson(v));
      });
    }
    if (json['about'] != null) {
      about = <About>[];
      json['about'].forEach((v) {
        about!.add(new About.fromJson(v));
      });
    }
    if (json['socialmedia'] != null) {
      socialmedia = <Socialmedia>[];
      json['socialmedia'].forEach((v) {
        socialmedia!.add(new Socialmedia.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.policy != null) {
      data['policy'] = this.policy!.map((v) => v.toJson()).toList();
    }
    if (this.privacy != null) {
      data['privacy'] = this.privacy!.map((v) => v.toJson()).toList();
    }
    if (this.about != null) {
      data['about'] = this.about!.map((v) => v.toJson()).toList();
    }
    if (this.socialmedia != null) {
      data['socialmedia'] = this.socialmedia!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Policy {
  String? policy;

  Policy({this.policy});

  Policy.fromJson(Map<String, dynamic> json) {
    policy = json['policy'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['policy'] = this.policy;
    return data;
  }
}

class Privacy {
  String? privacy;

  Privacy({this.privacy});

  Privacy.fromJson(Map<String, dynamic> json) {
    privacy = json['privacy'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['privacy'] = this.privacy;
    return data;
  }
}

class About {
  String? about;

  About({this.about});

  About.fromJson(Map<String, dynamic> json) {
    about = json['about'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['about'] = this.about;
    return data;
  }
}

class Socialmedia {
  String? whatsapp;
  String? instagram;
  String? twitter;
  String? snapchat;

  Socialmedia({this.whatsapp, this.instagram, this.twitter, this.snapchat});

  Socialmedia.fromJson(Map<String, dynamic> json) {
    whatsapp = json['whatsapp'];
    instagram = json['instagram'];
    twitter = json['twitter'];
    snapchat = json['snapchat'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['whatsapp'] = this.whatsapp;
    data['instagram'] = this.instagram;
    data['twitter'] = this.twitter;
    data['snapchat'] = this.snapchat;
    return data;
  }
}
