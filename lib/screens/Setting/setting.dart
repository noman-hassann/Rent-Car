import 'package:flutter/material.dart';
import 'package:rent_house/config/color.dart';
import 'package:rent_house/screens/Navigation/navBar.dart';
import 'package:rent_house/screens/Setting/widgets/textWidget.dart';
import 'package:rent_house/widgets/widgets.dart';

class Setting extends StatefulWidget {
   Setting({super.key});
  @override
  State<Setting> createState() => _SettingState();
}

class _SettingState extends State<Setting> {
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        body: SafeArea(
            child: Center(
      child: Container(
        width: MediaQuery.of(context).size.width * 0.9,
        // color: Color.fromARGB(255, 207, 89, 89),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
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
                         Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                               Navbar()),
                                    );
                        },
                      ),
                    ),
                  ),
                  text(
                      title: "",
                      fontsize: 20.0,
                      fontweight: FontWeight.normal,
                      color: const Color.fromARGB(255, 15, 5, 5)),
                  const Image(image: AssetImage('assets/images/iconTop.png')),
                ],
              ),
              SizedBox(height: size.height * 0.042),
              text(
                  title: "Personal Information",
                  fontsize: 18.0,
                  fontweight: FontWeight.bold),
              SizedBox(height: size.height * 0.042),
              text(
                  title: "General",
                  fontsize: 18.0,
                  fontweight: FontWeight.normal),

              //personal Information
              SizedBox(height: size.height * 0.032),

              textWidget(
                text1: "Name",
                text2: "Sophie Garnier",
              ),
              SizedBox(height: size.height * 0.032),
              textWidget(
                text1: "Address",
                text2: "House 234 Near New Market Daka",
              ),

              SizedBox(height: size.height * 0.032),

              textWidget(

                text1: "Contact",
                text2: "+1 234 234 2345",
              ),
              SizedBox(height: size.height * 0.032),
              textWidget(
                text1: "Gender",
                text2: "Male",
              ),
            ]),
      ),
    )));
  }
}
