
import 'package:dartz/dartz.dart';
import 'package:module_flutter/pages/initial_page/domain/entities/theme_entite.dart';
import 'package:module_flutter/pages/initial_page/domain/errors/erros.dart';
import 'package:module_flutter/pages/initial_page/domain/repositories/theme_repository.dart';
import 'package:module_flutter/pages/initial_page/infra/datasources/theme_datasources.dart';
import 'package:module_flutter/utils/errors/errors_util.dart';

class ThemeRepositoryImpl implements ThemeRepository{

  final IThemeDatasource datasource;

  ThemeRepositoryImpl(this.datasource);

  @override
  Future<Either<Failure, ThemeEntite>> get_theme() async {
   final ThemeEntite themeEntite;
    try{
      themeEntite = await datasource.get_theme();
     return right(themeEntite);
   }catch(e){
     return left(ErrorRequest(e.toString()));
   }
  }
}