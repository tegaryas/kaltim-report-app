import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'emergency_call_form_model.g.dart';

@CopyWith()
@JsonSerializable()
class EmergencyCallFormModel {
  final String? userId;
  @JsonKey(fromJson: _fromJsonGeoPoint, toJson: _toJsonGeoPoint)
  final GeoPoint location;
  @JsonKey(fromJson: _dateTimeFromEpochUs, toJson: _dateTimeToEpochUs)
  final DateTime dateInput;
  final String name;
  final String phoneNumber;

  EmergencyCallFormModel({
    this.userId,
    required this.location,
    required this.name,
    required this.phoneNumber,
    required this.dateInput,
  });

  factory EmergencyCallFormModel.fromJson(Map<String, dynamic> json) =>
      _$EmergencyCallFormModelFromJson(json);

  Map<String, dynamic> toJson() => _$EmergencyCallFormModelToJson(this);

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
