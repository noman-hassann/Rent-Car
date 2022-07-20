import 'package:flutter/material.dart';
import 'package:rent_house/config/color.dart';
import 'package:rent_house/widgets/widgets.dart';

Container textButton({ buttonTitle,text1,text2,widgetpass}) {
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
                title:text2,
                fontsize: 15.0,
                fontweight: FontWeight.normal,
                color: textwhite),
          ],
        ),
        SizedBox(
          height: 40,
          width: 150,
          child: ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              primary: orange, // Background color
            ),
            child:  Text(
              buttonTitle,
              style: TextStyle(fontSize: 20),
            ),
          ),
        )
      ],
    ),
  );
}
