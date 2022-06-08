class FactoryOfferPriceModel {
  String? ImageCompany, NameCompany, RateText, RateNumber,DistanceCompany,PriceOffer;

  FactoryOfferPriceModel(this.ImageCompany, this.NameCompany, this.RateText,
      this.RateNumber,this.DistanceCompany,this.PriceOffer);

  FactoryOfferPriceModel.fromJson(Map<String, dynamic> json) {
    ImageCompany = json['ImageCompany'];
    NameCompany = json['NameCompany'];
    RateText = json['OrderNumber'];
    RateNumber = json['OrderStyle'];
    DistanceCompany = json['PriceOrder'];
    PriceOffer = json['PriceOffer'];
  }

  Map<String, dynamic> toJson() {
    Map<String,dynamic> data = Map<String,dynamic>();
    data['ImageCompany'] = this.ImageCompany;
    data['NameCompany'] = this.NameCompany;
    data['OrderNumber'] = this.RateText;
    data['OrderStyle'] = this.RateNumber;
    data['PriceOrder'] = this.DistanceCompany;
    data['PriceOffer'] = this.PriceOffer;
    return data;
  }
}
