import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:group_radio_button/group_radio_button.dart';

import 'package:rent_house/Conrtoller/AdminApis/adminApis.dart';
import 'package:rent_house/View/Drawer/drawerData.dart';
import 'package:rent_house/View/Explore/SearchDeligate.dart';
import 'package:rent_house/View/Home/homeView.dart';
import 'package:rent_house/View/Home/widgets/PopUpOverLay.dart';

import 'package:rent_house/widgets/widgets.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:dio/dio.dart';

import '../../../Config/color.dart';

class FilterScreen extends StatefulWidget {
    final indexPass;
  const FilterScreen({super.key,required this.indexPass});
  @override
  State<FilterScreen> createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  // List<HomeRoom> listItem = [];
  bool pressAttention = true;
  bool isLoading = true;
  // bool rent = false;
  @override
  void initState() {
    // listItem = _hotelRoom();

    super.initState();
  }
  GlobalKey<ScaffoldState> _scaffoldkey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
          body: Center(
        child: Container(
          width: MediaQuery.of(context).size.width * 0.97,
          // color: Color.fromARGB(255, 207, 89, 89),

          child: Column(children: [
            SizedBox(height: size.height * 0.010),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
                    backgroundColor: Color.fromARGB(255, 255, 255, 255),
                    child: IconButton(
                      icon: const Icon(
                        Icons.arrow_back,
                        size: 25,
                        color: blue,
                      ),
                      onPressed: () {
                        Get.back();
                      },
                    ),
                  ),
                ),
                text(
                    title: "Filterd Screen",
                    fontsize: 20.0,
                    fontweight: FontWeight.normal,
                    color: const Color.fromARGB(255, 15, 5, 5)),
                const Image(image: AssetImage('assets/images/iconTop.png')),
              ],
            ),
            Expanded(
              child: 
                   SingleChildScrollView(
                      child: GridView.builder(
                          physics: const NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          primary: false,
                          itemCount:widget.indexPass,
                          gridDelegate:
                              const SliverGridDelegateWithMaxCrossAxisExtent(
                            mainAxisSpacing: 1.0,
                            crossAxisSpacing: 1.0,
                            // childAspectRatio: 12.0,
                            mainAxisExtent: 233,
                            maxCrossAxisExtent: 200,
                          ),
                          itemBuilder: (BuildContext context, int index) {
                          
                            return (RentailView(indexPass: widget.indexPass![index]));
                          }),
                    ),
            ),
          ]),
        ),
      )),
    );
  }
}

