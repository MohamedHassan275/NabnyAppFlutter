class MyOldOrderModel {
  String? ImageCompany, NameCompany, OrderNumber, OrderStyle,DateOrder;
  int? PriceOrder;

  MyOldOrderModel(this.ImageCompany, this.NameCompany, this.OrderNumber,
      this.OrderStyle, this.DateOrder,this.PriceOrder);

  MyOldOrderModel.fromJson(Map<String, dynamic> json) {
    ImageCompany = json['ImageCompany'];
    NameCompany = json['NameCompany'];
    OrderNumber = json['OrderNumber'];
    OrderStyle = json['OrderStyle'];
    DateOrder = json['DateOrder'];
    PriceOrder = json['PriceOrder'];
  }

  Map<String, dynamic> toJson() {
    Map<String,dynamic> data = Map<String,dynamic>();
    data['ImageCompany'] = this.ImageCompany;
    data['NameCompany'] = this.NameCompany;
    data['OrderNumber'] = this.OrderNumber;
    data['OrderStyle'] = this.OrderStyle;
    data['DateOrder'] = this.DateOrder;
    data['PriceOrder'] = this.PriceOrder;
    return data;
  }
}
