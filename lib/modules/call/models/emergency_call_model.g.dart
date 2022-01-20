// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'emergency_call_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EmergencyCallModel _$EmergencyCallModelFromJson(Map<String, dynamic> json) =>
    EmergencyCallModel(
      name: json['name'] as String,
      numberPhone: json['numberPhone'] as int,
      imageUrl: json['imageUrl'] as String,
    );

Map<String, dynamic> _$EmergencyCallModelToJson(EmergencyCallModel instance) =>
    <String, dynamic>{
      'name': instance.name,
      'numberPhone': instance.numberPhone,
      'imageUrl': instance.imageUrl,
    };
