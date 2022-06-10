import 'package:module_flutter/pages/investment/questions_investiment/infra/models/answers_response_model.dart';
import 'package:module_flutter/pages/investment/questions_investiment/infra/models/question_data_model.dart';

abstract class IQuestionDatasource {
  Future<QuestionDataModel> get_next_question(int order);
  Future<AnswersResponseModel> set_question(String id, String idQuestion);
}