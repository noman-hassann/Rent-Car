import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rent_house/Config/color.dart';
import 'package:rent_house/splash.dart';
import 'package:rent_house/widgets/textIconFunRow.dart';
import 'package:rent_house/widgets/widgets.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../Terms&Contact/aboutUs.dart';
import '../Terms&Contact/contactUs.dart';
import '../Terms&Contact/terms&Conditions.dart';

class DrawerData extends StatefulWidget {
  const DrawerData({Key? key}) : super(key: key);

  @override
  State<DrawerData> createState() => _DrawerDataState();
}

class _DrawerDataState extends State<DrawerData> {
  void initState() {
    getData();
    super.initState();
    print({userName, userAddress, userContact});
  }

  String userName = "";
  String userAddress = "";
  String userContact = "";

  getData() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    setState(() {
      userName = pref.getString(
        "_name",
      )!;
      userAddress = pref.getString(
        "_address",
      )!;
      userContact = pref.getString(
        "_contact",
      )!;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Column(
        children: [
          DrawerHeader(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    const Image(
                      image: AssetImage('assets/images/logo.png'),
                      height: 50,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 55, left: 3),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          text(
                              title: userName.toUpperCase(),
                              fontsize: 13.0,
                              color: black,
                              fontweight: FontWeight.bold),
                          text(
                              title: userAddress.toUpperCase(),
                              fontsize: 11.0,
                              color: black,
                              fontweight: FontWeight.bold),
                        ],
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 35.0),
                  child: InkWell(
                      onTap: () {
                        Get.back();
                      },
                      child: const Icon(Icons.close)),
                ),
              ],
            ),
          ),
          Column(
            children: [
              Container(
                  //  alignment: Alignment.topLeft,
                  //  color: Colors.amber,
                  height: MediaQuery.of(context).size.height * 0.6,
                  width: MediaQuery.of(context).size.width * 0.5,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: 30,
                      ),
                      InkWell(
                        onTap: () {
                          Get.to(AboutUs());
                        },
                        child: IconTextFun(
                            title: "About Us",
                            icon: Icons.info_outline_rounded,
                            fontColor: black,
                            iconColor: blue),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      InkWell(
                        onTap: () {
                          Get.to(ContactUs());
                        },
                        child: IconTextFun(
                            title: "Contact Us",
                            icon: Icons.chat_bubble_outline_rounded,
                            fontColor: black,
                            iconColor: blue),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      InkWell(
                        onTap: () {
                          Get.to(const Terms());
                        },
                        child: IconTextFun(
                            title: "Terms & Conditions",
                            icon: Icons.person,
                            fontColor: black,
                            iconColor: blue),
                      ),

                      SizedBox(height: 40,),
                      InkWell(
                        onTap: () async {
                          SharedPreferences preferences =
                              await SharedPreferences.getInstance();
                          await preferences.clear();
                          Get.to(SplashView());
                        },
                        child: IconTextFun(
                            title: "Log Out",
                            icon: Icons.logout_outlined,
                            fontColor: black,
                            iconColor: blue),
                      ),
                    ],
                  )),
            ],
          ),
        ],
      ),
    ]);
  }
}
