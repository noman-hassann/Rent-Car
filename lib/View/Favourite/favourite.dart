import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:rent_house/View/Explore/Explore.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

import '../../Config/color.dart';
import '../Home/homeView.dart';

class favourite extends StatefulWidget {
  const favourite({super.key});
  @override
  State<favourite> createState() => _favouriteState();
}

class _favouriteState extends State<favourite> {
  // List<ExploreModel> listItem = [];
  Map? mapResponse;
  // ignore: unused_field
  // List? _users;

  @override
  void initState() {
    super.initState();
  }

  // ignore: prefer_final_fields
  GlobalKey<ScaffoldState> _scaffoldkey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        body: SafeArea(
            child: Padding(
              padding: const EdgeInsets.only(top:8.0),
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
                        color: blue,
                      ),
                      onPressed: () {
                        Get.to(Explore());
                      },
                    ),
                  ),
                ),
              ],
          ),
          SizedBox(height: size.height * 0.042),
          SizedBox(
              height: size.height * 0.02,
          ),
          Expanded(
              child:
              //  _users == null
              //     ? const Center(child: CircularProgressIndicator())
              //     :
                   GridView.builder(
                      physics: const ScrollPhysics(),
                      scrollDirection: Axis.vertical,
                      shrinkWrap: true,
                      primary: false,
                      itemCount: 10,
                      gridDelegate:
                          const SliverGridDelegateWithMaxCrossAxisExtent(
                        mainAxisSpacing: 1.0,
                        crossAxisSpacing: 1.0,
                        // childAspectRatio: 12.0,
                        mainAxisExtent: 200,
                        maxCrossAxisExtent: 200,
                      ),
                      itemBuilder: (BuildContext context, int index) {
                        return (RentailView(indexPass: [index]));
                      }),
          )
        ]),
      ),
    ),
            )));
  }
}
//   getStringValuesSF() async {
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     //Return String
//     String? token = prefs.getString('token');
//     return token;
//   }

//   Future apiCall() async {
//     SharedPreferences pref = await SharedPreferences.getInstance();
//     var token = pref.getString('token');
//     http.Response response;
//     response = await http.get(
//         Uri.parse(
//             "https://denga.r3therapeutic.com/public/api/getFavouritePosts"),
//         headers: {
//           'Content-Type': 'application/json',
//           'Accept': 'application/json',
//           'Authorization': 'Bearer $token',
//         });
//     if (response.statusCode == 200) {
//       setState(() {
//         _users = jsonDecode(response.body);
//       });
//     }
//   }
// }
