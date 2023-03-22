import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:wallpaper_app/model/photosModel.dart';

class ApiOperation {
  static late List<photosModel> trendingWallpapers;
  static getTrendingWallpapers() async {
    await http.get(
        Uri.parse("https://api.pexels.com/v1/curated"),
      headers: {"Authorization": "elWPj0qsRpqFU8eqmMfcwZ0YSngti4o6GKA2YUtt9aSwCou9xEgzD3Zc"}
    ).then((value){
      Map<String,dynamic> jsonData = jsonDecode(value.body);
      List photos = jsonData["photos"];
      for (var element in photos) {
        trendingWallpapers.add(photosModel.apiToApp(element));
      }
    });
    return trendingWallpapers;
  }
}
