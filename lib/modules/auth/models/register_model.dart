import 'package:json_annotation/json_annotation.dart';

part 'register_model.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake, includeIfNull: false)
class RegisterModel {
  final String name;
  final String username;
  final String email;
  final String? password;
  final String? phoneNumber;
  final String? profilePic;
  final String? idToken;
  final String? address;

  const RegisterModel({
    required this.name,
    required this.email,
    required this.username,
    this.password,
    this.phoneNumber,
    this.profilePic,
    this.idToken,
    this.address,
  });

  factory RegisterModel.fromJson(Map<String, dynamic> json) =>
      _$RegisterModelFromJson(json);
  Map<String, dynamic> toJson() => _$RegisterModelToJson(this);
}
