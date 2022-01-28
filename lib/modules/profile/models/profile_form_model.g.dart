// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profile_form_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProfileFormModel _$ProfileFormModelFromJson(Map<String, dynamic> json) =>
    ProfileFormModel(
      name: json['name'] as String,
      phoneNumber: json['phone_number'] as String?,
      address: json['address'] as String?,
    );

Map<String, dynamic> _$ProfileFormModelToJson(ProfileFormModel instance) =>
    <String, dynamic>{
      'name': instance.name,
      'phone_number': instance.phoneNumber,
      'address': instance.address,
    };
