import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:kaltim_report/modules/report/models/report_category_model.dart';

part 'report_model.g.dart';

@JsonSerializable()
class ReportModel {
  final String id;
  final String imageUrl;
  @JsonKey(fromJson: _fromJsonGeoPoint, toJson: _toJsonGeoPoint)
  final GeoPoint location;
  final String problem;
  final String userId;
  final String? description;
  @JsonKey(fromJson: _dateTimeFromEpochUs, toJson: _dateTimeToEpochUs)
  final DateTime dateInput;
  final String address;
  final ReportCategoryModel category;
  final ReportStatusType lastStatus;
  final List<ReportProgressModel>? reportProgress;

  ReportModel({
    required this.id,
    required this.imageUrl,
    required this.location,
    required this.problem,
    required this.userId,
    this.description,
    required this.dateInput,
    required this.address,
    required this.category,
    this.reportProgress,
    required this.lastStatus,
  });

  factory ReportModel.fromJson(Map<String, dynamic> json) =>
      _$ReportModelFromJson(json);

  Map<String, dynamic> toJson() => _$ReportModelToJson(this);

  static DateTime _dateTimeFromEpochUs(Timestamp us) => us.toDate();

  static int? _dateTimeToEpochUs(DateTime? dateTime) =>
      dateTime?.microsecondsSinceEpoch;

  static GeoPoint _fromJsonGeoPoint(GeoPoint geoPoint) {
    return geoPoint;
  }

  static GeoPoint _toJsonGeoPoint(GeoPoint geoPoint) {
    return geoPoint;
  }
}

enum ReportStatusType {
  selesai,
  validasi,
  tindakLanjut,
  proses,
  menunggu,
  tidakValid,
}

extension ParseToString on ReportStatusType {
  String toShortString() {
    return toString().split('.').last;
  }
}

@JsonSerializable()
class ReportProgressModel {
  final ReportStatusType statusType;
  @JsonKey(fromJson: _dateTimeFromEpochUs, toJson: _dateTimeToEpochUs)
  final DateTime date;
  final String statusProgress;
  final String? imageUrl;
  final String? description;

  ReportProgressModel({
    required this.statusType,
    required this.date,
    required this.statusProgress,
    this.imageUrl,
    this.description,
  });

  static DateTime _dateTimeFromEpochUs(Timestamp us) => us.toDate();

  static Timestamp _dateTimeToEpochUs(DateTime dateTime) =>
      Timestamp.fromDate(dateTime);

  factory ReportProgressModel.fromJson(Map<String, dynamic> json) =>
      _$ReportProgressModelFromJson(json);

  Map<String, dynamic> toJson() => _$ReportProgressModelToJson(this);
}
