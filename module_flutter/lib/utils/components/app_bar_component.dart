import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_svg/svg.dart';
import 'package:module_flutter/pages/initial_page/presenter/controller/theme_controller.dart';
import 'package:module_flutter/utils/constants/constants.dart';

class AppBarComponent{
  ThemeController themeController = Modular.get<ThemeController>();

  AppBar getAppBar(BuildContext context, String text){
    return AppBar(
        backgroundColor: HexColor.fromHex(themeController.themeEntite!.colorPrimaryDark!),
        elevation: 1,
        toolbarHeight: 70,
        centerTitle: true,
        title: Text(
          text.toUpperCase(),
          textAlign: TextAlign.center,
          style: const TextStyle(
            fontSize: 16,
            fontFamily: 'Roboto-Regular'
          ),
        ),
        leading: Padding(
          padding: const EdgeInsets.only(left: 10, right: 10),
          child: IconButton(
            icon: SizedBox(
              height: 15,
              child: SvgPicture.asset(
                "assets/icons/arrow_back.svg",
                color: Colors.white,
              ),
            ),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        )
    );
  }
}