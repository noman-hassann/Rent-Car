import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:dio/dio.dart';
import 'package:rent_house/Config/color.dart';
import 'package:rent_house/View/Navigation/navBar.dart';
import 'package:shared_preferences/shared_preferences.dart';

// ignore: non_constant_identifier_names
Future<String> favouriteApis({var property_id, context}) async {
  // var property_id=property_id[]
  // isloading:true;
  var apiURL = 'https://denga.r3therapeutic.com/public/api/addtofavourite';

  var formData = FormData.fromMap({
    'property_id': property_id,
  });
  // print("property_id $property_id");
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
          msg: "Save to Favourite", backgroundColor: orange);
    } else {
      Fluttertoast.showToast(
          msg: "Can not save to Favourite ", backgroundColor: orange);
    }
  } catch (e) {
    Fluttertoast.showToast(
        msg: "Error", backgroundColor: orange);
    return 'some thing wrong';
  }
  return '';
}
