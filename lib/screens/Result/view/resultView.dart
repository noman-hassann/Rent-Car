import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rent_house/config/color.dart';
import 'package:rent_house/screens/Result/model/resultModelClass.dart';
import 'package:rent_house/widgets/textIconFunColumn.dart';
import 'package:rent_house/widgets/textIconFunRow.dart';
import 'package:rent_house/widgets/widgets.dart';

class ResultView extends StatelessWidget {
  final HotelSearchResult indexPass;
  const ResultView({Key? key, required this.indexPass}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
        body: SafeArea(
            child: Column(
      //  alignment: Alignment.topCenter,
      children: [
        Material(
          shadowColor: const Color.fromARGB(255, 149, 148, 148),
          elevation: 4,
          borderRadius: const BorderRadius.all(Radius.circular(25)),
          child: Container(
            height: size.height * 0.17,
            width: size.width * 1,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Image.asset(
                  'assets/' + indexPass.image1,
                ),
              const  SizedBox(
                  width: 20,
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 12.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                       const   SizedBox(
                            height: 10,
                          ),
                          text(
                            title: "Studio Apartment",
                            fontsize: 12.0,
                            fontweight: FontWeight.normal,
                          ),
                        const  SizedBox(
                            width: 70,
                          ),
                          Icon(CupertinoIcons.heart),
                          
                        ],
                      ),
                      textIconFunRow(
                          title: "Kingdom Tower,Brazil",
                          icon: Icons.location_on,
                          iconSize:14.0,
                          fontsize: 12.0,
                          fontColor: textwhite,
                          iconColor: Colors.black),
                   const   SizedBox(
                        height: 10,
                      ),
                      textIconFunRow(
                          title: "1900",
                          icon: CupertinoIcons.money_dollar,
                          iconSize:20.0,
                          fontsize: 12.0,
                          fontColor: orange,
                          iconColor: orange),
                    const  SizedBox(
                        height: 5,
                      ),
                      Container(
                        width: size.width*0.45,
                       // color: Colors.amber,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
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
    )));
  }
}
