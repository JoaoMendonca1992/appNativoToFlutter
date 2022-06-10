import 'package:module_flutter/pages/investment/home_investiment/domain/entities/profile_entite.dart';

class ProfileModel extends ProfileEntite{
  ProfileModel({
    String? name,
    String? color,
    String? description,
    String? recomendations,
}):super(name: name, color: color, description: description, recomendations: recomendations);

  factory ProfileModel.fromJson(Map<String, dynamic> json) => ProfileModel(
      name : json['name'],
      color : json['color'],
      description : json['description'],
  recomendations : json['recomendations'],
  );

  Map<String, dynamic> toJson(){
   final Map<String, dynamic> data = new Map<String, dynamic>();
   data['name'] = this.name;
   data['color'] = this.color;
   data['description'] = this.description;
   data['recomendations'] = this.recomendations;
   return data;
  }
}