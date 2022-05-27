// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'environment_model.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$EnvironmentModelCWProxy {
  EnvironmentModel appBuildNumber(String appBuildNumber);

  EnvironmentModel appVersion(String appVersion);

  EnvironmentModel appVersionOld(String appVersionOld);

  EnvironmentModel osType(EnvOsType osType);

  EnvironmentModel osTypeOld(EnvOsType osTypeOld);

  EnvironmentModel packageName(String packageName);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `EnvironmentModel(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// EnvironmentModel(...).copyWith(id: 12, name: "My name")
  /// ````
  EnvironmentModel call({
    String? appBuildNumber,
    String? appVersion,
    String? appVersionOld,
    EnvOsType? osType,
    EnvOsType? osTypeOld,
    String? packageName,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfEnvironmentModel.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfEnvironmentModel.copyWith.fieldName(...)`
class _$EnvironmentModelCWProxyImpl implements _$EnvironmentModelCWProxy {
  final EnvironmentModel _value;

  const _$EnvironmentModelCWProxyImpl(this._value);

  @override
  EnvironmentModel appBuildNumber(String appBuildNumber) =>
      this(appBuildNumber: appBuildNumber);

  @override
  EnvironmentModel appVersion(String appVersion) =>
      this(appVersion: appVersion);

  @override
  EnvironmentModel appVersionOld(String appVersionOld) =>
      this(appVersionOld: appVersionOld);

  @override
  EnvironmentModel osType(EnvOsType osType) => this(osType: osType);

  @override
  EnvironmentModel osTypeOld(EnvOsType osTypeOld) => this(osTypeOld: osTypeOld);

  @override
  EnvironmentModel packageName(String packageName) =>
      this(packageName: packageName);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `EnvironmentModel(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// EnvironmentModel(...).copyWith(id: 12, name: "My name")
  /// ````
  EnvironmentModel call({
    Object? appBuildNumber = const $CopyWithPlaceholder(),
    Object? appVersion = const $CopyWithPlaceholder(),
    Object? appVersionOld = const $CopyWithPlaceholder(),
    Object? osType = const $CopyWithPlaceholder(),
    Object? osTypeOld = const $CopyWithPlaceholder(),
    Object? packageName = const $CopyWithPlaceholder(),
  }) {
    return EnvironmentModel(
      appBuildNumber: appBuildNumber == const $CopyWithPlaceholder() ||
              appBuildNumber == null
          ? _value.appBuildNumber
          // ignore: cast_nullable_to_non_nullable
          : appBuildNumber as String,
      appVersion:
          appVersion == const $CopyWithPlaceholder() || appVersion == null
              ? _value.appVersion
              // ignore: cast_nullable_to_non_nullable
              : appVersion as String,
      appVersionOld:
          appVersionOld == const $CopyWithPlaceholder() || appVersionOld == null
              ? _value.appVersionOld
              // ignore: cast_nullable_to_non_nullable
              : appVersionOld as String,
      osType: osType == const $CopyWithPlaceholder() || osType == null
          ? _value.osType
          // ignore: cast_nullable_to_non_nullable
          : osType as EnvOsType,
      osTypeOld: osTypeOld == const $CopyWithPlaceholder() || osTypeOld == null
          ? _value.osTypeOld
          // ignore: cast_nullable_to_non_nullable
          : osTypeOld as EnvOsType,
      packageName:
          packageName == const $CopyWithPlaceholder() || packageName == null
              ? _value.packageName
              // ignore: cast_nullable_to_non_nullable
              : packageName as String,
    );
  }
}

extension $EnvironmentModelCopyWith on EnvironmentModel {
  /// Returns a callable class that can be used as follows: `instanceOfEnvironmentModel.copyWith(...)` or like so:`instanceOfEnvironmentModel.copyWith.fieldName(...)`.
  _$EnvironmentModelCWProxy get copyWith => _$EnvironmentModelCWProxyImpl(this);
}

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
