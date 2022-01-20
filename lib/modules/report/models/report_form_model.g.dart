// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'report_form_model.dart';

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
    };
