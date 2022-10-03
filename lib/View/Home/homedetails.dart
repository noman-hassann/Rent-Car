// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:rent_house/Conrtoller/FavouriteApis/favouriteApis.dart';
import 'package:rent_house/Conrtoller/FavouriteApis/unfavourite.dart';
import 'package:rent_house/View/Services/Slider.dart';
import 'package:rent_house/config/color.dart';
import 'package:rent_house/test2.dart';
import 'package:rent_house/widgets/icons.dart';
import 'package:rent_house/widgets/textButton.dart';
import 'package:rent_house/widgets/textIconFunColumn.dart';
import 'package:rent_house/widgets/widgets.dart';
import 'package:url_launcher/url_launcher.dart';

class HomeDetail extends StatefulWidget {
  final indexPass;
  const HomeDetail({super.key, required this.indexPass});

  @override
  State<HomeDetail> createState() => _HomeDetailtate();
}

class _HomeDetailtate extends State<HomeDetail> {
  String? firstHalf;
  String? secondHalf;
  String? txt;

  bool flag = true;
  late bool favourite = widget.indexPass['isfavourite'] == true ? true : false;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var image = widget.indexPass['images'];
    String others = widget.indexPass['others'];
    String number = widget.indexPass['user']['contact'];
    var iconDescription = widget.indexPass['isfavourite'];

