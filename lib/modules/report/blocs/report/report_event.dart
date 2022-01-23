part of 'report_bloc.dart';

abstract class ReportEvent extends Equatable {
  const ReportEvent();

  @override
  List<Object> get props => [];
}

class FetchReportList extends ReportEvent {}

class FetchNextReportList extends ReportEvent {}
