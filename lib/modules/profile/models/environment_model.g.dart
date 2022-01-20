// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'environment_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EnvironmentModel _$EnvironmentModelFromJson(Map<String, dynamic> json) =>
    EnvironmentModel(
      appBuildNumber: json['appBuildNumber'] as String,
      appVersion: json['appVersion'] as String,
      packageName: json['packageName'] as String,
      osType: $enumDecode(_$EnvOsTypeEnumMap, json['osType']),
      appVersionOld: json['appversion'] as String,
      osTypeOld: $enumDecode(_$EnvOsTypeEnumMap, json['ostype']),
    );

Map<String, dynamic> _$EnvironmentModelToJson(EnvironmentModel instance) =>
    <String, dynamic>{
      'appBuildNumber': instance.appBuildNumber,
      'appVersion': instance.appVersion,
      'packageName': instance.packageName,
      'osType': _$EnvOsTypeEnumMap[instance.osType],
      'appversion': instance.appVersionOld,
      'ostype': _$EnvOsTypeEnumMap[instance.osTypeOld],
    };

const _$EnvOsTypeEnumMap = {
  EnvOsType.android: 'android',
  EnvOsType.ios: 'ios',
  EnvOsType.web: 'web',
  EnvOsType.unknown: 'unknown',
};
