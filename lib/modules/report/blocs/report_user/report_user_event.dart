part of 'report_user_bloc.dart';

abstract class ReportUserEvent extends Equatable {
  const ReportUserEvent();

  @override
  List<Object> get props => [];
}

class ReportUserListUpdate extends ReportUserEvent {
  final List<ReportModel> myReports;

  const ReportUserListUpdate(this.myReports);
  @override
  List<Object> get props => [myReports];
}

class FetchReportUserList extends ReportUserEvent {}
