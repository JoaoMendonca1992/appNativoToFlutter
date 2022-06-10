import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:module_flutter/pages/initial_page/domain/errors/erros.dart';
import 'package:module_flutter/pages/initial_page/infra/datasources/theme_datasources.dart';
import 'package:module_flutter/pages/initial_page/infra/models/theme_model.dart';
import 'package:module_flutter/utils/constants/constants_backend.dart';
import 'package:module_flutter/utils/errors/error_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DioThemeDatasourceImpl implements IThemeDatasource{

  var dio = Dio();

  @override
  Future<ThemeModel> get_theme() async{
    await get_auth();
    try{
      final response = await dio.get(BASE_URL + ROUTE_THEME);
      final jsonResult = response.data;
      final ThemeModel model = ThemeModel.fromJson(jsonResult);
      return model;
    }catch(e){
      throw ErrorRequest(e.toString());
    }
  }

  @override
  Future<dynamic> get_auth() async{
    SharedPreferences prefs =  await SharedPreferences.getInstance();
    try{
      final response = await dio.post(BASE_URL + AUTH_INVESTORS);
      final jsonResult = response.data;
      prefs.setString('token',jsonResult['token']!);
      return jsonResult;
    }on DioError catch (e) {
      var error = e.response!.data;
      ErrorModel errorModel = ErrorModel(success: error['success'], code: error['code'], errorMessage: error['error_message'], data: error['data']);
      log('ERROR COMPANY MESSAGE ----> ' + errorModel.errorMessage.toString());
      throw errorModel;
    }
  }
}