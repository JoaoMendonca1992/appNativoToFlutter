import 'package:module_flutter/pages/investment/questions_investiment/domain/entities/question_entite.dart';
import 'package:module_flutter/pages/investment/questions_investiment/infra/models/answers_model.dart';

class QuestionModel extends QuestionEntite {

  QuestionModel({
    required String? key,
    required String? type,
    required String? kind,
    required int? order,
    required String? title,
    required List<AnswersModel>? answers,
    required String? createdAt,
    required String? updatedAt,
    required String? id,
    required dynamic questionsLength,
    required dynamic questionPercentual,
  }) :super(key: key,
      type: type,
      kind: kind,
      order: order,
      title: title,
      answers: answers,
      createdAt: createdAt,
      updatedAt: updatedAt,
      id: id,
      questionsLength: questionsLength,
      questionPercentual: questionPercentual);

  factory QuestionModel.fromJson(Map<String, dynamic> json) =>
      QuestionModel(
        key: json['key'],
        type: json['type'],
        kind: json['kind'],
        order: json['order'],
        title: json['title'],
        answers: (json['answers'] as List<dynamic>).map((e) => AnswersModel.fromJson(e as Map<String, dynamic>)).toList(),
        createdAt: json['createdAt'],
        updatedAt: json['updatedAt'],
        id: json['id'],
        questionsLength: json['questionsLength'],
        questionPercentual: json['questionPercentual'],
      );

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['key'] = this.key;
    data['type'] = this.type;
    data['kind'] = this.kind;
    data['order'] = this.order;
    data['title'] = this.title;
    if(this.answers != null){
      List<AnswersModel> list = this.answers as List<AnswersModel>;
      data['answers'] = list.map((v) => v.toJson()).toList();
    }
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['id'] = this.id;
    data['questionsLength'] = this.questionsLength;
    data['questionPercentual'] = this.questionPercentual;
    return data;
  }
}