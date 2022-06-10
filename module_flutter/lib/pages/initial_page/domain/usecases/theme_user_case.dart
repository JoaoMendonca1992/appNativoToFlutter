

import 'package:module_flutter/pages/initial_page/domain/repositories/theme_repository.dart';

abstract class ThemeUseCase {
  Future<dynamic>call();
}

class ThemeUseCaseimpl implements ThemeUseCase{

  final ThemeRepository repository;
  ThemeUseCaseimpl(this.repository);

  @override
  Future<dynamic> call() async{
    var model;
    var result = await repository.get_theme();
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