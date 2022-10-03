import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rent_house/Conrtoller/FavouriteApis/favouriteApis.dart';
import 'package:rent_house/Conrtoller/FavouriteApis/unfavourite.dart';
import 'package:rent_house/View/Favourite/favouriteDeatilView.dart';
import 'package:rent_house/config/color.dart';
import 'package:http/http.dart' as http;
import 'package:rent_house/widgets/icons.dart';
import 'package:rent_house/widgets/textIconFunColumn.dart';
import 'package:rent_house/widgets/textIconFunRow.dart';
import 'package:rent_house/widgets/widgets.dart';

class FavouriteView extends StatefulWidget {
  // final indexPass;
  // ignore: prefer_typing_uninitialized_variables
  final indexPass;
  const FavouriteView({Key? key, required this.indexPass}) : super(key: key);

  @override
  State<FavouriteView> createState() => _FavouriteViewState();
}

Map? mapResponse;
Map? dataResponce;

class _FavouriteViewState extends State<FavouriteView> {
  late bool favourite = widget.indexPass['posts']['isfavourite'] == true ? true : false;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    // print(widget.indexPass['isfavourite']);
    // print( widget.indexPass['posts']['isfavourite']['isfavourite']);

    // print(widget.indexPass['posts']['images'][0]['image_name']);
    return Scaffold(
        body: SafeArea(
            child: Column(
      //  alignment: Alignment.topCenter,
      children: [
        Material(
          shadowColor: const Color.fromARGB(255, 149, 148, 148),
          elevation: 4,
          borderRadius: const BorderRadius.all(Radius.circular(25)),
          child: SizedBox(
            height: size.height * 0.17,
            width: size.width * 1,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                InkWell(
                  onTap: () {
                    Get.to(FavouriteDetails(indexPass: widget.indexPass),
                        transition: Transition.rightToLeft,
                        duration: const Duration(milliseconds: 300));
                  },
                  child: Image.network(
                      //"https://aremorch.com/wp-content/uploads/2016/09/The-Details-That-Matter-Top-Things-Every-Luxury-Hotel-Room-Should-Have.png",
                      "https://denga.r3therapeutic.com/public${widget.indexPass['posts']['images'][0]['image_name']}",
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
                              title: widget.indexPass['posts']['title']
                                  .toString()
                                  .toUpperCase(),
                              fontsize: 12.0,
                              fontweight: FontWeight.bold,
                            ),
                            GestureDetector(
                              onTap: () {
                                if (favourite == true) {
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
                              child: iconFun(
                                  icon: favourite == true
                                      ? CupertinoIcons.heart_fill
                                      : CupertinoIcons.heart),
                            ),

                            // GestureDetector(
                            //   onTap: () {
                            //     if (favourite == true) {
                            //       setState(() {
                            //         favourite = false;
                            //         RemovefavouriteApis(
                            //             property_id: widget.indexPass['images']
                            //                 [0]['propert_id'],
                            //             context: context);
                            //       });
                            //     } else {
                            //       setState(() {
                            //         favourite = true;
                            //         favouriteApis(
                            //             property_id: widget.indexPass['images']
                            //                 [0]['propert_id'],
                            //             context: context);
                            //       });
                            //     }
                            //   },
                            //   child: iconFun(
                            //       icon: favourite == true
                            //           ? CupertinoIcons.heart_fill
                            //           : CupertinoIcons.heart),
                            // ),

                            //  const Icon(CupertinoIcons.heart),
                          ],
                        ),
                      ),
                      textIconFunRow(
                          title: widget.indexPass['posts']['address']
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
                        title: widget.indexPass['posts']['price']
                            .toString()
                            .toUpperCase(),
                        icon: Icons.money,
                        iconSize: 20.0,
                        fontsize: 12.0,
                        fontColor: textwhite,
                        iconColor: orange,
                      ),
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
                                      'Bed ${widget.indexPass['posts']['bedrooms']}',
                                  icon: CupertinoIcons.bed_double_fill,
                                  iconColor: orange,
                                  fontColor: textwhite,
                                  fontsize: 12.0),
                              textIconFunColumn(
                                  title:
                                      'Bath ${widget.indexPass['posts']['bathrooms']}',
                                  icon: Icons.bathtub_outlined,
                                  iconColor: orange,
                                  fontColor: textwhite,
                                  fontsize: 12.0),
                              textIconFunColumn(
                                  title:
                                      'Parking ${widget.indexPass['posts']['parking']}',
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
