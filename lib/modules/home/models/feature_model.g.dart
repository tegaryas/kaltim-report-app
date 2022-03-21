// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'feature_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FeatureModel _$FeatureModelFromJson(Map<String, dynamic> json) => FeatureModel(
      name: json['name'] as String,
      imageUrl: json['imageUrl'] as String,
      enable: json['enable'] as bool,
      route: json['route'] as String,
      path: json['path'] as String,
    );

Map<String, dynamic> _$FeatureModelToJson(FeatureModel instance) =>
    <String, dynamic>{
      'name': instance.name,
      'imageUrl': instance.imageUrl,
      'enable': instance.enable,
      'route': instance.route,
      'path': instance.path,
    };
