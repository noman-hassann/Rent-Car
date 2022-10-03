// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:rent_house/View/Services/Slider.dart';
import 'package:rent_house/config/color.dart';
import 'package:rent_house/widgets/textButton.dart';
import 'package:rent_house/widgets/textIconFunColumn.dart';
import 'package:rent_house/widgets/widgets.dart';

class AdminDetails extends StatefulWidget {
  final indexPass;
   AdminDetails({super.key, required this.indexPass});

  @override
  State<AdminDetails> createState() => _AdminDetailstate();
}

class _AdminDetailstate extends State<AdminDetails> {
  String? firstHalf;
  String? secondHalf;
  String? txt;

  bool flag = true;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var image = widget.indexPass['images'];
    String others = widget.indexPass['others'];
    print(others);

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
          Column(children: [
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
                    child: Padding(
                      padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 3.0),
                            child: IconButton(
                              icon: const Icon(
                                Icons.arrow_back,
                                color: Colors.white,
                                size: 30,
                              ),
                              onPressed: () {
                                Navigator.pop(context);
                              },
                            ),
                          ),
                          Container(
                              child: Row(
                            children: [
                              Padding(
                                padding:
                                    const EdgeInsets.only(right: 15.0, top: 3),
                                child: IconButton(
                                  icon: const Icon(
                                    CupertinoIcons.heart,
                                    color: Colors.white,
                                    size: 30,
                                  ),
                                  onPressed: () {},
                                ),
                              ),
                              IconButton(
                                icon: const Icon(
                                  Icons.ios_share_rounded,
                                  color: Colors.white,
                                  size: 30,
                                ),
                                onPressed: () {},
                              ),
                            ],
                          ))
                        ],
                      ),
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
                            backgroundColor: Color.fromARGB(255, 235, 233, 233),
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
                        title:
                            widget.indexPass['title'].toString().toUpperCase(),
                        fontsize: 19.0,
                        fontweight: FontWeight.bold),
                    SizedBox(height: height * 0.01),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        text(
                            title: widget.indexPass['title']
                                .toString()
                                .toUpperCase(),
                            fontsize: 14.0,
                            fontweight: FontWeight.normal,
                            color: textwhite),
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
                    Padding(
                      padding: const EdgeInsets.only(left:5.0),
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
                          height: size.height*0.06,
                          
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
                      padding: const EdgeInsets.only(left:5.0),
                      child: Container(
                        height: height*0.13,
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
                          text2: '/t ${widget.indexPass['user']['created_at']}'
                              .substring(2, 13),
                          // buttonTitle: "Message",
                          widgetpass: const SizedBox(
                            height: 40,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        button(
                          buttonTitle: "Call",
                          size: size,
                        ),
                        button(
                          buttonTitle: "Message",
                          size: size,
                        )
                      ],
                    )
                  ]),
            ),
          ])
        ]),
      ),
    );
  }
}
