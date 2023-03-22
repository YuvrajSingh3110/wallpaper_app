class photosModel {
  late String imgSrc;
  late String clickedBy;

  photosModel({
    required this.imgSrc,
    required this.clickedBy,
  });

  static apiToApp(Map<String, dynamic> photoMap){
    return photosModel(imgSrc: (photoMap["src"])["portrait"], clickedBy: photoMap["photographer"]);
  }
}
