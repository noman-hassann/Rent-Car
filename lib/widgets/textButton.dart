import 'package:flutter/material.dart';
import 'package:rent_house/config/color.dart';
import 'package:rent_house/widgets/widgets.dart';

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
                color: textwhite),
            widgetpass,
            text(
                title: text2,
                fontsize: 15.0,
                fontweight: FontWeight.normal,
                color: textwhite),
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
      color: orange,
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
          color: orange,
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
