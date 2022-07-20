import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http_parser/http_parser.dart';

var token;

Dio dio = Dio();
List<dynamic>? _images = [];
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
  for (int i = 0; i < imageFileList!.length; i++) {
    var image = imageFileList[i].path;
    _images!.add(
        await MultipartFile.fromFile(image, filename: image.split('/').last));
    print(_images);
  }

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
    'images': _images,
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
  print('Responce: $responce');

//    sendApi(FormData formData) async {
//   var response = await dio.post(apiURL,
//       data: formData,
//       options: Options(headers: {
//         HttpHeaders.authorizationHeader: "Bearer $token",
//       }));
//   print("ResponseReturn: $response");
//  }

  return '';
}
    



  // isloading:true;


  // var formData = FormData.fromMap({
  //   'name': name,
  //   'email': email,
  //   'contact': conatact,
  //   'address': address,
  //   'password': password,
  //   'type': type,
  // });
  //final prefs = await SharedPreferences.getInstance();




    // print("response datra " + responce.toString());

  //   Navigator.push(
  //     context,
  //     MaterialPageRoute(builder: (context) => Navbar()),
  //   );
  //   Fluttertoast.showToast(
  //       msg: "Login Successfull", backgroundColor: Colors.cyan);
  //   return '';
  // } catch (e) {
  //   Fluttertoast.showToast(
  //       msg: "User Already exists", backgroundColor: Colors.cyan);
  //   return 'some thing wrong';
  // }

