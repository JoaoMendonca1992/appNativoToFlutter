import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:my_flutter/app/module.dart';
import 'package:my_flutter/app/widget.dart';
import 'package:my_flutter/home_page.dart';

void main() =>  runApp(ModularApp(module: AppModule(),child: AppWidget()));


