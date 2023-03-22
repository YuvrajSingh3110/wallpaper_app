import 'package:flutter/material.dart';
import 'package:wallpaper_app/controller/ApiOperation.dart';
import 'package:wallpaper_app/view/widgets/categoryBlock.dart';
import 'package:wallpaper_app/view/widgets/searchBar.dart';

import '../../model/photosModel.dart';

class homeScreen extends StatefulWidget {
  const homeScreen({Key? key}) : super(key: key);

  @override
  State<homeScreen> createState() => _homeScreenState();
}

class _homeScreenState extends State<homeScreen> {

  late List<photosModel> trendingWallList;

  getTrendWall() async{
    trendingWallList = await ApiOperation.getTrendingWallpapers();
    setState(() {

    });
  }

  @override
  void initState() {
    super.initState();
    // TODO: implement initState
    getTrendWall();
  }

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
                    itemBuilder: ((context, index) => catBlock(imgSrc: trendingWallList[index].imgSrc)))),
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
                    itemCount: trendingWallList.length,
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
                            trendingWallList[index].imgSrc),
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
