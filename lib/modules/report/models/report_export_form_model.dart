import 'package:json_annotation/json_annotation.dart';

part 'report_export_form_model.g.dart';

@JsonSerializable()
class ReportExportFormModel {
  final String? email;
  final DateTime startDate;
  final DateTime endDate;
  final ReportExportFormat format;

  ReportExportFormModel({
    this.email,
    required this.startDate,
    required this.endDate,
    required this.format,
  });

  factory ReportExportFormModel.fromJson(Map<String, dynamic> json) =>
      _$ReportExportFormModelFromJson(json);
  Map<String, dynamic> toJson() => _$ReportExportFormModelToJson(this);
}

enum ReportExportFormat {
  csv,
  excel,
  unknown,
}

enum ReportExportPeriod {
  @JsonValue("last_2_week")
  last_2Week,
  @JsonValue("last_month")
  lastMonth,
  custom,
  unknown
}
