import 'package:flutter/material.dart';
import 'package:rent_house/screens/Liked/liked.dart';
import 'package:rent_house/screens/Navigation/navBar.dart';
// @dart=2.9

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
       debugShowCheckedModeBanner: false,
      home:  LikedView(),
    );
    }
}