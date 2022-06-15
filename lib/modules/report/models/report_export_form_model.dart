import 'package:json_annotation/json_annotation.dart';

part 'report_export_form_model.g.dart';

@JsonSerializable()
class ReportExportFormModel {
  final String? email;
  final DateTime startDate;
  final DateTime endDate;

  ReportExportFormModel({
    this.email,
    required this.startDate,
    required this.endDate,
  });

  factory ReportExportFormModel.fromJson(Map<String, dynamic> json) =>
      _$ReportExportFormModelFromJson(json);
  Map<String, dynamic> toJson() => _$ReportExportFormModelToJson(this);
}
