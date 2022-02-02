// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'feature_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FeatureModel _$FeatureModelFromJson(Map<String, dynamic> json) => FeatureModel(
      type: $enumDecodeNullable(_$FeatureTypeEnumMap, json['type'],
              unknownValue: FeatureType.unknown) ??
          FeatureType.unknown,
      name: json['name'] as String,
      imageUrl: json['imageUrl'] as String,
      enable: json['enable'] as bool,
    );

Map<String, dynamic> _$FeatureModelToJson(FeatureModel instance) =>
    <String, dynamic>{
      'type': _$FeatureTypeEnumMap[instance.type],
      'name': instance.name,
      'imageUrl': instance.imageUrl,
      'enable': instance.enable,
    };

const _$FeatureTypeEnumMap = {
  FeatureType.siMergency: 'SiMergency',
  FeatureType.siBerita: 'SiBerita',
  FeatureType.siDarurat: 'SiDarurat',
  FeatureType.siLapor: 'SiLapor',
  FeatureType.lainnya: 'Lainnya',
  FeatureType.unknown: 'unknown',
};
