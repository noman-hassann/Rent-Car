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
                  color: orange,
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
              const Image(image: AssetImage('assets/images/iconTop.png')),
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
                  backgroundColor: orange,
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
                      image: AssetImage('assets/images/iconTop.png'),
                      height: 100,
                    )
                  ), //CircleAvatar
                ), //CircleAvatar

                SizedBox(
                  height: 1,
                ), //SizedBoxF
                Text(
                  '1.	You must register to be able to list your property on the app. \n 2.	Your post will only go live once payment has been cleared. \n 3.	No duplicate posts are allowed. If found, they will be removed and you will not be issued a refund. \n4. We do not condone any offensive posts and if found in violation, your listing will be removed and you risk being banned from using the app to list your property. \n5.	Management reserves the right to refuse service to those suspected of fraudulent behaviour.\n 6.	Denga aims to maintain high standards for the app and expects all users to comply.\n 7.	We do not charge commission to agents or private listers. Fees are flat and final at the point of listing.\n 8.	We observe zero tolerance on discrimination and if we believe your listing violates this, it will be removed.\n 9.	You are not allowed to post promotional material of your agency or your business. All listings should be related to the selling or renting out of property is the specified categories only.\n 10.	Terms and conditions can be amended at any point.',
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
      ])),
    );
  }
}
