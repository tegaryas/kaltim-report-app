// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'report_form_model.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$ReportFormModelCWProxy {
  ReportFormModel address(String address);

  ReportFormModel category(String? category);

  ReportFormModel dateInput(DateTime dateInput);

  ReportFormModel description(String? description);

  ReportFormModel id(String id);

  ReportFormModel imageUrl(String imageUrl);

  ReportFormModel location(GeoPoint location);

  ReportFormModel problem(String problem);

  ReportFormModel reportProgress(List<ReportProgressModel> reportProgress);

  ReportFormModel userId(String? userId);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `ReportFormModel(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// ReportFormModel(...).copyWith(id: 12, name: "My name")
  /// ````
  ReportFormModel call({
    String? address,
    String? category,
    DateTime? dateInput,
    String? description,
    String? id,
    String? imageUrl,
    GeoPoint? location,
    String? problem,
    List<ReportProgressModel>? reportProgress,
    String? userId,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfReportFormModel.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfReportFormModel.copyWith.fieldName(...)`
class _$ReportFormModelCWProxyImpl implements _$ReportFormModelCWProxy {
  final ReportFormModel _value;

  const _$ReportFormModelCWProxyImpl(this._value);

  @override
  ReportFormModel address(String address) => this(address: address);

  @override
  ReportFormModel category(String? category) => this(category: category);

  @override
  ReportFormModel dateInput(DateTime dateInput) => this(dateInput: dateInput);

  @override
  ReportFormModel description(String? description) =>
      this(description: description);

  @override
  ReportFormModel id(String id) => this(id: id);

  @override
  ReportFormModel imageUrl(String imageUrl) => this(imageUrl: imageUrl);

  @override
  ReportFormModel location(GeoPoint location) => this(location: location);

  @override
  ReportFormModel problem(String problem) => this(problem: problem);

  @override
  ReportFormModel reportProgress(List<ReportProgressModel> reportProgress) =>
      this(reportProgress: reportProgress);

  @override
  ReportFormModel userId(String? userId) => this(userId: userId);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `ReportFormModel(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// ReportFormModel(...).copyWith(id: 12, name: "My name")
  /// ````
  ReportFormModel call({
    Object? address = const $CopyWithPlaceholder(),
    Object? category = const $CopyWithPlaceholder(),
    Object? dateInput = const $CopyWithPlaceholder(),
    Object? description = const $CopyWithPlaceholder(),
    Object? id = const $CopyWithPlaceholder(),
    Object? imageUrl = const $CopyWithPlaceholder(),
    Object? location = const $CopyWithPlaceholder(),
    Object? problem = const $CopyWithPlaceholder(),
    Object? reportProgress = const $CopyWithPlaceholder(),
    Object? userId = const $CopyWithPlaceholder(),
  }) {
    return ReportFormModel(
      address: address == const $CopyWithPlaceholder() || address == null
          ? _value.address
          // ignore: cast_nullable_to_non_nullable
          : address as String,
      category: category == const $CopyWithPlaceholder()
          ? _value.category
          // ignore: cast_nullable_to_non_nullable
          : category as String?,
      dateInput: dateInput == const $CopyWithPlaceholder() || dateInput == null
          ? _value.dateInput
          // ignore: cast_nullable_to_non_nullable
          : dateInput as DateTime,
      description: description == const $CopyWithPlaceholder()
          ? _value.description
          // ignore: cast_nullable_to_non_nullable
          : description as String?,
      id: id == const $CopyWithPlaceholder() || id == null
          ? _value.id
          // ignore: cast_nullable_to_non_nullable
          : id as String,
      imageUrl: imageUrl == const $CopyWithPlaceholder() || imageUrl == null
          ? _value.imageUrl
          // ignore: cast_nullable_to_non_nullable
          : imageUrl as String,
      location: location == const $CopyWithPlaceholder() || location == null
          ? _value.location
          // ignore: cast_nullable_to_non_nullable
          : location as GeoPoint,
      problem: problem == const $CopyWithPlaceholder() || problem == null
          ? _value.problem
          // ignore: cast_nullable_to_non_nullable
          : problem as String,
      reportProgress: reportProgress == const $CopyWithPlaceholder() ||
              reportProgress == null
          ? _value.reportProgress
          // ignore: cast_nullable_to_non_nullable
          : reportProgress as List<ReportProgressModel>,
      userId: userId == const $CopyWithPlaceholder()
          ? _value.userId
          // ignore: cast_nullable_to_non_nullable
          : userId as String?,
    );
  }
}

extension $ReportFormModelCopyWith on ReportFormModel {
  /// Returns a callable class that can be used as follows: `instanceOfReportFormModel.copyWith(...)` or like so:`instanceOfReportFormModel.copyWith.fieldName(...)`.
  _$ReportFormModelCWProxy get copyWith => _$ReportFormModelCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ReportFormModel _$ReportFormModelFromJson(Map<String, dynamic> json) =>
    ReportFormModel(
      id: json['id'] as String,
      imageUrl: json['imageUrl'] as String,
      location: ReportFormModel._fromJsonGeoPoint(json['location'] as GeoPoint),
      problem: json['problem'] as String,
      userId: json['userId'] as String?,
      description: json['description'] as String?,
      dateInput:
          ReportFormModel._dateTimeFromEpochUs(json['dateInput'] as Timestamp),
      address: json['address'] as String,
      category: json['category'] as String?,
      reportProgress: (json['reportProgress'] as List<dynamic>)
          .map((e) => ReportProgressModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ReportFormModelToJson(ReportFormModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'imageUrl': instance.imageUrl,
      'location': ReportFormModel._toJsonGeoPoint(instance.location),
      'problem': instance.problem,
      'userId': instance.userId,
      'description': instance.description,
      'dateInput': ReportFormModel._dateTimeToEpochUs(instance.dateInput),
      'address': instance.address,
      'category': instance.category,
      'reportProgress':
          ReportFormModel.reportProgressToJson(instance.reportProgress),
    };
