import 'package:flutter/material.dart';
import 'package:rent_house/widgets/widgets.dart';

Container colorText({title1,title2, icon, fontsize, iconColor, t1Color,t2Color}) {
  return Container(
    alignment: Alignment.topLeft,
   // padding: EdgeInsets.symmetric(horizontal: 10),
  //color: Colors.amber,

    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
      text(title: title1, fontsize: fontsize, color: t1Color),
      Padding(
        padding: const EdgeInsets.only(right:8.0),
        child: text(title: title2, fontsize: fontsize, color: t2Color ,),
      ),
    ]),
  );
}
