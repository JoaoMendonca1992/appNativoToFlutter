import 'package:equatable/equatable.dart';
import 'package:module_flutter/pages/investment/questions_investiment/domain/entities/question_entite.dart';

class QuestionDataEntite extends Equatable {
  final QuestionEntite? question;
 final bool? success;

 const QuestionDataEntite({this.question, this.success});

  @override
  List<Object?> get props => [question, success];
}