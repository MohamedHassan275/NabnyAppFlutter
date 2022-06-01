class SliderItemsModel {
  String? ImageSlider;

  SliderItemsModel(this.ImageSlider);

  SliderItemsModel.fromJson(Map<String, dynamic> json) {
    ImageSlider = json['ImageSlider'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['ImageSlider'] = this.ImageSlider;
    return data;
  }

}