

import 'package:module_flutter/pages/investment/questions_investiment/domain/repositories/question_repository.dart';

abstract class QuestionUseCase {
  Future<dynamic>next_question(int order);
  Future<dynamic> set_question(String id, String idQuestion);
}

class QuestionUseCaseimpl implements QuestionUseCase{

  final QuestionRepository repository;
  QuestionUseCaseimpl(this.repository);

  @override
  Future<dynamic> next_question(int order) async{
    var model;
    var result = await repository.get_next_question(order);
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

  @override
  Future set_question(String id, String idQuestion) async{
    var model;
    var result = await repository.set_question(id, idQuestion);
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