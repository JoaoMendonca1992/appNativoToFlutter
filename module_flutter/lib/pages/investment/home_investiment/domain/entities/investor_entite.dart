import 'package:equatable/equatable.dart';
import 'package:module_flutter/pages/investment/home_investiment/domain/entities/profile_entite.dart';

class InvestorEntite extends Equatable{
  final String? name;
  final String? document;
  final int? amount;
  final ProfileEntite? profile;

  const InvestorEntite({required this.name, required this.document, required this.amount, required this.profile});
  
  @override
  List<Object?> get props => [name, document, amount, profile];

}