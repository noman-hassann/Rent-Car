import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rent_house/Conrtoller/FavouriteApis/favouriteApis.dart';
import 'package:rent_house/Conrtoller/FavouriteApis/unfavourite.dart';
import 'package:rent_house/View/Home/homedetails.dart';
import 'package:rent_house/View/LoginSignUp/View/login.dart';
import 'package:rent_house/config/color.dart';
import 'package:http/http.dart' as http;
import 'package:rent_house/widgets/icons.dart';

import 'package:rent_house/widgets/textIconFunColumn.dart';
import 'package:rent_house/widgets/textIconFunRow.dart';
import 'package:rent_house/widgets/widgets.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../GuestScreen/alert.dart';

class ExploreView extends StatefulWidget {
  final indexPass;
  const ExploreView({Key? key, required this.indexPass}) : super(key: key);

  @override
  State<ExploreView> createState() => _ExploreViewState();
}

Map? mapResponse;
Map? dataResponce;

var userRole;

class _ExploreViewState extends State<ExploreView> {
  @override
  void initState() {
    userRole = getRole();
    super.initState();
  }

  getRole() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    setState(() {
      userRole = pref.getString('role')!;
    });
    if (kDebugMode) {
      print("role1  $userRole");
    }
  }
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    var image = widget.indexPass['images'];
    // bool istrue = widget.indexPass['isfavourite'];
    // print(widget.indexPass['isfavourite']);
    // print(widget.indexPass['id']);
    // favourite = istrue == true ? true : false;
    late bool favourite =
        widget.indexPass
        ['isfavourite'] == true ? true : false;
    return Scaffold(
        body: SafeArea(
            child: Center(
      child: Column(
        //  alignment: Alignment.topCenter,
        children: [
          Material(
            shadowColor: const Color.fromARGB(255, 149, 148, 148),
            elevation: 4,
            borderRadius: const BorderRadius.all(Radius.circular(25)),
            child: SizedBox(
              height: size.height * 0.17,
              width: size.width * 0.9,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  InkWell(
                    onTap: () {
                      Get.to(HomeDetail(indexPass: widget.indexPass),
                          transition: Transition.rightToLeft,
                          duration: const Duration(milliseconds: 300));
                    },
                    child: Image.network(
                        //"https://aremorch.com/wp-content/uploads/2016/09/The-Details-That-Matter-Top-Things-Every-Luxury-Hotel-Room-Should-Have.png",
                        "https://denga.r3therapeutic.com/public${image[0]['image_name']}",
                        //  url+image[0]['image_name'],
                        width: size.width * 0.3,
                        height: 150,
                        fit: BoxFit.fill),
                  ),

                  // Image.asset(
                  //  indexPass['images'],
                  // ),
                  const SizedBox(
                    width: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 12.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: size.width * 0.5,
                          // color: Colors.amber,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              text(
                                title: widget.indexPass['title']
                                    .toString()
                                    .toUpperCase(),
                                fontsize: 12.0,
                                fontweight: FontWeight.bold,
                              ),
                              userRole != "guest"
                                  ? GestureDetector(
                                      onTap: () {
                                        if (favourite == true) {
                                          ///  print(widget.indexPass['id']);
                                          setState(() {
                                            favourite = false;
                                            RemovefavouriteApis(
                                                property_id:
                                                    widget.indexPass['id'],
                                                context: context);
                                          });
                                        } else {
                                          setState(() {
                                            favourite = true;
                                            favouriteApis(
                                                property_id:
                                                    widget.indexPass['id'],
                                                context: context);
                                          });
                                        }
                                      },
                                      child: iconFun(
                                          icon: favourite == true
                                              ? CupertinoIcons.heart_fill
                                              : CupertinoIcons.heart),
                                    )
                                  : GestureDetector(
                                      onTap: () {
                                        showDialog(
                                          context: context,
                                          builder: (_) => AlertClick(
                                              // callbackFunction: callback,
                                              ),
                                        );
                                      },
                                      child: iconFun(
                                          icon: favourite == true
                                              ? CupertinoIcons.heart_fill
                                              : CupertinoIcons.heart),

                                      // GestureDetector(
                                      //   onTap: () {},
                                      //   child: iconFun(icon: CupertinoIcons.delete_solid),
                                      // ),
                                    )
                            ],
                          ),
                        ),
                        textIconFunRow(
                            title: widget.indexPass['address']
                                .toString()
                                .toUpperCase(),
                            icon: Icons.location_on,
                            iconSize: 14.0,
                            fontsize: 12.0,
                            fontColor: textwhite,
                            iconColor: orange),
                        const SizedBox(
                          height: 10,
                        ),
                        textIconFunRow(
                            title: widget.indexPass['price']
                                .toString()
                                .toUpperCase(),
                            icon: Icons.money,
                            iconSize: 20.0,
                            fontsize: 12.0,
                            fontColor: textwhite,
                            iconColor: orange),
                        const SizedBox(
                          height: 5,
                        ),
                        SizedBox(
                            width: size.width * 0.45,
                            // color: Colors.amber,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                textIconFunColumn(
                                    title:
                                        'Bed ${widget.indexPass['bedrooms']}',
                                    icon: CupertinoIcons.bed_double_fill,
                                    iconColor: orange,
                                    fontColor: textwhite,
                                    fontsize: 12.0),
                                textIconFunColumn(
                                    title:
                                        'Bath ${widget.indexPass['bathrooms']}',
                                    icon: Icons.bathtub_outlined,
                                    iconColor: orange,
                                    fontColor: textwhite,
                                    fontsize: 12.0),
                                textIconFunColumn(
                                    title:
                                        'Parking ${widget.indexPass['parking']}',
                                    icon: CupertinoIcons.car_detailed,
                                    iconColor: orange,
                                    fontColor: textwhite,
                                    fontsize: 12.0),
                              ],
                            ))
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
        ],
      ),
    )));
  }
}
