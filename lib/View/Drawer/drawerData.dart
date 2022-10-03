import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rent_house/View/Admin/Setting/adminSetting.dart';
import 'package:rent_house/View/Setting/setting.dart';
import 'package:rent_house/View/Terms&Contact/aboutus.dart';
import 'package:rent_house/View/Terms&Contact/contact.dart';
import 'package:rent_house/config/color.dart';
import 'package:rent_house/splash.dart';
import 'package:rent_house/widgets/textIconFunRow.dart';
import 'package:rent_house/widgets/widgets.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../Terms&Contact/terms.dart';

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
    return ListView(children: [
      Column(
        children: [
          DrawerHeader(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    const Image(image: AssetImage('assets/images/iconTop.png')),
                    Padding(
                      padding: const EdgeInsets.only(top: 55, left: 3),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          text(
                              title: userName.toUpperCase(),
                              fontsize: 13.0,
                              color: orange,
                              fontweight: FontWeight.bold),
                          text(
                              title: userAddress.toUpperCase(),
                              fontsize: 11.0,
                              color: orange,
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
                          Get.to(const AboutUs());
                        },
                        child: IconTextFun(
                            title: "About Us",
                            icon: Icons.info_outline_rounded,
                            fontColor: textblack,
                            iconColor: orange),
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
                            fontColor: textblack,
                            iconColor: orange),
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
                            fontColor: textblack,
                            iconColor: orange),
                      ),
                    ],
                  )),
            ],
          ),
          Container(
            height: MediaQuery.of(context).size.height * 0.6,
            width: MediaQuery.of(context).size.width * 0.5,
            child: Column(children: [
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
                    fontColor: textblack,
                    iconColor: orange),
              ),
            ]),
          )
        ],
      ),
    ]);
  }
}
