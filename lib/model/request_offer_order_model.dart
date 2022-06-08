class RequestOfferOrderModel {
  String? ImageCompany,TitleAddress,DetailsAddress,typeCastingOrderRequest,dateOrderRequest,weightOrderRequest,mixTypeOrderRequest,
      cementTypeOrderRequest,stoneTypeOrderRequest,specialOrderRequest,pumpLengthOrderRequest;


  RequestOfferOrderModel(
      this.ImageCompany,
      this.TitleAddress,
      this.DetailsAddress,
      this.typeCastingOrderRequest,
      this.dateOrderRequest,
      this.weightOrderRequest,
      this.mixTypeOrderRequest,
      this.cementTypeOrderRequest,
      this.stoneTypeOrderRequest,
      this.specialOrderRequest,
      this.pumpLengthOrderRequest);


  RequestOfferOrderModel.fromJson(Map<String, dynamic> json) {
    ImageCompany = json['ImageCompany'];
    TitleAddress = json['TitleAddress'];
    DetailsAddress = json['DetailsAddress'];
    typeCastingOrderRequest = json['typeCastingOrderRequest'];
    dateOrderRequest = json['dateOrderRequest'];
    weightOrderRequest = json['weightOrderRequest'];
    mixTypeOrderRequest = json['mixTypeOrderRequest'];
    cementTypeOrderRequest = json['cementTypeOrderRequest'];
    stoneTypeOrderRequest = json['stoneTypeOrderRequest'];
    specialOrderRequest = json['specialOrderRequest'];
    pumpLengthOrderRequest = json['pumpLengthOrderRequest'];

  }

  Map<String, dynamic> toJson() {
    Map<String,dynamic> data = Map<String,dynamic>();
    data['ImageCompany'] = this.ImageCompany;
    data['TitleAddress'] = this.TitleAddress;
    data['DetailsAddress'] = this.DetailsAddress;
    data['typeCastingOrderRequest'] = this.typeCastingOrderRequest;
    data['dateOrderRequest'] = this.dateOrderRequest;
    data['weightOrderRequest'] = this.weightOrderRequest;
    data['mixTypeOrderRequest'] = this.mixTypeOrderRequest;
    data['cementTypeOrderRequest'] = this.cementTypeOrderRequest;
    data['stoneTypeOrderRequest'] = this.stoneTypeOrderRequest;
    data['specialOrderRequest'] = this.specialOrderRequest;
    data['pumpLengthOrderRequest'] = this.pumpLengthOrderRequest;
    return data;
  }
}