    String txt = widget.indexPass['description'].toString();
    if (txt.length > 250) {
      firstHalf = txt.substring(0, 250);
      secondHalf = txt.substring(50, txt.length);
    } else {
      firstHalf = txt;
      secondHalf = "";
    }
    Size size = MediaQuery.of(context).size;
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        body: Stack(children: [
          SingleChildScrollView(
            child: Column(children: [
              Stack(children: [
                Positioned(
                  child: AnimationSlider(indexImages: image),
                  height: height * 0.5,
                  width: width,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    //Drawer opening and topbar widgets
                    Container(
                      height: 40,
                      width: MediaQuery.of(context).size.width * 1,
                      alignment: Alignment.topLeft,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          IconButton(
                            icon: const Icon(
                              Icons.arrow_back,
                              color: Colors.white,
                              size: 30,
                            ),
                            onPressed: () {
                              Navigator.pop(context);
                            },
                          ),
                          GestureDetector(
                            onTap: () {
                              if (favourite == true) {
                                ///  print(widget.indexPass['id']);
                                setState(() {
                                  favourite = false;
                                  RemovefavouriteApis(
                                      property_id: widget.indexPass['id'],
                                      context: context);
                                });
                              } else {
                                setState(() {
                                  favourite = true;
                                  favouriteApis(
                                      property_id: widget.indexPass['id'],
                                      context: context);
                                });
                              }
                            },
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: iconFun(
                                  icon: favourite == true
                                      ? CupertinoIcons.heart_fill
                                      : CupertinoIcons.heart),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: size.height * 0.22,
                    ),
                    Container(
                      height: size.height * 0.09,
                      //     color: Colors.amber,
                      child: Transform.rotate(
                        angle: -0.3,
                        child: Container(
                          decoration: const BoxDecoration(
                            //  color: Colors.amber,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.transparent,
                                offset: Offset(1.0, 1.0),
                                blurRadius: 9.0,
                              ),
                            ],
                          ),
                          child: Padding(
                            padding: const EdgeInsets.only(right: 30.0),
                            child: CircleAvatar(
                              radius: 30,
                              backgroundColor:
                                  Color.fromARGB(255, 235, 233, 233),
                              child: IconButton(
                                icon: const Icon(
                                  Icons.send,
                                  size: 30,
                                  color: orange,
                                ),
                                onPressed: () {},
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ]),
              // SizedBox(height: height * 0.03),
              Container(
                width: size.width * 0.9,
                alignment: Alignment.topRight,
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      text(
                          title: widget.indexPass['title']
                              .toString()
                              .toUpperCase(),
                          fontsize: 19.0,
                          fontweight: FontWeight.bold),
                      SizedBox(height: height * 0.01),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          text(
                              title: "Area",
                              fontsize: 18.0,
                              fontweight: FontWeight.normal,
                              color: textwhite),
                          // text(
                          //     title: widget.indexPass['title']
                          //         .toString()
                          //         .toUpperCase(),
                          //     fontsize: 14.0,
                          //     fontweight: FontWeight.normal,
                          //     color: textwhite),
                          text(
                              title: "${widget.indexPass['area']} Sq.Ft",
                              fontsize: 14.0,
                              fontweight: FontWeight.bold,
                              color: orange),
                        ],
                      ),
                      SizedBox(
                        height: size.height * 0.015,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          text(
                              title: "Price",
                              fontsize: 18.0,
                              fontweight: FontWeight.normal,
                              color: textwhite),
                          text(
                              title: "K ${widget.indexPass['price']}  ",
                              fontsize: 14.0,
                              fontweight: FontWeight.bold,
                              color: orange),
                        ],
                      ),
                      SizedBox(
                        height: size.height * 0.015,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 5.0),
                        child: Row(
                          children: [
                            textIconFunColumn(
                                title: "${widget.indexPass['bedrooms']} Beds",
                                icon: CupertinoIcons.bed_double_fill,
                                iconColor: orange,
                                fontColor: textwhite,
                                fontsize: 12.0),
                            SizedBox(
                              width: size.width * 0.05,
                            ),
                            textIconFunColumn(
                                title: "${widget.indexPass['bathrooms']} Bath",
                                icon: Icons.bathtub_outlined,
                                iconColor: orange,
                                fontColor: textwhite,
                                fontsize: 12.0),
                            SizedBox(
                              width: size.width * 0.05,
                            ),
                            textIconFunColumn(
                                title: "${widget.indexPass['parking']} Parking",
                                icon: CupertinoIcons.car_detailed,
                                iconColor: orange,
                                fontColor: textwhite,
                                fontsize: 12.0),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: size.height * 0.01,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          text(
                              title: "NearBy ",
                              fontsize: 14.0,
                              fontweight: FontWeight.bold,
                              color: textwhite),
                          SizedBox(
                            height: size.height * 0.015,
                          ),
                          Container(
                            //  color: Colors.amber,
                            height: size.height * 0.06,

                            child: SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Row(
                                children: [
                                  others.contains("Restaurants")
                                      ? textIconFunColumn(
                                          title: "Restaurants",
                                          icon: FontAwesomeIcons.hotel,
                                          iconColor: orange,
                                          fontColor: textwhite,
                                          fontsize: 12.0)
                                      : Container(),
                                  SizedBox(
                                    width: size.width * 0.05,
                                  ),
                                  others.contains("Scool")
                                      ? textIconFunColumn(
                                          title: " School",
                                          icon: FontAwesomeIcons.school,
                                          iconColor: orange,
                                          fontColor: textwhite,
                                          fontsize: 12.0)
                                      : Container(),
                                  SizedBox(
                                    width: size.width * 0.05,
                                  ),
                                  others.contains("Malls")
                                      ? textIconFunColumn(
                                          title: " Malls",
                                          icon: FontAwesomeIcons.building,
                                          iconColor: orange,
                                          fontColor: textwhite,
                                          fontsize: 12.0)
                                      : Container(),
                                  SizedBox(
                                    width: size.width * 0.05,
                                  ),
                                  others.contains("Bar")
                                      ? textIconFunColumn(
                                          title: " Bar",
                                          icon: FontAwesomeIcons.wineGlass,
                                          iconColor: orange,
                                          fontColor: textwhite,
                                          fontsize: 12.0)
                                      : Container(),
                                  SizedBox(
                                    width: size.width * 0.05,
                                  ),
                                  others.contains("Gym")
                                      ? textIconFunColumn(
                                          title: " Gym",
                                          icon: FontAwesomeIcons.dumbbell,
                                          iconColor: orange,
                                          fontColor: textwhite,
                                          fontsize: 12.0)
                                      : Container(),
                                  SizedBox(
                                    width: size.width * 0.05,
                                  ),
                                  others.contains("Hospital")
                                      ? textIconFunColumn(
                                          title: " Hospital",
                                          icon: FontAwesomeIcons.dumbbell,
                                          iconColor: orange,
                                          fontColor: textwhite,
                                          fontsize: 12.0)
                                      : Container()
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                      SizedBox(
                        height: size.height * 0.01,
                      ),
                      text(
                          title: "Details ",
                          fontsize: 14.0,
                          fontweight: FontWeight.bold,
                          color: textwhite),
                      SizedBox(
                        height: size.height * 0.01,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 5.0),
                        child: SingleChildScrollView(
                          child: Container(
                            height: height * 0.13,
                            width: width,
                            child: textStart(
                              title: txt,
                              //  if(title)
                              // title: flag
                              //     ? ("${firstHalf!}...")
                              //     : (firstHalf! + secondHalf!),
                              fontsize: 15.0,
                              fontweight: FontWeight.normal,
                              color: textwhite,
                            ),
                          ),
                        ),
                      ),
                
                
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          textButton(
                            text1: "Posted By",
                            text2: widget.indexPass['user']['name']
                                .toString()
                                .toUpperCase(),
                            // buttonTitle: "Call",
                            widgetpass: const Image(
                              image: AssetImage('assets/images/iconTop.png'),
                              height: 40,
                              width: 50,
                            ),
                          ),
                          textButton(
                            text1: "Date: ",
                            text2:
                                '/t ${widget.indexPass['user']['created_at']}'
                                    .substring(2, 13),
                            // buttonTitle: "Message",
                            widgetpass: const SizedBox(
                              height: 40,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: height * 0.02,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          InkWell(
                            onTap: () async {
                              await FlutterPhoneDirectCaller.callNumber(
                                  '$number');
                            },
                            child: button(
                              buttonTitle: "Call",
                              size: size,
                            ),
                          ),
                          InkWell(
                            onTap: () async {
                              await launchUrl(Uri.parse("sms:$number"));
                            },
                            child: button(
                              buttonTitle: "Message",
                              size: size,
                            ),
                          )
                        ],
                      )
                    ]),
                    
              ),
               SizedBox(
                        height: height * 0.03,
                      ),
            ]),
          )
        ]),
      ),
    );
  }
}

