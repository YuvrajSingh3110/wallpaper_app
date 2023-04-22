class categoryModel {
  late String catName;
  late String catImgUrl;

  categoryModel({
    required this.catImgUrl,
    required this.catName,
  });

  static categoryModel apiToApp(Map<String, dynamic> category){
    return categoryModel(catImgUrl: category["imgUrl"], catName: category["CategoryName"]);
  }
}