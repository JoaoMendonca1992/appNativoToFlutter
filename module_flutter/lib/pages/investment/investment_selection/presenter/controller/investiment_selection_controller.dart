import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:module_flutter/utils/constants/constants.dart';

part 'investiment_selection_controller.g.dart';

class InvestimentSelectionController = _InvestimentSelectionController with _$InvestimentSelectionController;

abstract class _InvestimentSelectionController with Store {

  @observable
  bool investmentAligned = false;

  @action
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
