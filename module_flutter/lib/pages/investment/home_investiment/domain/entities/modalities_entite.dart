import 'package:equatable/equatable.dart';
import 'package:module_flutter/pages/investment/home_investiment/domain/entities/profile_entite.dart';

class ModalitiesEntite extends Equatable{
  final ProfileEntite? profile;
  final String? name;
  final String? description;
  final double? profitabilityPerYear;
  final String? redeem;
  final double? fee;
  final int? minimumInvestment;
  final int? amount;

  const ModalitiesEntite(
      {required this.profile,
        required this.name,
        required this.description,
        required this.profitabilityPerYear,
        required this.redeem,
        required this.fee,
        required this.minimumInvestment,
        required this.amount});
  @override
  List<Object?> get props => [
    profile, name, description, profitabilityPerYear, redeem, minimumInvestment, amount
  ];

}