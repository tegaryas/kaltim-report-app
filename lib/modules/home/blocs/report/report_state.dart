part of 'report_bloc.dart';

abstract class ReportState extends Equatable {
  const ReportState();

  @override
  List<Object> get props => [];
}

class ReportLoading extends ReportState {}

class ReportInitial extends ReportState {}

class ReportLoaded extends ReportState {
  final List<ReportModel> reports;

  const ReportLoaded({
    required this.reports,
  });

  @override
  List<Object> get props => [reports];
}

class ReportFailed extends ReportState {}
