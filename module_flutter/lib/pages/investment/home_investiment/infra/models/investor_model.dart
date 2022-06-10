//extender entite
import 'package:module_flutter/pages/investment/home_investiment/domain/entities/investor_entite.dart';
import 'package:module_flutter/pages/investment/home_investiment/infra/models/profile_model.dart';

class InvestorModel extends InvestorEntite{

  InvestorModel({
    String? name,
    String? document,
    int? amount,
    ProfileModel? profile,
}):super(name: name, document: document, amount: amount, profile: profile);

  factory InvestorModel.fromJson(Map<String, dynamic> json) => InvestorModel(
      name : json['name'],
      document : json['document'],
      amount : json['amount'],
      profile : json['profile'] != null ?  ProfileModel.fromJson(json['profile']) : null,
  );

  Map<String, dynamic> toJson(){
   final Map<String, dynamic> data = new Map<String, dynamic>();
   data['name'] = this.name;
   data['document'] = this.document;
   data['amount'] = this.amount;
    if (this.profile != null) {
    ProfileModel model = this.profile as ProfileModel;
    data['profile'] = model.toJson();
    }
  return data;
  }
}