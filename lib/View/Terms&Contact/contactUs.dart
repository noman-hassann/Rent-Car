import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:rent_house/Config/color.dart';
import 'package:rent_house/View/Navigation/navBar.dart';
import 'package:rent_house/widgets/widgets.dart';

class ContactUs extends StatefulWidget {
  const ContactUs({super.key});

  @override
  State<ContactUs> createState() => _ContactUsState();
}

class _ContactUsState extends State<ContactUs> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.only(top:8.0),
        child: Scaffold(
          body: Column(children: [
            Container(
          width: size.width*0.95,
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
                  backgroundColor: Color.fromARGB(255, 255, 255, 255),
                  child: IconButton(
                    icon: const Icon(
                      Icons.arrow_back,
                      size: 25,
                      color: blue,
                    ),
                    onPressed: () {
                      Get.to(Navbar());
                    },
                  ),
                ),
              ),
              text(
                  title: "Contact Us",
                  fontsize: 20.0,
                  fontweight: FontWeight.normal,
                  color: const Color.fromARGB(255, 15, 5, 5)),
              const Image(image: AssetImage('assets/images/logo.png'),height: 40,),
            ],
          ),
            ),
            SizedBox(
          height: size.height * 0.02,
            ),
            Center(
          /** Card Widget **/
          child: Card(
            elevation: 50,
            shadowColor: Colors.black,
            color: Colors.white,
            child: SizedBox(
              width: 300,
              height: 500,
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  children: const [
                    CircleAvatar(
                      backgroundColor: blue,
                      radius: 50,
                      child: CircleAvatar(
                          backgroundColor: Colors.white,
    
                          // backgroundImage: NetworkImage(
                          //     "https://media.geeksforgeeks.org/wp-content/uploads/20210101144014/gfglogo.png"), //NetworkImage
                          radius: 100,
                          child: Image(
                            image: AssetImage('assets/images/logo.png'),
                            height: 100,
                          )), //CircleAvatar
                    ), //CircleAvatar
    
                    SizedBox(
                      height: 10,
                    ), //SizedBox
                    Text(
                      'Contact us:  RentalCar  \nEmail Us: rentalcar@gmail.com \nPhone: +921234456678\nTweeter: @rentalCar ',
                      style: TextStyle(
                        letterSpacing: 0.2,
                        fontSize: 15,
                        color: Colors.black,
                        // overflow:TextOverflow.visible
                      ), //Textstyle
                    ), //Text
                    //SizedBox
                    //SizedBox
                  ],
                ), //Column
              ), //Padding
            ), //SizedBox
          ), //Card
            ), //
          ]),
        ),
      ),
    );
  }
}
