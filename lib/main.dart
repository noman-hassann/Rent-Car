import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rent_house/View/Admin/Add_New_Property/AddProperty.dart';
import 'package:rent_house/View/Admin/View_Property/Admin.dart';
import 'package:rent_house/View/Explore/Explore.dart';

import 'package:rent_house/View/Favourite/favourite.dart';
import 'package:rent_house/View/LoginSignUp/View/signup.dart';
import 'package:rent_house/View/Navigation/navBar.dart';
import 'package:rent_house/View/Setting/setting.dart';
import 'package:rent_house/splash.dart';
import 'package:rent_house/test2.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'View/LoginSignUp/View/login.dart';
import 'View/SelectAbleList/selectable.dart';

// GetRole() async {
//   SharedPreferences pref = await SharedPreferences.getInstance();
//   var role = pref.getString('role');
//   return role;
// }

Future<void> main() async {
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.`
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        debugShowCheckedModeBanner: false,
        getPages: [
          //      GetPage(name: "/Navbar", page: () => const LandingPage()),
          //  GetPage(name: "/home", page: () =>const Home()),
          GetPage(name: "/liked", page: () => const favourite()),
          GetPage(name: "/Explore", page: () => const Explore()),
          GetPage(name: "/Setting", page: () => const Setting()),
          GetPage(name: "/signup", page: () => const SignupScreen()),
          GetPage(name: "/Navbar", page: () => const Navbar()),
          GetPage(name: "/login", page: () => LoginScreen()),
          GetPage(name: "/listProperty", page: () => const AddProperty()),
          GetPage(name: "/AdminProperty", page: () => const Admin()),
          // GetPage(name: "/homedetails", page: () => const HomeDetail()),
          //  GetPage(name: "/HotelView", page: () => HotelView()),
        ],
        /// initialRoute: "/AdminProperty");
     //   home: SelectAbleList()
        // home: SplashView()
        home: SelectAbleList()
         );
  }
}
