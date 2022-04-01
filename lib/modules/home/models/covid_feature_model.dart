import 'package:json_annotation/json_annotation.dart';

part 'covid_feature_model.g.dart';

enum CovidFeatureType {
  covid,
  vaksin,
  @JsonValue("rumah_sakit")
  rumahSakit,
  unknown
}

@JsonSerializable(fieldRename: FieldRename.snake)
class CovidFeatureConfigModel {
  CovidFeatureConfigModel({
    required this.type,
    this.image,
    required this.title,
    required this.subtitle,
    required this.path,
    required this.route,
  });
  @JsonKey(
      defaultValue: CovidFeatureType.unknown,
      unknownEnumValue: CovidFeatureType.unknown)
  CovidFeatureType type;
  String? image;
  String title;
  String subtitle;
  String path;
  String route;

  factory CovidFeatureConfigModel.fromJson(Map<String, dynamic> json) =>
      _$CovidFeatureConfigModelFromJson(json);

  Map<String, dynamic> toJson() => _$CovidFeatureConfigModelToJson(this);
}
