part of 'report_bloc.dart';

abstract class ReportEvent extends Equatable {
  const ReportEvent();

  @override
  List<Object> get props => [];
}

class ReportFetching extends ReportEvent {}

class ReportUpdate extends ReportEvent {
  final List<ReportModel> reports;

  const ReportUpdate({required this.reports});

  @override
  List<Object> get props => [reports];
}
