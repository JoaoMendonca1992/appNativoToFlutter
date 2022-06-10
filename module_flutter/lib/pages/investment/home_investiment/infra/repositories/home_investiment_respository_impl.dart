
import 'package:dartz/dartz.dart';
import 'package:module_flutter/pages/investment/home_investiment/domain/entities/home_investiment_entite.dart';
import 'package:module_flutter/pages/investment/home_investiment/domain/repositories/home_investiment_repository.dart';
import 'package:module_flutter/pages/investment/home_investiment/infra/datasources/home_investiment_datasources.dart';
import 'package:module_flutter/utils/errors/error_model.dart';
import 'package:module_flutter/utils/errors/errors_util.dart';

class HomeInvestimentRepositoryImpl implements HomeInvestimentRepository{

  final IHomeInvestimentDatasource datasource;

  HomeInvestimentRepositoryImpl(this.datasource);

  @override
  Future<Either<Failure, HomeInvestimentEntite>> get_home() async{
    final HomeInvestimentEntite homeInvestimentEntite;
    try{
      homeInvestimentEntite = await datasource.get_home();
      return right(homeInvestimentEntite);
    }catch(e){
      if(e is ErrorModel){
        ErrorModel error = e;
        return left(error);
      }
      return left(Failure());
    }
  }
}