import 'package:equatable/equatable.dart';

class ProfileEntite  extends Equatable{
  final String? name;
  final String? color;
  final String? description;
  final String? recomendations;

  const ProfileEntite({required this.name, required this.color, required this.description, required this.recomendations});

  @override
  List<Object?> get props => [
    name, color, description, recomendations
  ];

}