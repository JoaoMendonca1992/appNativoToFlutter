import 'package:equatable/equatable.dart';
import 'package:module_flutter/pages/investment/questions_investiment/domain/entities/answers_entite.dart';

class QuestionEntite extends Equatable{
  final String? key;
  final String? type;
  final String? kind;
  final int? order;
  final String? title;
  final List<AnswersEntite>? answers;
  final String? createdAt;
  final String? updatedAt;
  final String? id;
  final dynamic questionsLength;
  final dynamic questionPercentual;

  const QuestionEntite(
      {this.key,
        this.type,
        this.kind,
        this.order,
        this.title,
        this.answers,
        this.createdAt,
        this.updatedAt,
        this.id,
        this.questionsLength,
        this.questionPercentual});

  @override
  List<Object?> get props => [
    key, type, kind, order, title, answers, createdAt, updatedAt, id, questionsLength, questionPercentual];
}