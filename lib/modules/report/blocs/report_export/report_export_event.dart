part of 'report_export_bloc.dart';

abstract class ReportExportEvent extends Equatable {
  const ReportExportEvent();

  @override
  List<Object?> get props => [];
}

class ReportExportStart extends ReportExportEvent {
  final String? email;
  final String? exportFormat;
  final DateTime? startDate;
  final DateTime? endDate;
  final ReportExportPeriod period;

  const ReportExportStart(
      {this.email,
      this.exportFormat,
      this.startDate,
      this.endDate,
      required this.period});

  @override
  List<Object?> get props => [email, exportFormat, startDate, endDate, period];
}
