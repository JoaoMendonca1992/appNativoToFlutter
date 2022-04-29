
import 'package:equatable/equatable.dart';

class ModelTesteEntite extends Equatable{
  final String? body;
 final String? token;
 final dynamic? code;

  const ModelTesteEntite({required this.token, required this.body, required this.code});

  @override
  List<Object?> get props => [token, body, code];


}