import 'package:json_annotation/json_annotation.dart';

part 'emergency_call_model.g.dart';

@JsonSerializable()
class EmergencyCallModel {
  final String name;
  final int numberPhone;
  final String imageUrl;

  EmergencyCallModel({
    required this.name,
    required this.numberPhone,
    required this.imageUrl,
  });

  factory EmergencyCallModel.fromJson(Map<String, dynamic> json) =>
      _$EmergencyCallModelFromJson(json);

  Map<String, dynamic> toJson() => _$EmergencyCallModelToJson(this);
}
