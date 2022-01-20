import 'package:json_annotation/json_annotation.dart';

part 'profile_model.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class ProfileModel {
  final String name;
  final String username;
  final String email;
  final String password;
  final String? phoneNumber;
  final String? profilePic;
  final String? idToken;

  const ProfileModel({
    required this.name,
    required this.email,
    required this.username,
    required this.password,
    this.phoneNumber,
    this.profilePic,
    this.idToken,
  });

  factory ProfileModel.fromJson(Map<String, dynamic> json) =>
      _$ProfileModelFromJson(json);
  Map<String, dynamic> toJson() => _$ProfileModelToJson(this);
}
