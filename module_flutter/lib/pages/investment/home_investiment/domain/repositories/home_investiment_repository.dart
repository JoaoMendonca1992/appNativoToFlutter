
import 'package:dartz/dartz.dart';
import 'package:module_flutter/pages/initial_page/domain/entities/theme_entite.dart';
import 'package:module_flutter/pages/investment/home_investiment/domain/entities/home_investiment_entite.dart';
import 'package:module_flutter/utils/errors/errors_util.dart';

abstract class HomeInvestimentRepository{
  Future<Either<Failure,HomeInvestimentEntite>> get_home();
}