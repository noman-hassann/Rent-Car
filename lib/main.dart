import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rent_house/screens/Admin/Add_New_Property/listProperty.dart';
import 'package:rent_house/screens/Admin/View_Property/AdminViwe.dart';
import 'package:rent_house/screens/Admin/View_Property/test.dart';
import 'package:rent_house/screens/Admin/View_Property/viewTest.dart';
import 'package:rent_house/screens/Explore/Explore.dart';
import 'package:rent_house/screens/Home/details/details.dart';
import 'package:rent_house/screens/Home/home.dart';
import 'package:rent_house/screens/Liked/liked.dart';
import 'package:rent_house/screens/LoginSignUp/View/signup.dart';
import 'package:rent_house/screens/Navigation/navBar.dart';
import 'package:rent_house/screens/Setting/setting.dart';
import 'package:rent_house/test2.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;


import 'screens/LoginSignUp/View/login.dart';

// @dart=2.9
var token;
Future<void> main() async {

  runApp(const MyApp());
  SharedPreferences pref = await SharedPreferences.getInstance();
  token = pref.getString('token');
  print("tokenmain" + token);
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.`
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        debugShowCheckedModeBanner: false,
        getPages: [
          GetPage(name: "/Navbar", page: () => const LandingPage()),
        //  GetPage(name: "/home", page: () =>const Home()),
          GetPage(name: "/liked", page: () => Liked()),
          GetPage(name: "/Explore", page: () => Explore()),
          GetPage(name: "/Setting", page: () => Setting()),
          GetPage(name: "/detail", page: () => const Detail()),
          GetPage(name: "/signup", page: () => const SignupScreen()),
          GetPage(name: "/Navbar", page: () => const Navbar()),
          GetPage(name: "/login", page: () => LoginScreen()),
          GetPage(name: "/listProperty", page: () => ListProperty()),
          GetPage(name: "/AdminProperty", page: () => AdminProperty()),
        //  GetPage(name: "/HotelView", page: () => HotelView()),
        ],
       /// initialRoute: "/AdminProperty");
       home:  AdminProperty());
      //  home: (token == null) ? ListProperty() : Navbar());
  }
}
