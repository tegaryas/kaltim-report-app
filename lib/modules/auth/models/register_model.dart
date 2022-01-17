import 'package:json_annotation/json_annotation.dart';

part 'register_model.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class RegisterModel {
  final String name;
  final String username;
  final String email;
  final String password;
  final String? phoneNumber;
  final String? profilePic;
  final String? idToken;

  const RegisterModel({
    required this.name,
    required this.email,
    required this.username,
    required this.password,
    this.phoneNumber,
    this.profilePic,
    this.idToken,
  });

  factory RegisterModel.fromJson(Map<String, dynamic> json) =>
      _$RegisterModelFromJson(json);
  Map<String, dynamic> toJson() => _$RegisterModelToJson(this);
}
