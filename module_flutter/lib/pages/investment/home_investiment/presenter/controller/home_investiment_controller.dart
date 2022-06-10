import 'package:adaptive_dialog/adaptive_dialog.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:module_flutter/pages/investment/home_investiment/domain/entities/home_investiment_entite.dart';
import 'package:module_flutter/pages/investment/home_investiment/domain/entities/modalities_entite.dart';
import 'package:module_flutter/pages/investment/home_investiment/domain/usecases/home_investiment_user_case.dart';
import 'package:module_flutter/pages/investment/home_investiment/presenter/state/home_investiment_state.dart';
import 'package:module_flutter/utils/constants/constants.dart';
import 'package:module_flutter/utils/errors/error_model.dart';

part 'home_investiment_controller.g.dart';

class HomeInvestimentController = _HomeInvestimentController with _$HomeInvestimentController;

abstract class _HomeInvestimentController with Store {
final HomeInvestimentUseCase useCase;
_HomeInvestimentController(this.useCase);

  @observable
  bool isShowBalance = false;
  @observable
   HomeInvestimentEntite? homeInvestimentEntite;
  @observable
  HomeInvestimentState state =   InitialHomeInvestimentState();

  @action
  setBalance(bool balance) {
    isShowBalance = balance;
  }
  @action
  setModel(HomeInvestimentEntite entite) => homeInvestimentEntite = entite;

  @observable
  ModalitiesEntite? modalitiesEntite;

  @action
  setModalities(ModalitiesEntite modalities){
    modalitiesEntite = modalities;
  }

@action
get_home(BuildContext context) async{
  setState(LoadingHomeInvestimentsState());
  var result = await useCase();
  if(result!= null){
    if(result is HomeInvestimentEntite) {
      setState(InitialHomeInvestimentState());
      setModel(result);
    }else if (result is ErrorModel){
      setState(LoadingHomeInvestimentsState());
      return alertError(context,result.errorMessage.toString(), 'Error');
    }else{
      setState(LoadingHomeInvestimentsState());
      return  alertError(context,"Não foi possivel carregar as informações!", 'Error');
    }
  }else{
    setState(LoadingHomeInvestimentsState());
    return  alertError(context,"Não foi possivel carregar as informações!", 'Error');
  }
}

@action
setState(HomeInvestimentState value) => state = value;

alertError(BuildContext context, String body, String title)async {
  final result = await showOkAlertDialog(
    context: context,
    title: title,
    message: body,
    onWillPop: () => Future.value(false),
  );
  assert(result == OkCancelResult.ok);
}

String getImageProfile(String profile){
  String typeProfile = profile.toLowerCase();
  switch(typeProfile){
    case 'conservador':
      return "assets/images/home_conservative.svg";
    case 'moderado':
      return "assets/images/home_moderate.svg";
    case 'arrojado':
      return "assets/images/home_bold.svg";
  }
  return '';
}

Color getColor(String profile){
  String typeProfile = profile.toLowerCase();
  switch(typeProfile){
    case 'conservador':
      return HexColor.fromHex("#32BA7C");
    case 'moderado':
      return HexColor.fromHex("#FF8F0C");
    case 'arrojado':
      return HexColor.fromHex("#FD7373");
  }
  return HexColor.fromHex("#32BA7C");
}
}
