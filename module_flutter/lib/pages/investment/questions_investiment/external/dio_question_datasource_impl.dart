import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:module_flutter/pages/investment/questions_investiment/infra/datasources/question_datasources.dart';
import 'package:module_flutter/pages/investment/questions_investiment/infra/models/answers_response_model.dart';
import 'package:module_flutter/pages/investment/questions_investiment/infra/models/question_data_model.dart';
import 'package:module_flutter/utils/constants/constants_backend.dart';
import 'package:module_flutter/utils/errors/error_model.dart';
import 'package:module_flutter/utils/errors/errors_util.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DioQuestionDatasourceImpl implements IQuestionDatasource{

  var dio = Dio();

  @override
  Future<QuestionDataModel> get_next_question(int order) async {
    SharedPreferences prefs =  await SharedPreferences.getInstance();
    assert(prefs != null);
    var token = prefs.getString('token');
    try{
      dio.options.headers["authorization"] = "Bearer: ${token}";
      final response = await dio.get(BASE_URL + NEXT_QUESTIONS, queryParameters: {'order': order});
      final jsonResult = response.data;
      final QuestionDataModel model = QuestionDataModel.fromJson(jsonResult);
      log('SUCCESS next question -----> '+ model.toString());
      return model;
    }on DioError catch (e) {
      if(e is ErrorModel){
        log('ERROR get question MESSAGE ----> ' + e.response!.data.toString());
        var error = e.response!.data;
        ErrorModel errorModel = ErrorModel(success: error['success'], code: error['code'], errorMessage: error['error_message'], data: error['data']);
        log('ERROR get question MESSAGE ----> ' + errorModel.errorMessage.toString());
        throw errorModel;
      }else{
        var error = e.response!.data;
        log('ERROR get question MESSAGE Failure ----> ' + error.response!.data.toString());
        throw Failure();
      }

    }
  }

  @override
  Future<AnswersResponseModel> set_question(String id, String idQuestion) async{
    Object obj = id.replaceAll("\"", "") as Object;
    try{
      final response = await dio.put(BASE_URL + SET_QUESTION + id, queryParameters: {'questionId': obj}, data:{'answerId' : idQuestion },);
      final jsonResult = response.data;
      final AnswersResponseModel model = AnswersResponseModel.fromJson(jsonResult);
      log('SUCCESS set_question-----> '+ model.toString());
      return model;
    }on DioError catch (e) {
      var error = e.response!.data;
      ErrorModel errorModel = ErrorModel(success: error['success'], code: error['code'], errorMessage: error['error_message'], data: error['data']);
      log('ERROR Set question MESSAGE ----> ' + errorModel.errorMessage.toString());
      throw errorModel;
    }
  }
}