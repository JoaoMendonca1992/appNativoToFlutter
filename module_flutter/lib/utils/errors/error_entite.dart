import 'package:equatable/equatable.dart';

class ErrorEntite extends Equatable{
  final bool? success;
  final int? code;
  final String? errorMessage;
  final dynamic data;

  const ErrorEntite({required this.success,required this.code,required this.errorMessage,required this.data});

  @override
  List<Object?> get props => [
    success, code, errorMessage,data
  ];
}