// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profile_form_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProfileFormModel _$ProfileFormModelFromJson(Map<String, dynamic> json) =>
    ProfileFormModel(
      name: json['name'] as String?,
      phoneNumber: json['phone_number'] as String?,
      address: json['address'] as String?,
      profilePic: json['profile_pic'] as String?,
      deviceToken: json['device_token'] as String?,
    );

Map<String, dynamic> _$ProfileFormModelToJson(ProfileFormModel instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('name', instance.name);
  writeNotNull('phone_number', instance.phoneNumber);
  writeNotNull('address', instance.address);
  writeNotNull('profile_pic', instance.profilePic);
  writeNotNull('device_token', instance.deviceToken);
  return val;
}
