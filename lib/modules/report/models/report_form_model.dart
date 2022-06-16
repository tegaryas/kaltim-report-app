import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:kaltim_report/modules/report/models/report_category_model.dart';
import 'package:kaltim_report/modules/report/models/report_model.dart';

part 'report_form_model.g.dart';

@CopyWith()
@JsonSerializable()
class ReportFormModel {
  final String id;
  final String? imageUrl;
  @JsonKey(fromJson: _fromJsonGeoPoint, toJson: _toJsonGeoPoint)
  final GeoPoint location;
  final String problem;
  final String? userId;
  final String? description;
  @JsonKey(fromJson: _dateTimeFromEpochUs, toJson: _dateTimeToEpochUs)
  final DateTime? dateInput;
  @JsonKey(fromJson: _dateTimeFromEpochUs, toJson: _dateTimeToEpochUs)
  final DateTime? lastUpdate;
  final String address;
  @JsonKey(toJson: _reportCategoryToJson)
  final ReportCategoryModel category;
  final ReportStatusType lastStatus;
  @JsonKey(toJson: reportProgressToJson)
  final List<ReportProgressModel> reportProgress;

  ReportFormModel({
    required this.id,
    this.imageUrl,
    required this.location,
    required this.problem,
    this.userId,
    this.description,
    this.dateInput,
    this.lastUpdate,
    required this.address,
    required this.category,
    required this.reportProgress,
    required this.lastStatus,
  });

  factory ReportFormModel.fromJson(Map<String, dynamic> json) =>
      _$ReportFormModelFromJson(json);

  Map<String, dynamic> toJson() => _$ReportFormModelToJson(this);

  static DateTime? _dateTimeFromEpochUs(Timestamp? us) => us?.toDate();

  static Timestamp? _dateTimeToEpochUs(DateTime? dateTime) =>
      Timestamp.fromDate(dateTime!);

  static GeoPoint _fromJsonGeoPoint(GeoPoint geoPoint) {
    return geoPoint;
  }

  static GeoPoint _toJsonGeoPoint(GeoPoint geoPoint) {
    return geoPoint;
  }

  static Map<String, dynamic> _reportCategoryToJson(ReportCategoryModel data) =>
      data.toJson();

  static FieldValue reportProgressToJson(List<ReportProgressModel> status) {
    return FieldValue.arrayUnion(status.map((e) => e.toJson()).toList());
  }
}
