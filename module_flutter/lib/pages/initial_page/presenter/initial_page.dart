import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:module_flutter/pages/initial_page/presenter/controller/theme_controller.dart';
import 'package:module_flutter/pages/initial_page/presenter/state/theme_state.dart';
import 'package:module_flutter/utils/components/loading_component.dart';
import 'package:module_flutter/utils/constants/constants.dart';
class InitialPageLoading extends StatefulWidget {
  const InitialPageLoading({Key? key}) : super(key: key);

  @override
  _InitialPageLoadingState createState() => _InitialPageLoadingState();
}

class _InitialPageLoadingState extends State<InitialPageLoading> {
  ThemeController themeController = Modular.get<ThemeController>();

  @override
  void initState() {
    super.initState();
    themeController.getTheme(context);

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Observer(
        builder: (context){
          var state = themeController.state;
       if(state is LoadingThemeState){
         return getLoading();
       }
       return Container();
        },
      ),
    );
  }
}
