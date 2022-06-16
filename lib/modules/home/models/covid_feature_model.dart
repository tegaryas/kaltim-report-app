import 'package:json_annotation/json_annotation.dart';

part 'covid_feature_model.g.dart';

enum CovidFeatureType {
  covid,
  vaksin,
  @JsonValue("rumah_sakit")
  rumahSakit,
  unknown
}

enum FeatureActionType { url, screen, unknown }

@JsonSerializable(fieldRename: FieldRename.snake)
class CovidFeatureConfigModel {
  CovidFeatureConfigModel({
    required this.type,
    this.image,
    required this.title,
    required this.subtitle,
    this.path,
    required this.route,
    required this.actionType,
  });
  @JsonKey(
      defaultValue: CovidFeatureType.unknown,
      unknownEnumValue: CovidFeatureType.unknown)
  final CovidFeatureType type;
  final String? image;
  final String title;
  final String subtitle;
  final String? path;
  final String route;
  final FeatureActionType actionType;

  factory CovidFeatureConfigModel.fromJson(Map<String, dynamic> json) =>
      _$CovidFeatureConfigModelFromJson(json);

  Map<String, dynamic> toJson() => _$CovidFeatureConfigModelToJson(this);
}
