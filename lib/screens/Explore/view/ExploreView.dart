import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rent_house/config/color.dart';
import 'package:rent_house/screens/Explore/model/ExploreModelClass.dart';
import 'package:rent_house/screens/Home/details/details.dart';
import 'package:rent_house/widgets/textIconFunColumn.dart';
import 'package:rent_house/widgets/textIconFunRow.dart';
import 'package:rent_house/widgets/widgets.dart';

class ExploreView extends StatelessWidget {
  final indexPass;
  const ExploreView({Key? key, required this.indexPass}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
 print(indexPass['images']['image']);
    return Scaffold(
        body: SafeArea(
            child: Column(
      //  alignment: Alignment.topCenter,
      children: [
        Material(
          shadowColor: const Color.fromARGB(255, 149, 148, 148),
          elevation: 4,
          borderRadius: const BorderRadius.all(Radius.circular(25)),
          child: InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Detail()),
              );
            },
            child: Container(
              height: size.height * 0.17,
              width: size.width * 1,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  
                  Image.network(
                      "https://aremorch.com/wp-content/uploads/2016/09/The-Details-That-Matter-Top-Things-Every-Luxury-Hotel-Room-Should-Have.png",
                      width: size.width * 0.3,
                      height: 150,
                      fit: BoxFit.fill),
                   
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
                        Container(
                          width: size.width * 0.5,
                         // color: Colors.amber,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              text(
                                title:
                                    indexPass['title'].toString().toUpperCase(),
                                fontsize: 12.0,
                                fontweight: FontWeight.bold,
                              ),
                            
                              const Icon(CupertinoIcons.heart),
                            ],
                          ),
                        ),
                        textIconFunRow(
                            title:
                                indexPass['address'].toString().toUpperCase(),
                            icon: Icons.location_on,
                            iconSize: 14.0,
                            fontsize: 12.0,
                            fontColor: textwhite,
                            iconColor: orange),
                        const SizedBox(
                          height: 10,
                        ),
                        textIconFunRow(
                            title: indexPass['price'].toString().toUpperCase(),
                            icon: CupertinoIcons.money_dollar,
                            iconSize: 20.0,
                            fontsize: 12.0,
                            fontColor: textwhite,
                            iconColor: orange),
                        const SizedBox(
                          height: 5,
                        ),
                        Container(
                            width: size.width * 0.45,
                            // color: Colors.amber,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                textIconFunColumn(
                                    title: 'Bed ${indexPass['bedrooms']}',
                                    icon: CupertinoIcons.bed_double_fill,
                                    iconColor: orange,
                                    fontColor: textwhite,
                                    fontsize: 12.0),
                                textIconFunColumn(
                                    title: 'Bath ${indexPass['bathrooms']}',
                                    icon: Icons.bathtub_outlined,
                                    iconColor: orange,
                                    fontColor: textwhite,
                                    fontsize: 12.0),
                                textIconFunColumn(
                                    title: 'Parking ${indexPass['parking']}',
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
        ),
        const SizedBox(
          height: 10,
        ),
      ],
    )));
  }
}
