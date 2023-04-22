import 'dart:convert';
import 'dart:math';
import 'package:http/http.dart' as http;
import 'package:wallpaper_app/model/categoryModel.dart';
import 'package:wallpaper_app/model/photosModel.dart';

class ApiOperation {
  static List<photosModel> trendingWallpapers = [];
  static List<photosModel> searchWallpapersList = [];
  static List<categoryModel> categoryWallpapersList = [];

  static Future<List<photosModel>> getTrendingWallpapers() async {
    await http.get(Uri.parse("https://api.pexels.com/v1/curated"), headers: {
      "Authorization":
          "elWPj0qsRpqFU8eqmMfcwZ0YSngti4o6GKA2YUtt9aSwCou9xEgzD3Zc"
    }).then((value) {
      Map<String, dynamic> jsonData = jsonDecode(value.body);
      List photos = jsonData["photos"];
      for (var element in photos) {
        trendingWallpapers.add(photosModel.apiToApp(element));
      }
    });
    return trendingWallpapers;
  }

  static List<categoryModel> getCategoriesList() {
    List categoryname = [
      "Cars",
      "Nature",
      "Bikes",
      "Street",
      "City",
      "Flowers"
    ];
    categoryWallpapersList.clear();
    categoryname.forEach((catName) async {
      final _random = new Random();

      photosModel photoModel =
          (await searchWallpapers(catName))[0 + _random.nextInt(11 - 0)];
      categoryWallpapersList
          .add(categoryModel(catImgUrl: photoModel.imgSrc, catName: catName));
    });
    return categoryWallpapersList;
  }

  static Future<List<photosModel>> searchWallpapers(String query) async {
    await http.get(
        Uri.parse(
            "https://api.pexels.com/v1/search?query=$query&per_page=30&page=1"),
        headers: {
          "Authorization":
              "elWPj0qsRpqFU8eqmMfcwZ0YSngti4o6GKA2YUtt9aSwCou9xEgzD3Zc"
        }).then((value) {
      Map<String, dynamic> jsonData = jsonDecode(value.body);
      List photos = jsonData["photos"];
      searchWallpapersList.clear();
      for (var element in photos) {
        searchWallpapersList.add(photosModel.apiToApp(element));
      }
    });
    return searchWallpapersList;
  }
}
