import 'package:module_flutter/utils/errors/errors_util.dart';

class ErrorModel extends Failure{
  bool? success;
  int? code;
  String? errorMessage;
  dynamic? data;

  ErrorModel({this.success, this.code, this.errorMessage, this.data});

  factory ErrorModel.fromJson(Map<String, dynamic> json) => ErrorModel(
    success: json['success'],
    code: json['code'],
    errorMessage: json['error_message'],
    data: json['data'],
  );

  Map<String, dynamic> toJson(){
   final Map<String, dynamic> data = new Map<String, dynamic>();
  data['success'] = this.success;
  data['code'] = this.code;
  data['error_message'] = this.errorMessage;
  data['data'] = this.data;
  return data;
  }
}