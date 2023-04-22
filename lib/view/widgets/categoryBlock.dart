import 'package:flutter/material.dart';
import 'package:wallpaper_app/view/screens/category.dart';

class catBlock extends StatelessWidget {
  String categoryName;
  String categoryImgSrc;
  catBlock({super.key, required this.categoryImgSrc, required this.categoryName});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => categoryScreen(
                    catImgUrl: categoryImgSrc, catName: categoryName)));
      },
      child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 8),
          child: Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.network(
                  categoryImgSrc,
                  width: 100,
                  fit: BoxFit.cover,
                  height: 70,
                ),
              ),
              Container(
                height: 70,
                width: 100,
                decoration: BoxDecoration(
                    color: Colors.black26,
                    borderRadius: BorderRadius.circular(20)),
              ),
              Positioned(
                top: 30,
                left: 0,
                right: 0,
                bottom: 0,
                child: Text(categoryName,
                    style: const TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center),
              )
            ],
          )),
    );
  }
}
