import 'package:flutter/material.dart';
import 'package:rent_house/widgets/widgets.dart';

Widget textIconFunColumn({ title,icon,fontsize,iconColor,fontColor}) {
  return Container(
    child: Column(
      children: [
     Icon(icon,size: 20,color:iconColor ),
    const SizedBox(width: 20,height: 0,),
     text(title:title,fontsize: fontsize,color:fontColor ),
    ]),
    );
}
