class MySenderOrderModel {
  String? ImageCompany, NameCompany, OrderNumber, OrderStyle,PriceOrder;
  int? Wight;

  MySenderOrderModel(this.ImageCompany, this.NameCompany, this.OrderNumber,
      this.OrderStyle, this.Wight,this.PriceOrder);

  MySenderOrderModel.fromJson(Map<String, dynamic> json) {
    ImageCompany = json['ImageCompany'];
    NameCompany = json['NameCompany'];
    OrderNumber = json['OrderNumber'];
    OrderStyle = json['OrderStyle'];
    Wight = json['Wight'];
    PriceOrder = json['PriceOrder'];
  }

  Map<String, dynamic> toJson() {
    Map<String,dynamic> data = Map<String,dynamic>();
    data['ImageCompany'] = this.ImageCompany;
    data['NameCompany'] = this.NameCompany;
    data['OrderNumber'] = this.OrderNumber;
    data['OrderStyle'] = this.OrderStyle;
    data['Wight'] = this.Wight;
    data['PriceOrder'] = this.PriceOrder;
    return data;
  }
}
