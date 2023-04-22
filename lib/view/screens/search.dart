import 'package:flutter/material.dart';
import 'package:wallpaper_app/model/photosModel.dart';
import 'package:wallpaper_app/view/screens/fullScreen.dart';
import 'package:wallpaper_app/view/widgets/searchBar.dart';
import '../../controller/ApiOperation.dart';

class searchScreen extends StatefulWidget {
  String query;
  searchScreen({Key? key, required this.query}) : super(key: key);

  @override
  State<searchScreen> createState() => _searchScreenState();
}

class _searchScreenState extends State<searchScreen> {

  late List<photosModel> searchWallList;

  searchWall() async{
    searchWallList = await ApiOperation.searchWallpapers(widget.query);
    setState(() {

    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    searchWall();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            search(),
            Expanded(
              child: SizedBox(
                height: MediaQuery.of(context).size.height,
                child: GridView.builder(
                    padding: const EdgeInsets.all(15),
                    physics: const BouncingScrollPhysics(),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            crossAxisSpacing: 10,
                            mainAxisSpacing: 3,
                            mainAxisExtent: 250),
                    itemCount: searchWallList.length,
                    itemBuilder: (context, index) => GridTile(
                      child: InkWell(
                        onTap: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => FullScreen(imgUrl: searchWallList[index].imgSrc)));
                        },
                        child: Hero(
                          tag: searchWallList[index].imgSrc,
                          child: Container(
                                height: 500,
                                width: 30,
                                decoration: BoxDecoration(
                                    color: Colors.lightBlueAccent,
                                    borderRadius: BorderRadius.circular(10)),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(10),
                                  child: Image.network(
                                      fit: BoxFit.cover,
                                    searchWallList[index].imgSrc
                                      ),
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
