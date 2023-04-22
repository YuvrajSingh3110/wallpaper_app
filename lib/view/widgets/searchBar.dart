import 'package:flutter/material.dart';
import 'package:wallpaper_app/view/screens/search.dart';
import 'package:motion_toast/motion_toast.dart';

class search extends StatelessWidget {
  search({Key? key}) : super(key: key);

  final TextEditingController _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 3),
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      decoration: BoxDecoration(
        color: Colors.black12,
        borderRadius: BorderRadius.circular(30),
      ),
      child: Row(children: [
        InkWell(
          onTap: () {
            if ((_searchController.text).replaceAll(" ", "") == "") {
              MotionToast.error(
                      title: const Text("Error!"),
                      description: const Text("Please enter something"))
                  .show(context);
            } else {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          searchScreen(query: _searchController.text)));
            }
          },
          child: Container(
            margin: const EdgeInsets.fromLTRB(5, 0, 5, 0),
            child: const Icon(Icons.search),
          ),
        ),
        const SizedBox(width: 5),
        Expanded(
          child: TextField(
            controller: _searchController,
            decoration: const InputDecoration(
                border: InputBorder.none,
                hintText: "What do you want to search",
                errorBorder: InputBorder.none,
                focusedBorder: InputBorder.none,
                disabledBorder: InputBorder.none,
                focusedErrorBorder: InputBorder.none,
                enabledBorder: InputBorder.none),
          ),
        )
      ]),
    );
  }
}
