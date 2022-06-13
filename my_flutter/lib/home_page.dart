import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:my_flutter/model/model_teste_entite.dart';
import 'package:my_flutter/model/model_teste_model.dart';
class HomePage extends StatefulWidget {
   const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
String title = "";
ModelTeste? modelTeste;

  static const platformMethodChannel =  MethodChannel('samples.flutter.io/dados');
  @override
  void initState() {
    super.initState();

    getTitle();
  }

  getTitle() async {
    String res = await platformMethodChannel.invokeMethod('getTitle');
    var responseModel = await platformMethodChannel.invokeMethod('getModel');
    Map<String, dynamic> map = {
      'body': responseModel['body'],
      'code': responseModel['code'],
      'token': responseModel['token'],
    } ;
    setState(() {
      title = res;
      modelTeste = ModelTeste.fromJson(map);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
     child: Column(
       crossAxisAlignment: CrossAxisAlignment.center,
       mainAxisAlignment: MainAxisAlignment.center,
       children: [
         Center(
           child: Text(
             title.toString(),
             textAlign: TextAlign.center,
             style: TextStyle(
               fontSize: 12,
               color: Colors.purple,
               decoration: TextDecoration.none,
             ),
           ),
         ),
         Center(
           child: Text(
            modelTeste != null ?  modelTeste.toString() : "Erro ao receber dados",
             textAlign: TextAlign.center,
             style: TextStyle(
               fontSize: 12,
               color: Colors.red,
               decoration: TextDecoration.none,
             ),
           ),
         ),
       ],
     )
    );
  }
}
