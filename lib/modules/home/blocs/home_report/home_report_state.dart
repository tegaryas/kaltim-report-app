part of 'home_report_bloc.dart';

abstract class HomeReportState extends Equatable {
  const HomeReportState();

  @override
  List<Object> get props => [];
}

class HomeReportInitial extends HomeReportState {}

class HomeReportLoading extends HomeReportState {}

class HomeReportFailed extends HomeReportState {
  final Object e;
  final StackTrace s;

  const HomeReportFailed(this.e, this.s);

  @override
  List<Object> get props => [e, s];
}

class HomeReportSuccess extends HomeReportState {
  final List<ReportModel> data;

  const HomeReportSuccess({required this.data});

  @override
  List<Object> get props => [data];
}
