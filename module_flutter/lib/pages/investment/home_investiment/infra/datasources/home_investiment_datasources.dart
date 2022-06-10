
import 'package:module_flutter/pages/investment/home_investiment/infra/models/home_investiment_model.dart';

abstract class IHomeInvestimentDatasource{
  Future<HomeInvestimentModel> get_home();
}