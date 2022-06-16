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
          ReportModel._dateTimeFromEpochUs(json['dateInput'] as Timestamp?),
      address: json['address'] as String,
      category: ReportCategoryModel.fromJson(
          json['category'] as Map<String, dynamic>),
      reportProgress: (json['reportProgress'] as List<dynamic>?)
          ?.map((e) => ReportProgressModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      lastUpdate:
          ReportModel._dateTimeFromEpochUs(json['lastUpdate'] as Timestamp?),
      lastStatus: $enumDecode(_$ReportStatusTypeEnumMap, json['lastStatus']),
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
      'lastUpdate': ReportModel._dateTimeToEpochUs(instance.lastUpdate),
      'address': instance.address,
      'category': instance.category,
      'lastStatus': _$ReportStatusTypeEnumMap[instance.lastStatus],
      'reportProgress': instance.reportProgress,
    };

const _$ReportStatusTypeEnumMap = {
  ReportStatusType.selesai: 'selesai',
  ReportStatusType.validasi: 'validasi',
  ReportStatusType.tindakLanjut: 'tindakLanjut',
  ReportStatusType.proses: 'proses',
  ReportStatusType.menunggu: 'menunggu',
  ReportStatusType.tidakValid: 'tidakValid',
};

ReportProgressModel _$ReportProgressModelFromJson(Map<String, dynamic> json) =>
    ReportProgressModel(
      statusType: $enumDecode(_$ReportStatusTypeEnumMap, json['statusType']),
      date: ReportProgressModel._dateTimeFromEpochUs(json['date'] as Timestamp),
      statusProgress: json['statusProgress'] as String,
      imageUrl: json['imageUrl'] as String?,
      description: json['description'] as String?,
    );

Map<String, dynamic> _$ReportProgressModelToJson(
        ReportProgressModel instance) =>
    <String, dynamic>{
      'statusType': _$ReportStatusTypeEnumMap[instance.statusType],
      'date': ReportProgressModel._dateTimeToEpochUs(instance.date),
      'statusProgress': instance.statusProgress,
      'imageUrl': instance.imageUrl,
      'description': instance.description,
    };
