import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:json_annotation/json_annotation.dart';

part 'report_discussion_model.g.dart';

@JsonSerializable()
class ReportDiscussionModel {
  final String? userId;
  final String reportId;
  final String? userName;
  final String comment;
  @JsonKey(fromJson: _dateTimeFromEpochUs, toJson: _dateTimeToEpochUs)
  final DateTime dateInput;

  ReportDiscussionModel({
    this.userId,
    this.userName,
    required this.comment,
    required this.dateInput,
    required this.reportId,
  });

  static DateTime _dateTimeFromEpochUs(Timestamp us) => us.toDate();

  static Timestamp _dateTimeToEpochUs(DateTime dateTime) =>
      Timestamp.fromDate(dateTime);

  factory ReportDiscussionModel.fromJson(Map<String, dynamic> json) =>
      _$ReportDiscussionModelFromJson(json);
  Map<String, dynamic> toJson() => _$ReportDiscussionModelToJson(this);
}
