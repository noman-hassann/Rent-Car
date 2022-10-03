import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:rent_house/Conrtoller/AdminApis/adminApis.dart';
import 'package:rent_house/View/Drawer/drawerData.dart';
import 'package:rent_house/View/Explore/ExploreView.dart';
import 'package:rent_house/View/Explore/SearchDeligate.dart';
import 'package:rent_house/View/SelectAbleList/selectAbleListView.dart';
import 'package:rent_house/config/color.dart';
import 'package:http/http.dart' as http;
import 'package:rent_house/widgets/widgets.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SelectAbleList extends StatefulWidget {
  const SelectAbleList({super.key});
  @override
  State<SelectAbleList> createState() => _SelectAbleListState();
}

class _SelectAbleListState extends State<SelectAbleList> {
  @override
  Map? mapResponse;
  Map? dataResponce;
  List titles = [];
  // ignore: unused_field
  List? _users;

  @override
  void initState() {
    apiCall();

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
                    child: CircleAvatar(
                      backgroundColor: const Color.fromARGB(255, 255, 255, 255),
                      child: IconButton(
                        icon: const Icon(
                          Icons.arrow_back,
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
                      title: "Subccription",
                      fontsize: 20.0,
                      fontweight: FontWeight.normal,
                      color: const Color.fromARGB(255, 15, 5, 5)),
                  Container()
                ],
              ),
              SizedBox(
                height: size.height * 0.022,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 28.0),
                child: text(
                    title: "Choose Your  Plan",
                    fontsize: 20.0,
                    fontweight: FontWeight.bold,
                    color: const Color.fromARGB(255, 15, 5, 5)),
              ),
              SizedBox(
                height: size.height * 0.022,
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
                            mainAxisSpacing: 10.0,
                            crossAxisSpacing: 1.0,
                            // childAspectRatio: 12.0,
                            mainAxisExtent: 190,
                            maxCrossAxisExtent: 400
                          ),
                          itemBuilder: (BuildContext context, int index) =>
                              (SelectAbleListView(indexPass: _users![index])),
                        ),
                      ),
              )
            ]),
          ),
        )));
  }

  Future apiCall() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    // var token = pref.getString('token');
    var token='197|J5fPAvuWQN0jzJ1BFDKpeAcoSfKbqKLZDB8SDkCx';
    http.Response response;
    response = await http.get(
        Uri.parse("https://denga.r3therapeutic.com/public/api/getAllPackages"),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          'Authorization': 'Bearer $token',
        });
        
    if (response.statusCode == 200) {
      setState(() {
        mapResponse = jsonDecode(response.body);
        _users = mapResponse?['packages'];
      });
    }
  }
}

