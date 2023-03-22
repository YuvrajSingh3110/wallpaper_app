import 'package:flutter/material.dart';

class search extends StatefulWidget {
  const search({Key? key}) : super(key: key);

  @override
  State<search> createState() => _searchState();
}

class _searchState extends State<search> {
  TextEditingController searchController = new TextEditingController();

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
        GestureDetector(
          onTap: () {
            if ((searchController.text).replaceAll(" ", "") == "") {
              // Fluttertoast.showToast(
              // msg: "Please enter city name",
              // toastLength: Toast.LENGTH_SHORT,
              // gravity: ToastGravity.CENTER);
            } else {

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
            controller: searchController,
            decoration: const InputDecoration(
                border: InputBorder.none,
                hintText: "What do you want to search",
                errorBorder: InputBorder.none,
                focusedBorder: InputBorder.none,
                disabledBorder: InputBorder.none,
                focusedErrorBorder: InputBorder.none,
               enabledBorder: InputBorder.none
            ),
          ),
        )
      ]),
    );
  }
}
