import 'package:flutter/material.dart';
import 'package:wallpaper_app/controller/ApiOperation.dart';
import 'package:wallpaper_app/model/categoryModel.dart';
import 'package:wallpaper_app/view/screens/fullScreen.dart';
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
  late List<categoryModel> catWallList;
  bool isLoading = true;

  getTrendWall() async {
    trendingWallList = await ApiOperation.getTrendingWallpapers();
    setState(() {
      isLoading = false;
    });
  }

  getCatWall() async {
    catWallList = await ApiOperation.getCategoriesList();
    setState(() {
      catWallList = catWallList;
    });
  }

  @override
  void initState() {
    super.initState();
    // TODO: implement initState
    getCatWall();
    getTrendWall();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: isLoading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : SingleChildScrollView(
              child: Column(
                children: [
                  search(),
                  Container(
                    margin: const EdgeInsets.symmetric(vertical: 20),
                    child: SizedBox(
                        height: 100,
                        width: MediaQuery.of(context).size.width,
                        child: ListView.builder(
                            physics: const BouncingScrollPhysics(),
                            scrollDirection: Axis.horizontal,
                            itemCount: catWallList.length,
                            itemBuilder: ((context, index) => catBlock(
                                categoryImgSrc: catWallList[index].catImgUrl,
                                categoryName: catWallList[index].catName)))),
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 10),
                    height: 700,
                    child: RefreshIndicator(
                      onRefresh: () async {
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => homeScreen()));
                      },
                      child: GridView.builder(
                          padding: const EdgeInsets.all(15),
                          physics: const BouncingScrollPhysics(),
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2,
                                  crossAxisSpacing: 10,
                                  mainAxisSpacing: 3,
                                  mainAxisExtent: 250),
                          itemCount: trendingWallList.length,
                          itemBuilder: (context, index) => GridTile(
                                child: InkWell(
                                  onTap: () => Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => FullScreen(
                                              imgUrl: trendingWallList[index]
                                                  .imgSrc))),
                                  child: Hero(
                                    tag: trendingWallList[index].imgSrc,
                                    child: Container(
                                      height: 500,
                                      width: 30,
                                      decoration: BoxDecoration(
                                          color: Colors.lightBlueAccent,
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(10),
                                        child: Image.network(
                                            fit: BoxFit.cover,
                                            trendingWallList[index].imgSrc),
                                      ),
                                    ),
                                  ),
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
