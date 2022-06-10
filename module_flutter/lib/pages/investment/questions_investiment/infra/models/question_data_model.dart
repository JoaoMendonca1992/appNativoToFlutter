import 'package:module_flutter/pages/investment/questions_investiment/domain/entities/question_data_entite.dart';
import 'package:module_flutter/pages/investment/questions_investiment/infra/models/question_model.dart';

class QuestionDataModel extends QuestionDataEntite{

  QuestionDataModel({
    QuestionModel? question,
    bool? success
}):super(question: question, success: success);

  factory QuestionDataModel.fromJson(Map<String, dynamic> json) => QuestionDataModel(
    question: json['question'] != null ? QuestionModel.fromJson(json['question']) : null,
    success: json['success']
  );

  Map<String, dynamic> toJson(){
   final Map<String, dynamic> data = new Map<String, dynamic>();
  data['question'] = this.question;
  data['success'] = this.success;
  return data;
  }
}