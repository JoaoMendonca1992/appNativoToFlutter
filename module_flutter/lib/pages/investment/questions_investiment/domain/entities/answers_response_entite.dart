import 'package:equatable/equatable.dart';

class AnswerResponseEntite extends Equatable{
  final String? questionId;
  final int? order;
  final String? answerId;
  final bool? success;

 const AnswerResponseEntite({required this.questionId,required this.order,required this.answerId,required this.success});

  @override
  List<Object?> get props =>[
    questionId, order,
    answerId, success
  ];
}