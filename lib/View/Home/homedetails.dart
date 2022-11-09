// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';

import 'package:rent_house/View/Services/Slider.dart';
import 'package:rent_house/widgets/widgets.dart';

import '../../Config/color.dart';

class HomeDetail extends StatefulWidget {
  const HomeDetail({
    super.key,
  });

  @override
  State<HomeDetail> createState() => _HomeDetailtate();
}

class _HomeDetailtate extends State<HomeDetail> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Stack(children: [
          SingleChildScrollView(
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
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
                        color: black,
                        size: 30,
                      ),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 18.0),
                child: Column(
                  children: [
                    text(
                        title: "Camoro",
                        fontsize: 30.0,
                        fontweight: FontWeight.bold),
                    text(
                        title: "by Toyota",
                        fontsize: 25.0,
                        fontweight: FontWeight.normal,
                        color: black.withOpacity(0.4)),
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Stack(children: [
                Positioned(
                  top: 0,
                  child: AnimationSlider(),
                  height: height * 0.4,
                  width: width,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    //Drawer opening and topbar widgets

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
                        ),
                      ),
                    ),
                  ],
                ),
              ]),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                      height: size.height * 0.13,
                      width: size.width * 0.3,
                      decoration: BoxDecoration(
                          border: Border.all(
                            color: black.withOpacity(0.3),
                          ),
                          borderRadius:
                              const BorderRadius.all(Radius.circular(20))),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          text(
                              title: '1 Day',
                              fontsize: 12.0,
                              fontweight: FontWeight.bold),
                          text(
                              title: '12000 ',
                              fontsize: 15.0,
                              fontweight: FontWeight.bold),
                          text(
                              title: 'PKR ',
                              fontsize: 12.0,
                              fontweight: FontWeight.normal)
                        ],
                      )),
                  Container(
                      height: size.height * 0.13,
                      width: size.width * 0.3,
                      decoration: BoxDecoration(
                          border: Border.all(
                            color: black.withOpacity(0.3),
                          ),
                          borderRadius:
                              const BorderRadius.all(Radius.circular(20))),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          text(
                              title: '1 Month',
                              fontsize: 12.0,
                              fontweight: FontWeight.bold),
                          text(
                              title: '12000 ',
                              fontsize: 15.0,
                              fontweight: FontWeight.bold),
                          text(
                              title: 'PKR ',
                              fontsize: 12.0,
                              fontweight: FontWeight.normal)
                        ],
                      )),
                  Container(
                      height: size.height * 0.13,
                      width: size.width * 0.3,
                      decoration: BoxDecoration(
                          border: Border.all(
                            color: black.withOpacity(0.3),
                          ),
                          borderRadius:
                              const BorderRadius.all(Radius.circular(20))),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          text(
                              title: '1 Year',
                              fontsize: 12.0,
                              fontweight: FontWeight.bold),
                          text(
                              title: '12000 ',
                              fontsize: 15.0,
                              fontweight: FontWeight.bold),
                          text(
                              title: 'PKR ',
                              fontsize: 12.0,
                              fontweight: FontWeight.normal)
                        ],
                      )),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(left: 18.0, top: 30),
                child: text(
                    title: "Specifications ",
                    fontsize: 25.0,
                    fontweight: FontWeight.normal,
                    color: black.withOpacity(0.4)),
              ),
              SizedBox(
                height: 100,
                child: GridView.builder(
                    physics: const ScrollPhysics(),
                    shrinkWrap: true,
                    primary: false,
                    itemCount: 5,
                    scrollDirection: Axis.horizontal,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      // mainAxisSpacing: 2.0,
                      crossAxisSpacing: 1.0,
                      mainAxisExtent: 140,
                      crossAxisCount: 1,
                    ),
                    itemBuilder: (BuildContext context, int index) {
                      return (Row(
                        children: [
                          Container(
                            height: size.height * 0.1,
                            width: size.width * 0.35,
                            decoration: BoxDecoration(
                                border: Border.all(
                                  color: black.withOpacity(0.3),
                                ),
                                borderRadius: const BorderRadius.all(
                                    Radius.circular(20))),
                            child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  text(
                                      title: "Color",
                                      color: black.withOpacity(0.3),
                                      fontsize: 14.0,
                                      fontweight: FontWeight.normal),
                                  text(
                                      title: "Color",
                                      color: black,
                                      fontsize: 14.0,
                                      fontweight: FontWeight.bold)
                                ]),
                          ),
                        ],
                      ));
                    }),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 38.0),
                child: Container(
                    height: size.height * 0.1,
                    width: size.width * 0.8,
                    decoration: BoxDecoration(
                        border: Border.all(color: blue),
                        color: blue,
                        borderRadius:
                            const BorderRadius.all(Radius.circular(10))),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            text(
                                title: "Book Now",
                                fontsize: 20.0,
                                fontweight: FontWeight.bold,
                                color: Colors.white),
                          ],
                        ),
                        const Icon(
                          Icons.arrow_forward_ios_rounded,
                          color: Colors.white,
                        )
                      ],
                    )),
              ),
            ]),
          ),
        ]),
      ),
    );
  }
}
