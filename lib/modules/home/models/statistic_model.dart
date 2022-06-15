import 'package:equatable/equatable.dart';
import 'package:kaltim_report/modules/report/models/report_model.dart';

class DonutChartModel extends Equatable {
  final String categoryName;
  final int length;

  const DonutChartModel({
    required this.categoryName,
    required this.length,
  });

  @override
  List<Object?> get props => [categoryName, length];
}

class ReportStatusChartModel extends Equatable {
  final ReportStatusType type;
  final int length;

  const ReportStatusChartModel({
    required this.type,
    required this.length,
  });

  @override
  List<Object?> get props => [type, length];
}
