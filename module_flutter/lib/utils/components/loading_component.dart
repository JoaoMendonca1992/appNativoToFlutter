import 'package:flutter/material.dart';
import 'package:module_flutter/utils/constants/constants.dart';

Widget getLoading(){
  return  Column(
    crossAxisAlignment: CrossAxisAlignment.center,
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Center(
        child: CircularProgressIndicator(
          color: HexColor.fromHex("#3552AA"),
        ),
      ),
    ],
  );
}