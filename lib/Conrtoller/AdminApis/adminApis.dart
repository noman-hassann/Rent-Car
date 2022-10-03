import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:rent_house/Config/color.dart';
import 'package:rent_house/View/Admin/Navbar/adminNavbar.dart';
import 'package:rent_house/View/Admin/View_Property/Admin.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http_parser/http_parser.dart';

var token;

Dio dio = Dio();
var apiURL = 'https://denga.r3therapeutic.com/public/api/addpost';
FormData formData = FormData();
Future<String> adminAddproperty({
  title,
  address,
  price,
  area,
  bedrooms,
  bathrooms,
  parking,
  other,
  description,
  // ignore: non_constant_identifier_names
  property_value,
  // ignore: non_constant_identifier_names
  property_type,
  List<File>? imageFileList,
  context,
}) async {
  List uploadList = [];
  for (var imageFiles in imageFileList!) {
    uploadList.add(await MultipartFile.fromFile(imageFiles.path,
        filename: imageFiles.path.split('/').last,
        contentType: MediaType('image', 'jpg')));
  }
  // print("'property_value': $property_value");
  FormData formData = FormData.fromMap({
    'title': title,
    'address': address,
    'price': price,
    'area': area,
    'bedrooms': bedrooms,
    'bathrooms': bathrooms,
    'parking': parking,
    'others': other,
    'description': description,
    'images[]': uploadList,
    'property_value': property_value.toString(),
    'property_type': property_type.toString(),
  });
  // SharedPreferences pref = await SharedPreferences.getInstance();
  // token = pref.getString('token');
  // print('AdminApisToken =$token');

  // print('_images');
  SharedPreferences pref = await SharedPreferences.getInstance();
  var token= pref.getString('token');
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
          MaterialPageRoute(builder: (context) => const AdminNavbar()),
        );
        Fluttertoast.showToast(
            msg: "Data Upload Successfull", backgroundColor: orange);
        const Duration(milliseconds: 800);
      } else {
        Fluttertoast.showToast(
            msg: "Wrong Input Data Type", backgroundColor: orange);
        
        const Duration(milliseconds: 500);
      }
    }
    else{
          Fluttertoast.showToast(
        msg: "Please connect to internet", backgroundColor: orange);
    }
  } on SocketException catch (_) {
    Fluttertoast.showToast(
        msg: "Something went Wrong try again later", backgroundColor: orange);

    const Duration(milliseconds: 500);
  }
  return responce.data;
}