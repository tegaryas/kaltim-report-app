import 'package:json_annotation/json_annotation.dart';

part 'emergency_call_model.g.dart';

@JsonSerializable()
class EmergencyCallModel {
  final String name;
  final int numberPhone;

  EmergencyCallModel({
    required this.name,
    required this.numberPhone,
  });

  factory EmergencyCallModel.fromJson(Map<String, dynamic> json) =>
      _$EmergencyCallModelFromJson(json);

  Map<String, dynamic> toJson() => _$EmergencyCallModelToJson(this);
}
