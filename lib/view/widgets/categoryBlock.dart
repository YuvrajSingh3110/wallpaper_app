import 'package:flutter/material.dart';

class catBlock extends StatelessWidget {
  String imgSrc;
  catBlock({Key? key, required this.imgSrc}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 8),
        child: Stack(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: Image.network(
              width: 100,
              fit: BoxFit.cover,
              height: 70,
             imgSrc),
        ),
        Container(
          height: 70,
          width: 100,
          decoration: BoxDecoration(
              color: Colors.black26, borderRadius: BorderRadius.circular(20)),
        ),
        const Positioned(
          top: 30,
          left: 0,
          right: 0,
          bottom: 0,
          child: Text(
            "Transformers",
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center
          ),
        )
      ],
    ));
  }
}
