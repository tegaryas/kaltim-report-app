import 'package:json_annotation/json_annotation.dart';
import 'package:copy_with_extension/copy_with_extension.dart';

part 'environment_model.g.dart';

enum EnvOsType { android, ios, web, unknown }

@JsonSerializable(includeIfNull: false)
@CopyWith()
class EnvironmentModel {
  final String appBuildNumber;
  final String appVersion;
  final String packageName;
  final EnvOsType osType;
  //deprecating for backward compatibility
  @JsonKey(name: "appversion")
  final String appVersionOld;
  @JsonKey(name: "ostype")
  final EnvOsType osTypeOld;

  EnvironmentModel(
      {required this.appBuildNumber,
      required this.appVersion,
      required this.packageName,
      required this.osType,
      required this.appVersionOld,
      required this.osTypeOld});

  factory EnvironmentModel.fromJson(Map<String, dynamic> json) =>
      _$EnvironmentModelFromJson(json);
  Map<String, dynamic> toJson() => _$EnvironmentModelToJson(this);
}
