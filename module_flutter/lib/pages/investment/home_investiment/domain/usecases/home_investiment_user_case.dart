import 'package:module_flutter/pages/investment/home_investiment/domain/repositories/home_investiment_repository.dart';

abstract class HomeInvestimentUseCase {
  Future<dynamic>call();
}

class HomeInvestimentUseCaseimpl implements HomeInvestimentUseCase{

  final HomeInvestimentRepository repository;
  HomeInvestimentUseCaseimpl(this.repository);

  @override
  Future<dynamic> call() async{
    var model;
    var result = await repository.get_home();
    result.fold((error){
      model = error;
    },
        (success) {
          model = success;
          return model;
        },
    );
    return model;
  }
}