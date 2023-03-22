import 'package:flutter/material.dart';

class customAppBar extends StatelessWidget {
  const customAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: RichText(
          text: const TextSpan(
            children: [
              TextSpan(
                text: 'Wallpaper',
              ),
              TextSpan(
                text: 'App'
              )
            ]
          )
      ),
    );
  }
}
