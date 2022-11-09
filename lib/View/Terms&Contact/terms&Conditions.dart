import 'package:flutter/material.dart';
import 'package:rent_house/Config/color.dart';
import 'package:rent_house/View/Navigation/navBar.dart';
import 'package:rent_house/widgets/widgets.dart';

class Terms extends StatefulWidget {
  const Terms({super.key});

  @override
  State<Terms> createState() => _TermsState();
}

class _TermsState extends State<Terms> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.only(top:8.0),
            child: Column(children: [
        Container(
            width: size.width*0.95,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
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
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Navbar()),
                    );
                  },
                ),
              ),
                ),
                text(
                title: "Terms and Conditions",
                fontsize: 20.0,
                fontweight: FontWeight.normal,
                color: const Color.fromARGB(255, 15, 5, 5)),
                const Image(image: AssetImage('assets/images/logo.png'),height:40),
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
            height: size.height * 0.8,
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: const [
                  CircleAvatar(
                    backgroundColor: blue,
                    radius: 50,
                    child: CircleAvatar(
                      backgroundColor: Colors.white,
                      // backgroundImage: AssetImage(
                      //   "assets/images/iconTop.png",
                      // ),

                      // backgroundImage: NetworkImage(
                      //     "https://media.geeksforgeeks.org/wp-content/uploads/20210101144014/gfglogo.png"), //NetworkImage
                      radius: 60,
                      child: Image(
                        image: AssetImage('assets/images/logo.png'),
                        height: 100,
                      )
                    ), //CircleAvatar
                  ), //CircleAvatar

                  SizedBox(
                    height: 1,
                  ), //SizedBoxF
                  Text(
                    '1.	You must register to be able to get Car for rent on the app. \n 2.	Car only go when we will receive full payment.\n3. We Would Not Allow to car for rent in case of unverified Account \n4.Incase of faroud serious action will taken againest the use. \n5.Read the terms and conditions carefully',
                    style: TextStyle(
                      letterSpacing: 0.2,
                      fontSize: 13,
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
          )),
    );
  }
}
