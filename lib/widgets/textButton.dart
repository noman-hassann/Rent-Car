import 'package:flutter/material.dart';


import 'package:rent_house/widgets/widgets.dart';

import '../Config/color.dart';

Container textButton({
  text1,
  text2,
  widgetpass,
}) {
  return Container(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            text(
                title: text1,
                fontsize: 15.0,
                fontweight: FontWeight.normal,
                color: white),
            widgetpass,
            text(
                title: text2,
                fontsize: 15.0,
                fontweight: FontWeight.normal,
                color: white),
          ],
        ),
      ],
    ),
  );
}

Widget button({buttonTitle, size}) {
  return Container(
      height: size.height * 0.05,
      width: size.width * 0.4,
      color: blue,
      child: Center(
        child: text(
            title: buttonTitle,
            fontsize: 15.0,
            fontweight: FontWeight.bold,
            color: Colors.white),
      ));
}

Widget button2({buttonTitle, height, width}) {
  return Container(
      decoration: BoxDecoration(
          color: blue,
          border: Border.all(color: Colors.black.withOpacity(0.2)),
          borderRadius: BorderRadius.all(Radius.circular(5))),
      height: height,
      width: width,
      child: Center(
        child: text(
            title: buttonTitle,
            fontsize: 15.0,
            fontweight: FontWeight.bold,
            color: Colors.white),
      ));
}
