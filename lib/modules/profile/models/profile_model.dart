import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'profile_model.g.dart';

enum UserRole {
  admin,
  user,
  unknown,
}

@CopyWith()
@JsonSerializable(fieldRename: FieldRename.snake)
class ProfileModel {
  final String name;
  final String username;
  final String email;
  final String password;
  final String? phoneNumber;
  final String? profilePic;
  final String? idToken;
  final String? address;
  @JsonKey(defaultValue: UserRole.unknown, unknownEnumValue: UserRole.unknown)
  final UserRole role;

  const ProfileModel({
    required this.name,
    required this.email,
    required this.username,
    required this.password,
    this.phoneNumber,
    this.profilePic,
    this.idToken,
    this.address,
    required this.role,
  });

  bool get isPhoneNumberExist {
    return phoneNumber != null;
  }

  factory ProfileModel.fromJson(Map<String, dynamic> json) =>
      _$ProfileModelFromJson(json);
  Map<String, dynamic> toJson() => _$ProfileModelToJson(this);
}
