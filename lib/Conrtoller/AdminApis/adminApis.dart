import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:rent_house/screens/Admin/View_Property/AdminViwe.dart';
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
  List<File>? imageFileList,
  context,
}) async {
  List uploadList = [];
  for (var imageFiles in imageFileList!) {
    uploadList.add(await MultipartFile.fromFile(imageFiles.path,
        filename: imageFiles.path.split('/').last,
        contentType: MediaType('image', 'jpg')));
  }
  FormData formData = FormData.fromMap({
    'title': title,
    'address': address,
    'price': price,
    'area': area,
    'bedrooms': bedrooms,
    'bathrooms': bathrooms,
    'parking': parking,
    'others': "near school",
    'description': description,
    'images[]': uploadList,
  });
  SharedPreferences pref = await SharedPreferences.getInstance();
  token = pref.getString('token');
  print('AdminApisToken =$token');
  print('_images');

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
          MaterialPageRoute(builder: (context) => AdminProperty()),
        );
        Fluttertoast.showToast(
            msg: "Data Upload Successfull", backgroundColor: Colors.cyan);
               duration:const Duration(milliseconds: 800);
      } else {
        Fluttertoast.showToast(
            msg: "Wrong Input Data Type", backgroundColor: Colors.cyan);
               duration:const Duration(milliseconds: 500);
      }
    }
  } on SocketException catch (_) {
            Fluttertoast.showToast(
            msg: "Data Upload Successfull", backgroundColor: Colors.cyan);
               duration:const Duration(milliseconds: 500);
  }
  return responce.data;
}
