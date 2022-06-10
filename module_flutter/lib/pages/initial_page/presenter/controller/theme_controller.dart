import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:module_flutter/pages/initial_page/domain/entities/theme_entite.dart';
import 'package:module_flutter/pages/initial_page/domain/usecases/theme_user_case.dart';
import 'package:module_flutter/pages/initial_page/presenter/state/theme_state.dart';
import 'package:module_flutter/utils/components/custom_alert_component.dart';

part 'theme_controller.g.dart';

class ThemeController = _ThemeController with _$ThemeController;

abstract class _ThemeController with Store {
  final ThemeUseCase useCase;

  _ThemeController(this.useCase);

  @observable
  ThemeState state =  const LoadingThemeState();

  @action
  setState(ThemeState value) => state = value;

  @action
  setModel(ThemeEntite entite) => themeEntite = entite;

  @observable
  ThemeEntite? themeEntite;

  @action
  getTheme(BuildContext context) async{
      setState( LoadingThemeState());
      var result = await useCase();
      if(result!= null){
        if(result is ThemeEntite) {
          setModel(result);
         Modular.to.pushReplacementNamed("questions_investiment_page_one");
       //   Modular.to.pushReplacementNamed('home_investiment_page');
        }else{
          setState(ErrorThemeState());
          errorLogin(context,result.toString());
        }
      }else{
        setState(ErrorThemeState());
        errorLogin(context,"Não foi possivel carregar as informações!");
      }
    }
  errorLogin( BuildContext context, String body){
    CustomAlertComponent custom = CustomAlertComponent(
        context: context,
        title: "Error",
        textBody: body,
        positiveButton: "ok", route: '');
    custom.show();
  }

}
