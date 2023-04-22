import 'package:flutter/material.dart';
import 'package:wallpaper_app/view/screens/fullScreen.dart';
import 'package:wallpaper_app/view/widgets/categoryBlock.dart';

import '../../controller/ApiOperation.dart';
import '../../model/photosModel.dart';

class categoryScreen extends StatefulWidget {
  String catName;
  String catImgUrl;
  categoryScreen({Key? key, required this.catImgUrl, required this.catName})
      : super(key: key);

  @override
  State<categoryScreen> createState() => _categoryScreenState();
}

class _categoryScreenState extends State<categoryScreen> {
  late List<photosModel> catWallpapers;
  bool isLoading = true;
  getCategory() async {
    catWallpapers = await ApiOperation.searchWallpapers(widget.catName);
    setState(() {
      isLoading = false;
    });
  }

  @override
  void initState() {
    getCategory();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Stack(
              children: [
                Image.network(
                  widget.catImgUrl,
                  fit: BoxFit.cover,
                  height: 150,
                  width: MediaQuery.of(context).size.width,
                ),
                Container(
                  height: 150,
                  width: MediaQuery.of(context).size.width,
                  color: Colors.black26,
                ),
                Positioned(
                  top: 40,
                  left: 75,
                  child: Text(
                    widget.catName,
                    style: const TextStyle(
                        fontSize: 50,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                ),
              ],
            ),
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
                    itemCount: catWallpapers.length,
                    itemBuilder: (context, index) => GridTile(
                          child: InkWell(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => FullScreen(
                                          imgUrl:
                                              catWallpapers[index].imgSrc)));
                            },
                            child: Hero(
                              tag: catWallpapers[index].imgSrc,
                              child: Container(
                                height: 500,
                                width: 30,
                                decoration: BoxDecoration(
                                    color: Colors.lightBlueAccent,
                                    borderRadius: BorderRadius.circular(10)),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(10),
                                  child: Image.network(
                                      fit: BoxFit.cover, widget.catImgUrl),
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
