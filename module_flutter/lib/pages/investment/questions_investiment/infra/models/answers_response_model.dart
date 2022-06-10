import 'package:module_flutter/pages/investment/questions_investiment/domain/entities/answers_response_entite.dart';

class AnswersResponseModel extends AnswerResponseEntite{

  AnswersResponseModel({
    required String? questionId,
    required int? order,
    required String? answerId,
    required bool? success,
}):super(
    questionId: questionId, order: order,
    answerId: answerId, success: success
  );

  factory AnswersResponseModel.fromJson(Map<String, dynamic> json) => AnswersResponseModel(
    questionId: json['questionId'],
    order: json['order'],
    answerId: json['answerId'],
    success: json['success'],
  );

  Map<String, dynamic> toJson(){
   final Map<String, dynamic> data = new Map<String, dynamic>();
   data['questionId'] = this.questionId;
   data['order'] = this.order;
   data['answerId'] = this.answerId;
   data['success'] = this.success;
  return data;
  }
}