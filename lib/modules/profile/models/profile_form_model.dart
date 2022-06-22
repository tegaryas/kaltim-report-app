import 'package:json_annotation/json_annotation.dart';

part 'profile_form_model.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake, includeIfNull: false)
class ProfileFormModel {
  final String? name;
  final String? phoneNumber;
  final String? address;
  final String? profilePic;
  final String? deviceToken;

  const ProfileFormModel({
    this.name,
    this.phoneNumber,
    this.address,
    this.profilePic,
    this.deviceToken,
  });

  factory ProfileFormModel.fromJson(Map<String, dynamic> json) =>
      _$ProfileFormModelFromJson(json);
  Map<String, dynamic> toJson() => _$ProfileFormModelToJson(this);
}
