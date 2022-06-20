import 'package:flutter/material.dart';
import 'package:rent_house/widgets/widgets.dart';

Container textIconFunColumn({ title,icon,fontsize,iconColor,fontColor}) {
  return Container(
    child: Column(
      children: [
     Icon(icon,size: 20,color:iconColor ),
    const SizedBox(width: 6,),
     text(title:title,fontsize: fontsize,color:fontColor ),
    ]),
    );
}
