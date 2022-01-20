// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'report_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ReportModel _$ReportModelFromJson(Map<String, dynamic> json) => ReportModel(
      id: json['id'] as String,
      imageUrl: json['imageUrl'] as String,
      location: ReportModel._fromJsonGeoPoint(json['location'] as GeoPoint),
      problem: json['problem'] as String,
      userId: json['userId'] as String,
      description: json['description'] as String?,
      dateInput:
          ReportModel._dateTimeFromEpochUs(json['dateInput'] as Timestamp),
      address: json['address'] as String,
      category: json['category'] as String,
    );

Map<String, dynamic> _$ReportModelToJson(ReportModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'imageUrl': instance.imageUrl,
      'location': ReportModel._toJsonGeoPoint(instance.location),
      'problem': instance.problem,
      'userId': instance.userId,
      'description': instance.description,
      'dateInput': ReportModel._dateTimeToEpochUs(instance.dateInput),
      'address': instance.address,
      'category': instance.category,
    };
