// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profile_model.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$ProfileModelCWProxy {
  ProfileModel address(String? address);

  ProfileModel deviceToken(String? deviceToken);

  ProfileModel email(String email);

  ProfileModel idToken(String? idToken);

  ProfileModel name(String name);

  ProfileModel password(String password);

  ProfileModel phoneNumber(String? phoneNumber);

  ProfileModel profilePic(String? profilePic);

  ProfileModel role(UserRole role);

  ProfileModel username(String username);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `ProfileModel(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// ProfileModel(...).copyWith(id: 12, name: "My name")
  /// ````
  ProfileModel call({
    String? address,
    String? deviceToken,
    String? email,
    String? idToken,
    String? name,
    String? password,
    String? phoneNumber,
    String? profilePic,
    UserRole? role,
    String? username,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfProfileModel.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfProfileModel.copyWith.fieldName(...)`
class _$ProfileModelCWProxyImpl implements _$ProfileModelCWProxy {
  final ProfileModel _value;

  const _$ProfileModelCWProxyImpl(this._value);

  @override
  ProfileModel address(String? address) => this(address: address);

  @override
  ProfileModel deviceToken(String? deviceToken) =>
      this(deviceToken: deviceToken);

  @override
  ProfileModel email(String email) => this(email: email);

  @override
  ProfileModel idToken(String? idToken) => this(idToken: idToken);

  @override
  ProfileModel name(String name) => this(name: name);

  @override
  ProfileModel password(String password) => this(password: password);

  @override
  ProfileModel phoneNumber(String? phoneNumber) =>
      this(phoneNumber: phoneNumber);

  @override
  ProfileModel profilePic(String? profilePic) => this(profilePic: profilePic);

  @override
  ProfileModel role(UserRole role) => this(role: role);

  @override
  ProfileModel username(String username) => this(username: username);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `ProfileModel(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// ProfileModel(...).copyWith(id: 12, name: "My name")
  /// ````
  ProfileModel call({
    Object? address = const $CopyWithPlaceholder(),
    Object? deviceToken = const $CopyWithPlaceholder(),
    Object? email = const $CopyWithPlaceholder(),
    Object? idToken = const $CopyWithPlaceholder(),
    Object? name = const $CopyWithPlaceholder(),
    Object? password = const $CopyWithPlaceholder(),
    Object? phoneNumber = const $CopyWithPlaceholder(),
    Object? profilePic = const $CopyWithPlaceholder(),
    Object? role = const $CopyWithPlaceholder(),
    Object? username = const $CopyWithPlaceholder(),
  }) {
    return ProfileModel(
      address: address == const $CopyWithPlaceholder()
          ? _value.address
          // ignore: cast_nullable_to_non_nullable
          : address as String?,
      deviceToken: deviceToken == const $CopyWithPlaceholder()
          ? _value.deviceToken
          // ignore: cast_nullable_to_non_nullable
          : deviceToken as String?,
      email: email == const $CopyWithPlaceholder() || email == null
          ? _value.email
          // ignore: cast_nullable_to_non_nullable
          : email as String,
      idToken: idToken == const $CopyWithPlaceholder()
          ? _value.idToken
          // ignore: cast_nullable_to_non_nullable
          : idToken as String?,
      name: name == const $CopyWithPlaceholder() || name == null
          ? _value.name
          // ignore: cast_nullable_to_non_nullable
          : name as String,
      password: password == const $CopyWithPlaceholder() || password == null
          ? _value.password
          // ignore: cast_nullable_to_non_nullable
          : password as String,
      phoneNumber: phoneNumber == const $CopyWithPlaceholder()
          ? _value.phoneNumber
          // ignore: cast_nullable_to_non_nullable
          : phoneNumber as String?,
      profilePic: profilePic == const $CopyWithPlaceholder()
          ? _value.profilePic
          // ignore: cast_nullable_to_non_nullable
          : profilePic as String?,
      role: role == const $CopyWithPlaceholder() || role == null
          ? _value.role
          // ignore: cast_nullable_to_non_nullable
          : role as UserRole,
      username: username == const $CopyWithPlaceholder() || username == null
          ? _value.username
          // ignore: cast_nullable_to_non_nullable
          : username as String,
    );
  }
}

extension $ProfileModelCopyWith on ProfileModel {
  /// Returns a callable class that can be used as follows: `instanceOfProfileModel.copyWith(...)` or like so:`instanceOfProfileModel.copyWith.fieldName(...)`.
  _$ProfileModelCWProxy get copyWith => _$ProfileModelCWProxyImpl(this);
}

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
      role: $enumDecodeNullable(_$UserRoleEnumMap, json['role'],
              unknownValue: UserRole.unknown) ??
          UserRole.unknown,
      deviceToken: json['device_token'] as String?,
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
      'device_token': instance.deviceToken,
      'role': _$UserRoleEnumMap[instance.role],
    };

const _$UserRoleEnumMap = {
  UserRole.admin: 'admin',
  UserRole.user: 'user',
  UserRole.unknown: 'unknown',
};
