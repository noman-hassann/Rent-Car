// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:dio/dio.dart';
import 'package:rent_house/screens/Navigation/navBar.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<String> loginApis({email, password, context}) async {
  // isloading:true;
  var apiURL = 'https://denga.r3therapeutic.com/public/api/login';

  var formData = FormData.fromMap({
    'email': email,
    'password': password,
  });
  //final prefs = await SharedPreferences.getInstance();
 SharedPreferences pref = await SharedPreferences.getInstance();

  Dio dio = Dio();
  Response responce;

  try {
    responce = await dio.post(
      apiURL,
      data: formData,
    );

    var res1 = responce.data['user'];
    var token = res1['token'];
       pref.setString("token", token);


    if (responce.data['error'] == false) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => Navbar()),
      );
      Fluttertoast.showToast(
          msg: "Login Successfull", backgroundColor: Colors.cyan);
    } else {
      Fluttertoast.showToast(
          msg: "Login Failed", backgroundColor: Colors.cyan);
    }
  } catch (e) {
    Fluttertoast.showToast(
        msg: "User Already exists", backgroundColor: Colors.cyan);
    return 'some thing wrong';
  }
  return '';
}
