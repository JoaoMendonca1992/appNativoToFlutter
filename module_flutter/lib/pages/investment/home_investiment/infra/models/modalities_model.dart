import 'package:module_flutter/pages/investment/home_investiment/domain/entities/modalities_entite.dart';
import 'package:module_flutter/pages/investment/home_investiment/infra/models/profile_model.dart';

class ModalitiesModel extends ModalitiesEntite {

  const ModalitiesModel({
    ProfileModel? profile,
    String? name,
    String? description,
    double? profitabilityPerYear,
    String? redeem,
    double? fee,
    int? minimumInvestment,
    int? amount,
  }) :super(profile: profile,
      name: name,
      description: description,
      profitabilityPerYear: profitabilityPerYear,
      redeem: redeem,
      fee: fee,
      minimumInvestment: minimumInvestment,
      amount: amount);

  factory ModalitiesModel.fromJson(Map<String, dynamic> json) =>
      ModalitiesModel(
        profile: json['profile'] != null ? ProfileModel.fromJson(json['profile']) : null,
        name: json['name'],
        description: json['description'],
        profitabilityPerYear: json['profitabilityPerYear'],
        redeem: json['redeem'],
        fee: json['fee'],
        minimumInvestment: json['minimumInvestment'],
        amount: json['amount'],
      );

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.profile != null) {
      ProfileModel model = this.profile as ProfileModel;
      data['profile'] = model.toJson();
    }
    data['name'] = this.name;
    data['description'] = this.description;
    data['profitabilityPerYear'] = this.profitabilityPerYear;
    data['redeem'] = this.redeem;
    data['fee'] = this.fee;
    data['minimumInvestment'] = this.minimumInvestment;
    data['amount'] = this.amount;
    return data;
  }
}