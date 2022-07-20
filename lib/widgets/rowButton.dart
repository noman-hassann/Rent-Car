import 'package:flutter/material.dart';
import 'package:rent_house/widgets/widgets.dart';

Container rowButtonFun(
    {backgroundcolor, textColor, title1, width, height, ontap}) {
  return Container(
    decoration:
        BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(20))),
    child: TextButton(
      onPressed: () {
        ontap();
      },
      style: TextButton.styleFrom(
          backgroundColor: backgroundcolor,
          primary: textColor,
          minimumSize: Size(width, height),
          textStyle:
              const TextStyle(fontSize: 17.0, fontWeight: FontWeight.w500)),
      child: text(title: title1, fontsize: 15.0, fontweight: FontWeight.normal),
    ),
  );
}
