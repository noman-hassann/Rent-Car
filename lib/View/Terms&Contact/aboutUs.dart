import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:rent_house/Config/color.dart';
import 'package:rent_house/View/Navigation/navBar.dart';
import 'package:rent_house/widgets/widgets.dart';

class AboutUs extends StatefulWidget {
  const AboutUs({super.key});

  @override
  State<AboutUs> createState() => _AboutUsState();
}

class _AboutUsState extends State<AboutUs> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
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
                    color: orange,
                  ),
                  onPressed: () {
                    Get.to(Navbar());
                  },
                ),
              ),
            ),
            text(
                title: "About Us",
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
            height: 500,
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: const [
                  CircleAvatar(
                    backgroundColor: orange,
                    radius: 50,
                    child: CircleAvatar(
                        backgroundColor: Colors.white,
    
                        // backgroundImage: NetworkImage(
                        //     "https://media.geeksforgeeks.org/wp-content/uploads/20210101144014/gfglogo.png"), //NetworkImage
                        radius: 100,
                        child: Image(
                          image: AssetImage('assets/images/iconTop.png'),
                          height: 100,
                        )), //CircleAvatar
                  ), //CircleAvatar
    
                  SizedBox(
                    height: 10,
                  ), //SizedBox
                  Text(
                    'Denga is a division of Ellie Moesha Limited designed to simplify the buying, selling and renting of houses and other related properties in Malawi.  Compare different location and neighbourhoods and filter the results according to your needs all within the app. ',
                    style: TextStyle(
                      letterSpacing: 0.2,
                      fontSize: 15,
                      color: Colors.black,
                      // overflow:TextOverflow.visible
                    ), //Textstyle
                  ), 
                    Text(
                    'Denga does not own any of the properties listed and nor are we responsible for any agreements between sellers and buyers or landlords and tenants. However, we do encourage you to report any suspicious activities to us so we can take the necessary steps to remove it from the app.Go ahead and put that new roof over your head. Happy searching',
                    style: TextStyle(
                      letterSpacing: 0.2,
                      fontSize: 15,
                      color: Colors.black,
                      // overflow:TextOverflow.visible
                    ), //Textstyle
                  ),//Text
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
    );
  }
}
