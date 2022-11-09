// ignore_for_file: avoid_print

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:dio/dio.dart';

import 'package:rent_house/View/Navigation/navBar.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../Config/color.dart';

Dio dio = Dio();
var apiURL = 'https://denga.r3therapeutic.com/public/api/updateProfile';
FormData formData = FormData();
Future<String> updateData({
  name,
  address,
  contact,
  context,
}) async {
  // print("'property_value': $property_value");
  FormData formData = FormData.fromMap({
    'name': name,
    'address': address,
    'contact': contact,
  });
  SharedPreferences pref = await SharedPreferences.getInstance();

  pref.setString(
    "_name",
    name,
  );
  pref.setString(
    "_address",
    address,
  );
  pref.setString(
    "_contact",
    contact,
  );

  // print('_images');
  var token = pref.getString('token');
  Response responce;

  responce = await dio.post(apiURL,
      data: formData,
      options: Options(headers: {
        HttpHeaders.authorizationHeader: "Bearer $token",
      }));
  try {
    final result = await InternetAddress.lookup('google.com');
    if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
      if (responce.data['error'] == false) {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const Navbar()),
        );
        Fluttertoast.showToast(
            msg: " Updated Successfull", backgroundColor: blue);
        const Duration(milliseconds: 800);
      } else {
        Fluttertoast.showToast(msg: "Try Again Later", backgroundColor: blue);

        const Duration(milliseconds: 500);
      }
    } else {
      Fluttertoast.showToast(
          msg: "Please connect to internet", backgroundColor: blue);
    }
  } on SocketException catch (_) {
    Fluttertoast.showToast(
        msg: "Something went Wrong try again later", backgroundColor: blue);

    const Duration(milliseconds: 500);
  }
  return responce.data;
}
