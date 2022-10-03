// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:dio/dio.dart';
import 'package:rent_house/View/Admin/Navbar/adminNavbar.dart';
import 'package:rent_house/View/Admin/View_Property/AdminDetail.dart';
import 'package:rent_house/View/Admin/View_Property/Admin.dart';
import 'package:rent_house/View/Navigation/navBar.dart';
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
    print(responce);
    var res1 = responce.data['user'];
    var token = res1['token'];
    var role = res1['role'];
    // ignore: no_leading_underscores_for_local_identifiers
    var _name = res1['name'];
    // ignore: no_leading_underscores_for_local_identifiers

    var _address = res1['address'];
    var _contact = res1['contact'];
    pref.setString(
      "token",
      token,
    );
    pref.setString(
      "role",
      role,
    );
    pref.setString(
      "_name",
      _name,
    );
    pref.setString(
      "_address",
      _address,
    );
    pref.setString(
      "_contact",
      _contact,
    );
    print("token $token");
    print("role $role");
    var role1 = pref.getString('role');
    if (responce.data['error'] == false) {
      Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => role1 == 'user' ? const Navbar() : const AdminNavbar()),
      );
      Fluttertoast.showToast(
          msg: "Login Successfull", backgroundColor: Colors.cyan);
      return 'Login Successfull';
    }
  } catch (e) {
    Fluttertoast.showToast(
        msg: "Username or password incorrect", backgroundColor: Colors.cyan);
    return '';
  }
  return '';
}

GetRole() async {
  SharedPreferences pref = await SharedPreferences.getInstance();
  var role = pref.getString('role');
  return role;
}
