import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:json_annotation/json_annotation.dart';

part 'report_model.g.dart';

@JsonSerializable()
class ReportModel {
  final String id;
  final String imageUrl;
  final ReportLocation location;
  final String problem;
  final String userId;
  final String? description;
  @JsonKey(fromJson: _dateTimeFromEpochUs, toJson: _dateTimeToEpochUs)
  final DateTime dateInput;
  final String address;
  final String category;

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
  });

  factory ReportModel.fromJson(Map<String, dynamic> json) =>
      _$ReportModelFromJson(json);

  Map<String, dynamic> toJson() => _$ReportModelToJson(this);

  static DateTime _dateTimeFromEpochUs(Timestamp us) => us.toDate();

  static int? _dateTimeToEpochUs(DateTime? dateTime) =>
      dateTime?.microsecondsSinceEpoch;
}

@JsonSerializable()
class ReportLocation {
  final String latitude;
  final String longitude;

  ReportLocation({
    required this.latitude,
    required this.longitude,
  });

  factory ReportLocation.fromJson(Map<String, dynamic> json) =>
      _$ReportLocationFromJson(json);
  Map<String, dynamic> toJson() => _$ReportLocationToJson(this);
}
