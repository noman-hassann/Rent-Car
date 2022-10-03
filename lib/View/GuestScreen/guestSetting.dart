import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:rent_house/View/GuestScreen/guestNavbar.dart';
import 'package:rent_house/View/Navigation/navBar.dart';
import 'package:rent_house/widgets/widgets.dart';

import '../../Config/color.dart';
import '../../widgets/rowButton.dart';
import '../LoginSignUp/View/login.dart';

class GuestSetting extends StatefulWidget {
  const GuestSetting({super.key});

  @override
  State<GuestSetting> createState() => _GuestSettingState();
}

class _GuestSettingState extends State<GuestSetting> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Column(
      children: [
        Container(
          width: size.width*0.97,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
                  backgroundColor: Color.fromARGB(255, 255, 255, 255),
                  child: IconButton(
                    icon: const Icon(
                      Icons.arrow_back,
                      size: 25,
                      color: orange,
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const GuestNavbar()),
                      );
                    },
                  ),
                ),
              ),
             Container(
              width: size.width*0.55,
             ),
              const Image(image: AssetImage('assets/images/iconTop.png')),
            ],
          ),
        ),
        SizedBox(height: size.height*0.25,),
        text(
            title: "Please login to access more features",
            fontsize: 15.0,
            fontweight: FontWeight.bold),
        SizedBox(height: size.height * 0.042),
        Center(
            child: rowButtonFun(
                backgroundcolor: orange,
                title1: "Login",
                height: size.height * 0.04,
                width: size.width * 0.43,
                textColor: Color.fromARGB(255, 255, 255, 255),
                ontap: () {
                  Get.to(LoginScreen());
                }))
      ],
    );
  }
}
