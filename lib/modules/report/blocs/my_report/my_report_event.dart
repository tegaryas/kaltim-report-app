part of 'my_report_bloc.dart';

abstract class MyReportEvent extends Equatable {
  const MyReportEvent();

  @override
  List<Object> get props => [];
}

class MyReportListUpdate extends MyReportEvent {
  final List<ReportModel> myReports;

  const MyReportListUpdate(this.myReports);
  @override
  List<Object> get props => [myReports];
}

class FetchMyReportList extends MyReportEvent {}
