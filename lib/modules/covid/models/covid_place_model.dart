import 'package:json_annotation/json_annotation.dart';

part 'covid_place_model.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class CovidPlaceModel {
  final String id;
  final String name;

  CovidPlaceModel({required this.id, required this.name});

  factory CovidPlaceModel.fromJson(Map<String, dynamic> json) =>
      _$CovidPlaceModelFromJson(json);

  Map<String, dynamic> toJson() => _$CovidPlaceModelToJson(this);
}
