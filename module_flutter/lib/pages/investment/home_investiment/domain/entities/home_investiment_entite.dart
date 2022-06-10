import 'package:equatable/equatable.dart';
import 'package:module_flutter/pages/investment/home_investiment/domain/entities/investor_entite.dart';
import 'package:module_flutter/pages/investment/home_investiment/domain/entities/modalities_entite.dart';
import 'package:module_flutter/pages/investment/home_investiment/domain/entities/profile_entite.dart';

class HomeInvestimentEntite extends Equatable{
  final bool? success;
  final InvestorEntite? investor;
  final ProfileEntite? profile;
  final List<ModalitiesEntite>? modalities;

  const HomeInvestimentEntite({required this.success, required this.investor, required this.profile, required this.modalities});
 
  @override
  List<Object?> get props => [
    success, investor, profile, modalities
  ];

}