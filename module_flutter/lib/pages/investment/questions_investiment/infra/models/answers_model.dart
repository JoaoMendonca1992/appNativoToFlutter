import 'package:module_flutter/pages/investment/questions_investiment/domain/entities/answers_entite.dart';

class AnswersModel extends AnswersEntite{

  AnswersModel({
    required String? content,
   required String? sId,
}):super(content: content, sId: sId);

  factory AnswersModel.fromJson(Map<String, dynamic> json) => AnswersModel(
    content: json['content'],
    sId: json['_id'],
  );

  Map<String, dynamic> toJson(){
   final Map<String, dynamic> data = new Map<String, dynamic>();
  data['content'] = this.content;
  data['_id'] = this.sId;
  return data;
  }
}