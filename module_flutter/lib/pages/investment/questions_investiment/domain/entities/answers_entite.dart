import 'package:equatable/equatable.dart';

class AnswersEntite extends Equatable{
  final String? content;
  final String? sId;

  bool? selected = false;

   AnswersEntite({this.content, this.sId});

  @override
  List<Object?> get props => [content, sId];
}