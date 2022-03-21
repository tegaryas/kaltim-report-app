import 'package:json_annotation/json_annotation.dart';

part 'feature_model.g.dart';

@JsonSerializable()
class FeatureModel {
  final String name;
  final String imageUrl;
  final bool enable;
  final String route;
  final String path;

  FeatureModel({
    required this.name,
    required this.imageUrl,
    required this.enable,
    required this.route,
    required this.path,
  });

  factory FeatureModel.fromJson(Map<String, dynamic> json) =>
      _$FeatureModelFromJson(json);

  Map<String, dynamic> toJson() => _$FeatureModelToJson(this);
}
