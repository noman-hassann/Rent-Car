import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:rent_house/widgets/widgets.dart';

import '../../Config/color.dart';
import '../Drawer/drawerData.dart';
import '../Explore/Explore.dart';
import 'homeView.dart';

class Home extends StatefulWidget {
  const Home({super.key});
  @override
  State<Home> createState() => _HomeState();
}

final GlobalKey<_HomeState> _myWidgetState = GlobalKey<_HomeState>();

class _HomeState extends State<Home> {
  @override
  void initState() {
    // listItem = _hotelRoom();
    super.initState();
  }

  GlobalKey<ScaffoldState> _scaffoldkey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    List? _users = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        //  backgroundColor: Colors.white,
        key: _scaffoldkey,
        drawer: Container(
            width: size.width * 0.6,
            child: const Drawer(child: DrawerData())),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(top:8.0),
            child: Center(
              child: Container(
                width: MediaQuery.of(context).size.width * 0.95,
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: size.height * 0.010),
                      Padding(
                        padding: const EdgeInsets.only(left:8.0,),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              decoration: const BoxDecoration(
                                boxShadow: [
                                  BoxShadow(
                                    color: Color.fromARGB(255, 214, 210, 210),
                                    offset: Offset(1.0, 1.0),
                                    blurRadius: 9.0,
                                  ),
                                ],
                              ),
                              child: CircleAvatar(
                                backgroundColor:
                                    Color.fromARGB(255, 255, 255, 255),
                                child: IconButton(
                                  icon: const Icon(
                                    Icons.menu,
                                    size: 25,
                                    color: blue,
                                  ),
                                  onPressed: () {
                                    _scaffoldkey.currentState!.openDrawer();
                                  },
                                ),
                              ),
                            ),
                            text(
                                title: "Car Rental System",
                                fontsize: 20.0,
                                fontweight: FontWeight.bold,
                                color: const Color.fromARGB(255, 15, 5, 5)),
                           Container()
                            // const Image(
                            //     image: AssetImage('assets/images/iconTop.png')),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 38.0),
                        child: Container(
                            height: size.height * 0.1,
                            width: size.width * 0.8,
                            decoration: BoxDecoration(
                                border: Border.all(color: Colors.red),
                                color: Colors.red,
                                borderRadius: const BorderRadius.all(
                                    Radius.circular(10))),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    text(
                                        title: "Please Verify You Account",
                                        fontsize: 20.0,
                                        fontweight: FontWeight.bold,
                                        color: Colors.white),
                                    Padding(
                                      padding:
                                          const EdgeInsets.only(left: 20.0),
                                      child: text(
                                          title: "click to see verification process",
                                          fontsize: 12.0,
                                          fontweight: FontWeight.normal,
                                          color: Colors.white),
                                    ),
                                  ],
                                ),
                                InkWell(
                                  onTap: () {
                                    Get.to(Explore());
                                  },
                                  child: const Icon(
                                    Icons.arrow_forward_ios_rounded,
                                    color: Colors.white,
                                  ),
                                )
                              ],
                            )),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 20.0, bottom: 5),
                        child: text(
                            title: "Top Deals",
                            fontsize: 20.0,
                            fontweight: FontWeight.bold),
                      ),
                      SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: 200,
                              child: _users == null
                                  ? const Center(
                                      child: CircularProgressIndicator())
                                  : GridView.builder(
                                      physics: const ScrollPhysics(),
                                      shrinkWrap: true,
                                      primary: false,
                                      itemCount: 5,
                                      scrollDirection: Axis.horizontal,
                                      gridDelegate:
                                          const SliverGridDelegateWithFixedCrossAxisCount(
                                        // mainAxisSpacing: 2.0,
                                        crossAxisSpacing: 1.0,
                                        mainAxisExtent: 170,
                                        crossAxisCount: 1,
                                      ),
                                      itemBuilder:
                                          (BuildContext context, int index) {
                                        return (RentailView(
                                            indexPass: _users[index]));
                                      }),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.only(left: 20.0, bottom: 5),
                              child: text(
                                  title: "Top Cars",
                                  fontsize: 20.0,
                                  fontweight: FontWeight.bold),
                            ),
                            SizedBox(
                              height: 400,
                              child: _users == null
                                  ? const Center(
                                      child: CircularProgressIndicator())
                                  : GridView.builder(
                                      physics: const ScrollPhysics(),
                                      scrollDirection: Axis.vertical,
                                      shrinkWrap: true,
                                      primary: false,
                                      itemCount: 10,
                                      gridDelegate:
                                          const SliverGridDelegateWithMaxCrossAxisExtent(
                                        mainAxisSpacing: 1.0,
                                        crossAxisSpacing: 1.0,
                                        // childAspectRatio: 12.0,
                                        mainAxisExtent: 200,
                                        maxCrossAxisExtent: 200,
                                      ),
                                      itemBuilder:
                                          (BuildContext context, int index) {
                                        return (RentailView(
                                            indexPass: _users[index]));
                                      }),
                            )
                          ],
                        ),
                      ),
                    ]),
              ),
            ),
          ),
        ));
  }
}
