// ignore_for_file: non_constant_identifier_names

import 'dart:async';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:rent_house/View/LoginSignUp/login.dart';
import 'package:rent_house/View/Navigation/navBar.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashView extends StatefulWidget {
  @override
  _SplashViewState createState() => _SplashViewState();
}

// ignore: prefer_typing_uninitialized_variables
var token;
// ignore: prefer_typing_uninitialized_variables
var role;

class _SplashViewState extends State<SplashView> {
  GetToken() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    setState(() {
      token = pref.getString('token');
    });
  }

  GetRole() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    setState(() {
      role = pref.getString('role');
    });
    if (kDebugMode) {
      print("role1  $role");
    }
    if (kDebugMode) {
      print("token  $token");
    }
  }

  // navigateTo() {
  //   if (role == null) {
  //     LoginScreen();
  //   } else if (role == "user") {
  //     const Navbar();
  //   } else {
  //     const Admin();
  //   }
  // }

  var age;
  @override
  void initState() {
    // print("token: $token");
    token = GetToken();
    role = GetRole();
    super.initState();
    Timer(
        Duration(seconds: 3),
        () => Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: (BuildContext context) {
              if (role == null) {
                return LoginScreen();
              } else if (role == "user") {
                return const Navbar();
              }
              return Container();
            }
                 

                    )));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Image.asset('assets/images/logo.png'),
      ),
    );
  }
}
