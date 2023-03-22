import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiOperation {
  static getTrendingWallpapers() async {
    await http.get(
        Uri.parse("https://api.pexels.com/v1/curated"),
      headers: {"Authorization": "elWPj0qsRpqFU8eqmMfcwZ0YSngti4o6GKA2YUtt9aSwCou9xEgzD3Zc"}
    ).then((value){
      Map<String,dynamic> jsonData = jsonDecode(value.body);
      List photos = jsonData["photos"];
      photos.forEach((element) {
        Map<String,dynamic> src = element["src"];
        print(src["portrait"]);
      });
    });

  }
}
