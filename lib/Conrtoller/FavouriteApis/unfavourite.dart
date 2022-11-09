// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:dio/dio.dart';

import 'package:shared_preferences/shared_preferences.dart';

import '../../Config/color.dart';

Future<String> RemovefavouriteApis({var property_id, context}) async {
  // var property_id=property_id[]
  // isloading:true;
  var apiURL = 'https://denga.r3therapeutic.com/public/api/removefromfavourite';

  var formData = FormData.fromMap({
    'property_id': property_id,
  });
  // print("property_id: $property_id");
  //final prefs = await SharedPreferences.getInstance();
  SharedPreferences pref = await SharedPreferences.getInstance();
  var token = pref.getString('token');
  Dio dio = Dio();
  Response responce;
  try {
    responce = await dio.post(apiURL,
        data: formData,
        options: Options(
          headers: {"authorization": "Bearer $token"},
        ));
    if (responce.data['error'] == false) {
      // Navigator.push(
      //   context,
      //   MaterialPageRoute(builder: (context) => Navbar()),
      // );
      Fluttertoast.showToast(
          msg: "Remove From Favourite", backgroundColor: blue);
    } else {
      Fluttertoast.showToast(
          msg: "Can not remove from Favourite ", backgroundColor: blue);
    }
  } catch (e) {
    Fluttertoast.showToast(msg: "Error", backgroundColor: blue);
    return 'some thing wrong';
  }
  return '';
}
