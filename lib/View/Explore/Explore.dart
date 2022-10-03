import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:rent_house/Conrtoller/AdminApis/adminApis.dart';
import 'package:rent_house/View/Drawer/drawerData.dart';
import 'package:rent_house/View/Explore/ExploreView.dart';
import 'package:rent_house/View/Explore/SearchDeligate.dart';
import 'package:rent_house/config/color.dart';
import 'package:http/http.dart' as http;
import 'package:rent_house/widgets/widgets.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Explore extends StatefulWidget {
  const Explore({super.key});
  @override
  State<Explore> createState() => _ExploreState();
}

class _ExploreState extends State<Explore> {
  @override
 

  Map? mapResponse;
  Map? dataResponce;
  List titles = [];
  // ignore: unused_field
  List? _users;

  @override
  void initState() {
    _getNames();
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
        key: _scaffoldkey,
        drawer: SizedBox(
            width: size.width * 0.6, child: const Drawer(child: DrawerData())),
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
                          Icons.menu,
                          size: 25,
                          color: orange,
                        ),
                        onPressed: () {
                          _scaffoldkey.currentState!.openDrawer();
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
              InkWell(
                onTap: () {
                  showSearch(
                      context: context,
                      delegate: MySearchDelegate(titles: titles));
                },
                child: Container(
                  width: size.width * 0.87,
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(Radius.circular(30)),
                    boxShadow: [
                      BoxShadow(
                        color: const Color.fromARGB(255, 199, 197, 197)
                            .withOpacity(0.3),
                        offset: const Offset(5.0, 10.0),
                        blurRadius: 5.0,
                      ),
                    ],
                  ),
                  child: Container(
                    alignment: Alignment.topLeft,
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(.8),
                      borderRadius: const BorderRadius.all(
                        Radius.circular(20.0),
                      ),
                    ),
                    child: IconButton(
                        icon: const Icon(Icons.search), onPressed: () {}),
                  ),
                ),
              ),
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
                              (ExploreView(indexPass: _users![index])),
                        ),
                      ),
              )
            ]),
          ),
        )));
  }

  Future apiCall() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    var token = pref.getString('token');
    http.Response response;
    response = await http.post(
        Uri.parse("https://denga.r3therapeutic.com/public/api/getpost"),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          'Authorization': 'Bearer $token',
        });
    if (response.statusCode == 200) {
      setState(() {
        mapResponse = jsonDecode(response.body);
        _users = mapResponse?['data'];
      });
    }
  }

  void _getNames() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    var token = pref.getString('token');
    final response =
        await dio.post('https://denga.r3therapeutic.com/public/api/searchpost',
            options: Options(
              headers: {"authorization": "Bearer $token"},
            ));

    if (response.statusCode == 200) {
      setState(() {
        List tempList = [];
        tempList = response.data as List;
        for (var i = 0; i <= tempList.length - 1; i++) {
          titles.add(tempList[i]['title']);
        }
      });
    }

    // setState(() {
    //   names = titles;
    //   names.shuffle();
    //   filteredNames = names;
    // });
  }
}
