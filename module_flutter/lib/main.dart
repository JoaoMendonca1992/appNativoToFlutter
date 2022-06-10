import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:module_flutter/app/module.dart';
import 'package:module_flutter/app/widget.dart';

void main() async {
  runApp(ModularApp(module: AppModule(),child: AppWidget() ));
}