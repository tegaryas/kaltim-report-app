import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:json_annotation/json_annotation.dart';

part 'emergency_call_model.g.dart';

@JsonSerializable()
class EmergencyCallModel {
  final String? userId;
  @JsonKey(fromJson: _fromJsonGeoPoint, toJson: _toJsonGeoPoint)
  final GeoPoint location;
  @JsonKey(fromJson: _dateTimeFromEpochUs, toJson: _dateTimeToEpochUs)
  final DateTime dateInput;
  final String? name;
  final String? phoneNumber;

  EmergencyCallModel({
    this.userId,
    required this.location,
    this.name,
    this.phoneNumber,
    required this.dateInput,
  });

  factory EmergencyCallModel.fromJson(Map<String, dynamic> json) =>
      _$EmergencyCallModelFromJson(json);

  Map<String, dynamic> toJson() => _$EmergencyCallModelToJson(this);

  static DateTime _dateTimeFromEpochUs(Timestamp us) => us.toDate();

  static Timestamp? _dateTimeToEpochUs(DateTime? dateTime) =>
      Timestamp.fromDate(dateTime!);

  static GeoPoint _fromJsonGeoPoint(GeoPoint geoPoint) {
    return geoPoint;
  }

  static GeoPoint _toJsonGeoPoint(GeoPoint geoPoint) {
    return geoPoint;
  }
}
