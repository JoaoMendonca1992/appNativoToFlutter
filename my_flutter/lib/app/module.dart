import 'package:flutter_modular/flutter_modular.dart';
import 'package:my_flutter/home_page.dart';

class AppModule extends Module {
  @override
  List<Bind> get binds => [

  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(Modular.initialRoute,  child:(_, args) =>  HomePage()),
  ];
}