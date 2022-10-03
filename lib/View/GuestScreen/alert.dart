import 'package:dropdown_button2/custom_dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:rent_house/View/LoginSignUp/View/login.dart';
import 'package:rent_house/widgets/widgets.dart';

import '../../Config/color.dart';
import '../../widgets/rowButton.dart';

class AlertClick extends StatefulWidget {
  // final Function callbackFunction;
  // required this.callbackFunction,
  AlertClick({
    Key? key,
  }) : super(key: key);
  @override
  State<StatefulWidget> createState() => AlertClickState();
}

class AlertClickState extends State<AlertClick>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation<double> scaleAnimation;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 450));
    scaleAnimation = CurvedAnimation(parent: controller, curve: Curves.easeIn);
    controller.addListener(() {
      setState(() {});
    });

    controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Center(
      child: Material(
        color: Colors.transparent,
        child: ScaleTransition(
          alignment: Alignment.center,
          scale: scaleAnimation,
          child: Container(
            // margin: const EdgeInsets.all(20.0),
            padding: const EdgeInsets.all(15.0),
            height: MediaQuery.of(context).size.width * 0.5,
            width: MediaQuery.of(context).size.width * 0.8,
            decoration: ShapeDecoration(
                color: Colors.white,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0))),
            child: Column(children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  text(
                      title: "Alert",
                      fontsize: 20.0,
                      fontweight: FontWeight.normal),
                  InkWell(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Icon(Icons.cancel_outlined)),
                ],
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.02,
              ),
              // property type
              text(title: "Please login to access these features"),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.05,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  rowButtonFun(
                      backgroundcolor: orange,
                      title1: "Login",
                      height: size.height * 0.04,
                      width: size.width * 0.3,
                      textColor: Color.fromARGB(255, 255, 255, 255),
                      ontap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>  LoginScreen()),
                        );
                      }),
                  SizedBox(
                    width: size.width * 0.02,
                  ),
                  rowButtonFun(
                      backgroundcolor: Colors.red,
                      title1: "Cancel",
                      height: size.height * 0.04,
                      width: size.width * 0.3,
                      textColor: Color.fromARGB(255, 255, 255, 255),
                      ontap: () {
                        setState(() {
                          // ScaffoldMessenger.of(context).clearSnackBars();
                          Navigator.pop(context);
                        });
                      }),
                ],
              ),
            ]),
          ),
        ),
      ),
    );
  }
}
