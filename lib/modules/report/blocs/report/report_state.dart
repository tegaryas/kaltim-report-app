part of 'report_bloc.dart';

abstract class ReportState extends Equatable {
  const ReportState();

  @override
  List<Object> get props => [];
}

class ReportInitial extends ReportState {}

class ReportLoading extends ReportState {}

class ReportLoaded extends ReportState {
  final ReportModel reports;
  final bool? hasReachedMax;

  const ReportLoaded({required this.reports, this.hasReachedMax});

  @override
  List<Object> get props => [reports, hasReachedMax!];
}

class ReportFailed extends ReportState {}
