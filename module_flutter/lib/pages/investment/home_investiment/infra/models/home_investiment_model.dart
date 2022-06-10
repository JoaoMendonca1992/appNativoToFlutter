//extender entite
import 'package:module_flutter/pages/investment/home_investiment/domain/entities/home_investiment_entite.dart';
import 'package:module_flutter/pages/investment/home_investiment/infra/models/investor_model.dart';
import 'package:module_flutter/pages/investment/home_investiment/infra/models/modalities_model.dart';
import 'package:module_flutter/pages/investment/home_investiment/infra/models/profile_model.dart';

class HomeInvestimentModel extends HomeInvestimentEntite {
  const HomeInvestimentModel({
    bool? success,
    InvestorModel? investor,
    ProfileModel? profile,
    List<ModalitiesModel>? modalities,
  }) : super(
            success: success,
            investor: investor,
            profile: profile,
            modalities: modalities);

  factory HomeInvestimentModel.fromJson(Map<String, dynamic> json) =>
      HomeInvestimentModel(
        success: json['success'],
        investor: json['investor'] != null
            ? new InvestorModel.fromJson(json['investor'])
            : null,
        profile: json['profile'] != null
            ? new ProfileModel.fromJson(json['profile'])
            : null,
        modalities: (json['modalities'] as List<dynamic>)
            .map((e) => ModalitiesModel.fromJson(e as Map<String, dynamic>))
            .toList(),
      );

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    if (this.investor != null) {
      InvestorModel model = this.investor as InvestorModel;
      data['investor'] = model.toJson();
    }
    if (this.profile != null) {
      ProfileModel model = this.profile as ProfileModel;
      data['profile'] = model.toJson();
    }
    if (this.modalities != null) {
      List<ModalitiesModel> list = this.modalities as List<ModalitiesModel>;
      data['modalities'] = list.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
