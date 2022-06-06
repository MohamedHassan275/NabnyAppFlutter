class MyWaitingtOrderModel {
  String? ImageCompany, NameCompany, OrderNumber, OrderStyle;
  int? Wight;

  MyWaitingtOrderModel(this.ImageCompany, this.NameCompany, this.OrderNumber,
      this.OrderStyle, this.Wight);

  MyWaitingtOrderModel.fromJson(Map<String, dynamic> json) {
    ImageCompany = json['ImageCompany'];
    NameCompany = json['NameCompany'];
    OrderNumber = json['OrderNumber'];
    OrderStyle = json['OrderStyle'];
    Wight = json['Wight'];
  }

  Map<String, dynamic> toJson() {
    Map<String,dynamic> data = Map<String,dynamic>();
    data['ImageCompany'] = this.ImageCompany;
    data['NameCompany'] = this.NameCompany;
    data['OrderNumber'] = this.OrderNumber;
    data['OrderStyle'] = this.OrderStyle;
    data['Wight'] = this.Wight;
    return data;
  }
}
