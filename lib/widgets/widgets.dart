import 'package:flutter/material.dart';

Text text({title, fontsize, fontweight, color}) {
  return Text(
    title,
    textAlign:TextAlign.end,
    style: TextStyle(fontSize: fontsize, fontWeight: fontweight, color: color,),
  );
}
