// import 'dart:convert';

// import 'package:flutter/src/widgets/container.dart';
// import 'package:flutter/src/widgets/framework.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// import 'package:http/http.dart' as http;

// class testsearch extends StatefulWidget {
//   const testsearch({super.key});

//   @override
//   State<testsearch> createState() => _testsearchState();
// }

// class _testsearchState extends State<testsearch> {
//   @override
//   Widget build(BuildContext context) {
//     return Container();
//   }
//   Map? mapResponse;


//     getStringValuesSF() async {
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     //Return String
//     String? token = prefs.getString('token');
//     return token;
//   }

//     Future searchApi() async {
//     var token = getStringValuesSF();
//     http.Response response;
//     response = await http.post(
//         Uri.parse("https://denga.r3therapeutic.com/public/api/searchpost"),
//         headers: {
//           'Content-Type': 'application/json',
//           'Accept': 'application/json',
//           'Authorization': 'Bearer $token',
//         });
//     if (response.statusCode == 200) {
//       setState(() {
//         mapResponse = jsonDecode(response.body);
//       List  _users = mapResponse?['data'];
//       print(_users);
//       });
//     }

// }
// }