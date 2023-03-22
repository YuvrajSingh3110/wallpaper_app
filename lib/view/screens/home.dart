import 'package:flutter/material.dart';
import 'package:wallpaper_app/view/widgets/categoryBlock.dart';
import 'package:wallpaper_app/view/widgets/searchBar.dart';

class home extends StatefulWidget {
  const home({Key? key}) : super(key: key);

  @override
  State<home> createState() => _homeState();
}

class _homeState extends State<home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const search(),
            SizedBox(
                height: 100,
                width: MediaQuery.of(context).size.width,
                child: ListView.builder(
                  physics: const BouncingScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    itemCount: 30,
                    itemBuilder: ((context, index) => const catBlock()))),
            Expanded(
              child: SizedBox(
                height: MediaQuery.of(context).size.height,
                child: GridView.builder(
                  padding: const EdgeInsets.all(15),
                    physics: const BouncingScrollPhysics(),
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 3,
                      mainAxisExtent: 250
                    ),
                    itemCount: 50,
                    itemBuilder: (context, index) => Container(
                          height: 500,
                          width: 30,
                          decoration: BoxDecoration(
                            color: Colors.lightBlueAccent,
                            borderRadius: BorderRadius.circular(10)
                          ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.network(
                          fit: BoxFit.cover,
                            "https://images.pexels.com/photos/1366919/pexels-photo-1366919.jpeg"),
                      ),
                        )),
              ),
            )
          ],
        ),
      ),
    );
  }
}
