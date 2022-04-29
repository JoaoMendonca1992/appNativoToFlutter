import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AppWidget extends StatefulWidget {

  AppWidget({this.delegate});

  @override
  _AppWidgetState createState() => _AppWidgetState();
  final delegate ;
}

class _AppWidgetState extends State<AppWidget> {
  @override
  void initState(){
  }

  @override
  Widget build(BuildContext context) {
    return Observer(builder: (context){
      return  MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Module Flutter',
          color: Colors.purple,
          theme: ThemeData(backgroundColor: Colors.white,),
          initialRoute: Modular.initialRoute,
        ).modular();
    });
  }
}
