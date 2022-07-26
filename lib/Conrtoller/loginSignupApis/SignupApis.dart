import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:rent_house/screens/Navigation/navBar.dart';

Future<String> signupApis({
  name,
  email,
  conatact,
  address,
  password,
  type,
  context,
}) async {
  // isloading:true;
  var apiURL = 'https://denga.r3therapeutic.com/public/api/register';

  var formData = FormData.fromMap({
    'name': name,
    'email': email,
    'contact': conatact,
    'address': address,
    'password': password,
    'type': type,
  });
  //final prefs = await SharedPreferences.getInstance();

  Dio dio = Dio();
  Response responce;
  try {
    responce = await dio.post(
      apiURL,
      data: formData,
    );

    // print("response datra " + responce.toString());

    SharedPreferences pref = await SharedPreferences.getInstance();
    var res1 = responce.data['user'];
    var token = res1['token'];
    pref.setString("token", token);

    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => Navbar()),
    );
    Fluttertoast.showToast(
        msg: "Login Successfull", backgroundColor: Colors.cyan);
    return '';
  } catch (e) {
    Fluttertoast.showToast(
        msg: "User Already exists", backgroundColor: Colors.cyan);
    return 'some thing wrong';
  }
}
