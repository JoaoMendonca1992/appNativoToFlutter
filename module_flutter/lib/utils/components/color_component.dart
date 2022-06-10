import 'package:flutter/material.dart';
import 'package:module_flutter/utils/constants/constants.dart';

Color getColor(String? color){
  if(color!.isNotEmpty){
    return HexColor.fromHex(color);
  }
  return Colors.black;
}