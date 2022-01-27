// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profile_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProfileModel _$ProfileModelFromJson(Map<String, dynamic> json) => ProfileModel(
      name: json['name'] as String,
      email: json['email'] as String,
      username: json['username'] as String,
      password: json['password'] as String,
      phoneNumber: json['phone_number'] as String?,
      profilePic: json['profile_pic'] as String?,
      idToken: json['id_token'] as String?,
      address: json['address'] as String?,
    );

Map<String, dynamic> _$ProfileModelToJson(ProfileModel instance) =>
    <String, dynamic>{
      'name': instance.name,
      'username': instance.username,
      'email': instance.email,
      'password': instance.password,
      'phone_number': instance.phoneNumber,
      'profile_pic': instance.profilePic,
      'id_token': instance.idToken,
      'address': instance.address,
    };
