import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:rent_house/View/Home/homedetails.dart';

import 'package:rent_house/widgets/widgets.dart';


class RentailView extends StatelessWidget {
  // ignore: prefer_typing_uninitialized_variables
  final indexPass;
  const RentailView({Key? key, required this.indexPass}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    // var image = indexPass['images'];

    return Scaffold(
        body: SafeArea(
            child: InkWell(
      onTap: () {
        Get.to(HomeDetail(),
            transition: Transition.rightToLeft,
            duration: const Duration(milliseconds: 300));
      },
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
                  height: size.height * 0.25,
                  width: size.width * 0.45,
                  child: Padding(
                    padding: const EdgeInsets.only(),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Stack(
                            alignment: Alignment.topRight,
                            children: [

                              ClipRRect(
                                borderRadius: const BorderRadius.only(
                                    topLeft: Radius.circular(25),
                                    topRight: Radius.circular(25)),
                                child: Image.network(
                                    // "https://denga.r3therapeutic.com/public${image[0]['image_name']}",
                                    "https://imgd.aeplcdn.com/1056x594/n/cw/ec/123185/grand-vitara-exterior-right-front-three-quarter-2.jpeg?isig=0&q=75&wm=1",
                                    width: size.width * 1,
                                    height: 200,
                                    fit: BoxFit.fill),
                              ),
                              const Padding (
                                padding:  EdgeInsets.only(top:8.0,right:8),
                                child: Icon(CupertinoIcons.heart),
                              )
                            ],
                          ),
                        ),
                        SizedBox(
                          height: size.height * 0.01,
                        ),
                        Padding(
                          padding:
                              const EdgeInsets.only(left: 10.0, bottom: 10),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              text(
                                title: "Discover",
                                fontsize: 12.0,
                                fontweight: FontWeight.normal,
                              ),
                              text(
                                title: "Land Rover",
                                fontsize: 15.0,
                                fontweight: FontWeight.bold,
                              ),
                               text(
                                title: "Per Week",
                                fontsize: 12.0,
                                fontweight: FontWeight.normal,
                                color: Color.fromARGB(255, 69, 68, 68)
                              ),
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
          )),
    )));
  }
}
