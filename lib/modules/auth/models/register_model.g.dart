// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'register_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RegisterModel _$RegisterModelFromJson(Map<String, dynamic> json) =>
    RegisterModel(
      name: json['name'] as String,
      email: json['email'] as String,
      username: json['username'] as String,
      password: json['password'] as String?,
      phoneNumber: json['phone_number'] as String?,
      profilePic: json['profile_pic'] as String?,
      idToken: json['id_token'] as String?,
      address: json['address'] as String?,
    );

Map<String, dynamic> _$RegisterModelToJson(RegisterModel instance) {
  final val = <String, dynamic>{
    'name': instance.name,
    'username': instance.username,
    'email': instance.email,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('password', instance.password);
  writeNotNull('phone_number', instance.phoneNumber);
  writeNotNull('profile_pic', instance.profilePic);
  writeNotNull('id_token', instance.idToken);
  writeNotNull('address', instance.address);
  return val;
}
