import 'package:flutter/material.dart';
import 'package:rent_house/config/color.dart';
import 'package:rent_house/screens/Setting/setting.dart';
import 'package:rent_house/widgets/textIconFunRow.dart';
import 'package:rent_house/widgets/widgets.dart';

class DrawerData extends StatefulWidget {
  const DrawerData({Key? key}) : super(key: key);

  @override
  State<DrawerData> createState() => _DrawerDataState();
}

class _DrawerDataState extends State<DrawerData> {
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
                    const CircleAvatar(
                      backgroundColor: Colors.red,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 55, left: 3),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          text(
                              title: "Noman Hassan",
                              fontsize: 13.0,
                              color: orange,
                              fontweight: FontWeight.bold),
                          text(
                              title: "Laxumborg",
                              fontsize: 11.0,
                              color: orange,
                              fontweight: FontWeight.bold),
                        ],
                      ),
                    ),
                  ],
                ),
                const Padding(
                  padding: const EdgeInsets.only(bottom: 35.0),
                  child:
                   Icon(
                    Icons.close
                    ),
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
                      InkWell(
                        onTap: (){
                             Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>  Setting()),
                        );
                        },
                        child: IconTextFun(
                            title: "Account Setting",
                            icon: Icons.person,
                            fontColor: textblack,
                            iconColor: orange),
                      ),
                    const  SizedBox(
                        height: 30,
                      ),
                      IconTextFun(
                          title: "About Us",
                          icon: Icons.info_outline_rounded,
                          fontColor: textblack,
                          iconColor: orange),
                    const  SizedBox(
                        height: 30,
                      ),
                      IconTextFun(
                          title: "Contact Us",
                          icon: Icons.chat_bubble_outline_rounded,
                          fontColor: textblack,
                          iconColor: orange),
                    const  SizedBox(
                        height: 30,
                      ),
                      IconTextFun(
                          title: "Help",
                          icon: Icons.question_mark_rounded,
                          fontColor: textblack,
                          iconColor: orange),
                    const  SizedBox(
                        height: 30,
                      ),
                      IconTextFun(
                          title: "Terms & Conditions",
                          icon: Icons.person,
                          fontColor: textblack,
                          iconColor: orange),
                    ],
                  )),
            ],
          ),
          Container(
            height: MediaQuery.of(context).size.height * 0.6,
            width: MediaQuery.of(context).size.width * 0.5,
            child: Column(children: [
              IconTextFun(
                  title: "Log Out",
                  icon: Icons.logout_outlined,
                  fontColor: textblack,
                  iconColor: orange),
            ]),
          )
        ],
      ),
    ]);
  }
}
