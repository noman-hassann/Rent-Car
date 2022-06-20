import 'package:flutter/material.dart';
import 'package:rent_house/Screens/Model/homeData.dart';
import 'package:rent_house/config/color.dart';
import 'package:rent_house/widgets/colorText.dart';
import 'package:rent_house/widgets/textIconFunRow.dart';
import 'package:rent_house/widgets/widgets.dart';

class HotelRoomView extends StatelessWidget {
  final HotelRoom indexPass;
  const HotelRoomView({Key? key, required this.indexPass}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
        body: SafeArea(
            child: Container(
                width: size.width * 0.95,
                // color: Colors.amber,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  //  alignment: Alignment.topCenter,
                  children: [
                    Material(
                      shadowColor: const Color.fromARGB(255, 149, 148, 148),
                      elevation: 4,
                      borderRadius: const BorderRadius.all(Radius.circular(25)),
                      child: Container(
                        alignment: Alignment.centerLeft,
                        height: size.height * 0.3,
                        width: size.width * 0.45,
                        // decoration: BoxDecoration(
                        //   border: Border.all(
                        //     color: Color.fromARGB(255, 120, 117, 117)
                        //         .withOpacity(0.1),
                        //   ),
                        //   boxShadow: [
                        //     BoxShadow(
                        //       color: Color.fromARGB(255, 189, 189, 189)
                        //           .withOpacity(0.1),
                        //       offset: Offset(5.0, 4.0),
                        //       blurRadius: 5.0,
                        //     ),
                        //   ],
                        // ),

                        child: Padding(
                          padding: const EdgeInsets.only(),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                child: Image.asset(
                                  'assets/' + indexPass.image1,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                    left: 10.0, bottom: 10),
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    text(
                                      title: "Studio Apartment",
                                      fontsize: 12.0,
                                      fontweight: FontWeight.normal,
                                    ),
                                    Center(
                                      child: textIconFunRow(
                                          title: "Kingdom Tower,Brazil",
                                          icon: Icons.location_on,
                                          fontsize: 12.0,
                                          fontColor: textwhite,
                                          iconColor: Colors.black),
                                    ),
                                    colorText(
                                        title1: "Price:",
                                        t1Color: textwhite,
                                        title2: "180/ Month",
                                        t2Color: orange,
                                        fontsize: 10.0),
                                    colorText(
                                        title1: "Neighbourhood:",
                                        t1Color: textwhite,
                                        title2: "Chinsapo",
                                        t2Color: orange,
                                        fontsize: 10.0),
                                    colorText(
                                        title1: "Bedroom:",
                                        t1Color: textwhite,
                                        title2: "3",
                                        t2Color: orange,
                                        fontsize: 10.0),
                                    colorText(
                                        title1: "Date:",
                                        t1Color: textwhite,
                                        title2: "March 14,2022",
                                        t2Color: orange,
                                        fontsize: 10.0),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                  ],
                ))));
  }
}
