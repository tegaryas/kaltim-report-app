import 'package:json_annotation/json_annotation.dart';

part 'feature_model.g.dart';

enum FeatureType {
  @JsonValue("SiMergency")
  siMergency,
  @JsonValue("SiBerita")
  siBerita,
  @JsonValue("SiDarurat")
  siDarurat,
  @JsonValue("SiLapor")
  siLapor,
  @JsonValue("Lainnya")
  lainnya,
  unknown
}

@JsonSerializable()
class FeatureModel {
  @JsonKey(
      defaultValue: FeatureType.unknown, unknownEnumValue: FeatureType.unknown)
  final FeatureType type;
  final String name;
  final String imageUrl;
  final bool enable;

  FeatureModel({
    required this.type,
    required this.name,
    required this.imageUrl,
    required this.enable,
  });

  factory FeatureModel.fromJson(Map<String, dynamic> json) =>
      _$FeatureModelFromJson(json);

  Map<String, dynamic> toJson() => _$FeatureModelToJson(this);
}
