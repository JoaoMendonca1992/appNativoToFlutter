import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:module_flutter/pages/investment/home_investiment/infra/datasources/home_investiment_datasources.dart';
import 'package:module_flutter/pages/investment/home_investiment/infra/models/home_investiment_model.dart';
import 'package:module_flutter/pages/investment/questions_investiment/infra/models/answers_response_model.dart';
import 'package:module_flutter/pages/investment/questions_investiment/infra/models/question_data_model.dart';
import 'package:module_flutter/utils/constants/constants_backend.dart';
import 'package:module_flutter/utils/errors/error_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DioHomeInvestimentDatasourceImpl implements IHomeInvestimentDatasource{

  var dio = Dio();

  @override
  Future<HomeInvestimentModel> get_home() async{
    SharedPreferences prefs =  await SharedPreferences.getInstance();
    assert(prefs != null);
    var token = prefs.getString('token');
    try{
      dio.options.headers["authorization"] = "Bearer: ${token}";
      final response = await dio.get(BASE_URL + HOME_INVESTIMENT);
      final jsonResult = response.data;
      final HomeInvestimentModel model = HomeInvestimentModel.fromJson(jsonResult);
      log('SUCCESS get Home -----> '+ model.toString());
      return model;
    }on DioError catch (e) {
      var error = e.response!.data;
      ErrorModel errorModel = ErrorModel(success: error['success'], code: error['code'], errorMessage: error['error_message'], data: error['data']);
      log('ERROR get Home MESSAGE ----> ' + errorModel.errorMessage.toString());
      throw errorModel;
    }
  }
}