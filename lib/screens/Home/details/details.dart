import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:rent_house/config/color.dart';
import 'package:rent_house/widgets/textButton.dart';
import 'package:rent_house/widgets/textIconFunColumn.dart';
import 'package:rent_house/widgets/widgets.dart';

class Detail extends StatefulWidget {
  const Detail({super.key});

  @override
  State<Detail> createState() => _DetailState();
}

class _DetailState extends State<Detail> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        body: Stack(children: [
          Column(children: [
            Stack(children: [
              Positioned(
                child: Image.asset(
                  "assets/images/details.png",
                ),
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
                    height: size.height * 0.46,
                  ),
                  Transform.rotate(
                    angle: -0.5,
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
                ],
              ),
            ]),
            Container(
              width: size.width * 0.9,
              alignment: Alignment.topRight,
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    text(
                        title: "Studio Appartment",
                        fontsize: 19.0,
                        fontweight: FontWeight.bold),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        text(
                            title: "Sector 150, Pusta Road, Brazil",
                            fontsize: 14.0,
                            fontweight: FontWeight.normal),
                        text(
                            title: "2500Sq.Ft",
                            fontsize: 14.0,
                            fontweight: FontWeight.bold,
                            color: orange),
                      ],
                    ),
                    SizedBox(
                      height: size.height * 0.004,
                    ),
                    text(
                        title: "Neighbourhood: Chinsapo",
                        fontsize: 14.0,
                        fontweight: FontWeight.normal,
                        color: textwhite),
                    SizedBox(
                      height: size.height * 0.004,
                    ),
                    SizedBox(
                      height: size.height * 0.007,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        textIconFunColumn(
                            title: "3 Beds",
                            icon: CupertinoIcons.bed_double_fill,
                            iconColor: orange,
                            fontColor: textwhite,
                            fontsize: 12.0),
                        textIconFunColumn(
                            title: "2 Bath",
                            icon: Icons.bathtub_outlined,
                            iconColor: orange,
                            fontColor: textwhite,
                            fontsize: 12.0),
                        textIconFunColumn(
                            title: "1 Parking",
                            icon: CupertinoIcons.car_detailed,
                            iconColor: orange,
                            fontColor: textwhite,
                            fontsize: 12.0),
                        textIconFunColumn(
                            title: "Near Bar",
                            icon: FontAwesomeIcons.wineGlass,
                            iconColor: orange,
                            fontColor: textwhite,
                            fontsize: 12.0),
                        textIconFunColumn(
                            title: "Gym",
                            icon: FontAwesomeIcons.dumbbell,
                            iconColor: orange,
                            fontColor: textwhite,
                            fontsize: 12.0),
                        textIconFunColumn(
                            title: "Hospital",
                            icon: FontAwesomeIcons.hospital,
                            iconColor: orange,
                            fontColor: textwhite,
                            fontsize: 12.0),
                      ],
                    ),
                    SizedBox(
                      height: size.height * 0.007,
                    ),
                    textStart(
                        title:
                            "ATS Pious Hideaways is a new premium housing project situated at Sector 150 Noida near Noida Expressway. The elegant roject is developed by ATS Advertiser who is very trustworthy and promising Advertiser in Brazil.",
                        fontsize: 12.0,
                        fontweight: FontWeight.normal),
                    SizedBox(
                      height: size.height * 0.01,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        textButton(
                          text1: "Posted By",
                          text2: "Owner",
                          buttonTitle: "Call",

                          widgetpass:const  Image(
                              image: AssetImage('assets/images/iconTop.png'),height:40,width: 50,),
                        ),
                        
                        textButton(
                            text1: "Date:",
                            text2: "22 Feb,2022 ",
                            buttonTitle: "Message",
                            widgetpass:const SizedBox(height: 40,),
                           ),
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
