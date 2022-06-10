
import 'package:dartz/dartz.dart';
import 'package:module_flutter/pages/initial_page/domain/entities/theme_entite.dart';
import 'package:module_flutter/pages/investment/questions_investiment/domain/entities/answers_response_entite.dart';
import 'package:module_flutter/pages/investment/questions_investiment/domain/entities/question_data_entite.dart';
import 'package:module_flutter/utils/errors/errors_util.dart';

abstract class QuestionRepository{
  Future<Either<Failure,QuestionDataEntite>> get_next_question(int order);
  Future<Either<Failure,AnswerResponseEntite>> set_question(String id, String idQuestion);
}