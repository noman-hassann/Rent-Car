import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rent_house/Model/favourite.dart';
import 'package:rent_house/View/Explore/Explore.dart';
import 'package:rent_house/View/Favourite/favouriteView.dart';
import 'package:rent_house/config/color.dart';
import 'package:rent_house/widgets/widgets.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class favourite extends StatefulWidget {
  const favourite({super.key});
  @override
  State<favourite> createState() => _favouriteState();
}

class _favouriteState extends State<favourite> {
  // List<ExploreModel> listItem = [];
  Map? mapResponse;
  // ignore: unused_field
  List? _users;
  favouriteJson favjson = favouriteJson();

  @override
  void initState() {
    if (_users == null) {
      apiCall();
    }
    super.initState();
  }

  // ignore: prefer_final_fields
  GlobalKey<ScaffoldState> _scaffoldkey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        body: SafeArea(
            child: Center(
      child: SizedBox(
        width: MediaQuery.of(context).size.width * 0.9,
        // color: Color.fromARGB(255, 207, 89, 89),
        child: Column(children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                decoration: const BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Color.fromARGB(255, 214, 210, 210),
                      offset: Offset(1.0, 1.0),
                      blurRadius: 9.0,
                    ),
                  ],
                ),
                child: CircleAvatar(
                  backgroundColor: const Color.fromARGB(255, 255, 255, 255),
                  child: IconButton(
                    icon: const Icon(
                      Icons.arrow_back,
                      size: 25,
                      color: orange,
                    ),
                    onPressed: () {
                      Get.to(Explore());
                    },
                  ),
                ),
              ),
              text(
                  title: "",
                  fontsize: 20.0,
                  fontweight: FontWeight.normal,
                  color: const Color.fromARGB(255, 15, 5, 5)),
              const Image(image: AssetImage('assets/images/iconTop.png')),
            ],
          ),
          SizedBox(height: size.height * 0.042),
          SizedBox(
            height: size.height * 0.02,
          ),
          Expanded(
            child: _users == null
                ? const Center(child: CircularProgressIndicator())
                : SingleChildScrollView(
                    child: GridView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      primary: false,
                      itemCount: _users!.length,
                      gridDelegate:
                          const SliverGridDelegateWithMaxCrossAxisExtent(
                        mainAxisSpacing: 1.0,
                        crossAxisSpacing: 1.0,
                        // childAspectRatio: 12.0,
                        mainAxisExtent: 145,
                        maxCrossAxisExtent: 400,
                      ),
                      itemBuilder: (BuildContext context, int index) =>
                          (FavouriteView(indexPass: _users![index])),
                    ),
                  ),
          )
        ]),
      ),
    )));
  }

  getStringValuesSF() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    //Return String
    String? token = prefs.getString('token');
    return token;
  }

  Future apiCall() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    var token = pref.getString('token');
    http.Response response;
    response = await http.get(
        Uri.parse(
            "https://denga.r3therapeutic.com/public/api/getFavouritePosts"),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          'Authorization': 'Bearer $token',
        });
    if (response.statusCode == 200) {
      setState(() {
        _users = jsonDecode(response.body);
      });
    }
  }
}
