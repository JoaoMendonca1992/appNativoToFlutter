
import 'package:dartz/dartz.dart';
import 'package:module_flutter/pages/initial_page/domain/entities/theme_entite.dart';
import 'package:module_flutter/utils/errors/errors_util.dart';

abstract class ThemeRepository{
  Future<Either<Failure,ThemeEntite>> get_theme();
}