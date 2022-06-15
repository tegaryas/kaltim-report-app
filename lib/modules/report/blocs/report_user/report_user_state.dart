part of 'report_user_bloc.dart';

abstract class ReportUserState extends Equatable {
  const ReportUserState();

  @override
  List<Object> get props => [];
}

class ReportUserInitial extends ReportUserState {}

class ReportUserLoading extends ReportUserState {}

class ReportUserFailed extends ReportUserState {}

class ReportUserLoaded extends ReportUserState {
  final List<ReportModel>? myReports;

  const ReportUserLoaded(this.myReports);
  @override
  List<Object> get props => [myReports!];
}
