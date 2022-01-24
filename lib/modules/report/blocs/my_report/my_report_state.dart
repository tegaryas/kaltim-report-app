part of 'my_report_bloc.dart';

abstract class MyReportState extends Equatable {
  const MyReportState();

  @override
  List<Object> get props => [];
}

class MyReportInitial extends MyReportState {}

class MyReportLoading extends MyReportState {}

class MyReportFailed extends MyReportState {}

class MyReportLoaded extends MyReportState {
  final List<ReportModel>? myReports;

  const MyReportLoaded(this.myReports);
  @override
  List<Object> get props => [myReports!];
}
