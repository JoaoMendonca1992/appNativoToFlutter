import 'package:flutter/material.dart';
import 'package:flutter_animation_progress_bar/flutter_animation_progress_bar.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_svg/svg.dart';
import 'package:module_flutter/pages/initial_page/presenter/controller/theme_controller.dart';
import 'package:module_flutter/utils/constants/constants.dart';

class AppBarIndicatorComponent{
  ThemeController themeController = Modular.get<ThemeController>();
  AppBar getAppBarIndicator(BuildContext context){
    return AppBar(
      backgroundColor: kColorDarkBlue,
      elevation: 0,
      flexibleSpace:Container(
        child:  Padding(
          padding: const EdgeInsets.only(top: 90),
          child: Observer(
            builder: (context){
              return  Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [

                  Container(
                    height: 14,
                    width: MediaQuery.of(context).size.width,
                    child:  FAProgressBar(
                      progressColor: HexColor.fromHex(themeController.themeEntite!.colorPrimary!),
                      currentValue: 40,

                      backgroundColor: Colors.blue,
                      displayTextStyle: const TextStyle(
                          color: Colors.transparent
                      ),
                      displayText: '',

                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ),
      // flexibleSpace:
    );
  }
}