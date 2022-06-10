
import 'package:dartz/dartz.dart';
import 'package:module_flutter/pages/investment/questions_investiment/domain/entities/answers_response_entite.dart';
import 'package:module_flutter/pages/investment/questions_investiment/domain/entities/question_data_entite.dart';
import 'package:module_flutter/pages/investment/questions_investiment/domain/repositories/question_repository.dart';
import 'package:module_flutter/pages/investment/questions_investiment/infra/datasources/question_datasources.dart';
import 'package:module_flutter/utils/errors/error_model.dart';
import 'package:module_flutter/utils/errors/errors_util.dart';

class QuestionRepositoryImpl implements QuestionRepository{

  final IQuestionDatasource datasource;

  QuestionRepositoryImpl(this.datasource);

  @override
  Future<Either<Failure, QuestionDataEntite>> get_next_question(int order) async {
    final QuestionDataEntite questionDataEntite;
    try{
      questionDataEntite = await datasource.get_next_question(order);
      return right(questionDataEntite);
    }catch(e){
      if(e is ErrorModel){
        ErrorModel error = e;
        return left(error);
      }
      return left(Failure());
    }
  }

  @override
  Future<Either<Failure, AnswerResponseEntite>> set_question(String id, String idQuestion) async {
    final AnswerResponseEntite answerResponseEntite;
    try{
      answerResponseEntite = await datasource.set_question(id, idQuestion);
      return right(answerResponseEntite);
    }catch(e){
      if(e is ErrorModel){
        ErrorModel error = e;
        return left(error);
      }
      return left(Failure());
    }
  }
}