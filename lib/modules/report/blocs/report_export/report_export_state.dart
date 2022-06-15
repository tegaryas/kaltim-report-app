part of 'report_export_bloc.dart';

abstract class ReportExportState extends Equatable {
  const ReportExportState();

  @override
  List<Object> get props => [];
}

class ReportExportInitial extends ReportExportState {}

class ReportExportLoading extends ReportExportState {}

class ReportExportFailed extends ReportExportState {
  final Object e;
  final StackTrace s;

  const ReportExportFailed(this.e, this.s);

  @override
  List<Object> get props => [e, s];
}

class ReportExportSuccess extends ReportExportState {}
