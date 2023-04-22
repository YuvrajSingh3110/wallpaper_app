class photosModel {
  late String imgSrc;
  late String clickedBy;

  photosModel({
    required this.clickedBy,
    required this.imgSrc,
  });

  static apiToApp(Map<String, dynamic> photoMap){
    return photosModel(clickedBy: photoMap["photographer"], imgSrc: (photoMap["src"])["portrait"]);
  }
}
