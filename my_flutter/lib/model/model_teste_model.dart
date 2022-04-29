//extender entite
import 'package:my_flutter/model/model_teste_entite.dart';

class ModelTeste extends ModelTesteEntite{

  ModelTeste({ required String? body,
    required String? token,
    required dynamic code}):super(body: body,token: token, code: code);

  factory ModelTeste.fromJson(Map<String, dynamic> json) => ModelTeste(
    body: json[ 'body'],
    token: json['token'],
    code: json['code']
  );

  Map<String, dynamic> toJson(){
   final Map<String, dynamic> data = new Map<String, dynamic>();
  data['body'] = this.body;
  data['token'] = this.token;
  data['code'] = this.code;
  return data;
  }
}