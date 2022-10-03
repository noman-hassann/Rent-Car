import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:dio/dio.dart';
import 'package:rent_house/View/Admin/Navbar/adminNavbar.dart';
import 'package:rent_house/View/Admin/View_Property/Admin.dart';
import 'package:rent_house/View/Navigation/navBar.dart';
import 'package:shared_preferences/shared_preferences.dart';

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
    SharedPreferences pref = await SharedPreferences.getInstance();
    var res1 = responce.data['user'];
    var role = res1['role'];
    var token = res1['token'];
    pref.setString("token", token);
    pref.setString("role", role);
    Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => role == 'agent' ? const AdminNavbar() : const Navbar()),
    );
    return '';
  } catch (e) {
    Fluttertoast.showToast(
        msg: "User Already exists ", backgroundColor: Colors.cyan);
    return '';
  }
}
