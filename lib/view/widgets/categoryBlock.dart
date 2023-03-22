import 'package:flutter/material.dart';

class catBlock extends StatelessWidget {
  const catBlock({Key? key}) : super(key: key);

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
              "https://images.pexels.com/photos/12334692/pexels-photo-12334692.jpeg"),
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
