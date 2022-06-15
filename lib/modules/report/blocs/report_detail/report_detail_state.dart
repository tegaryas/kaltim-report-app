part of 'report_detail_bloc.dart';

abstract class ReportDetailState extends Equatable {
  const ReportDetailState();

  @override
  List<Object> get props => [];
}

class ReportDetailInitial extends ReportDetailState {}

class ReportDetailLoading extends ReportDetailState {}

class ReportDetailFailed extends ReportDetailState {
  final Object e;
  final StackTrace s;

  const ReportDetailFailed(this.e, this.s);

  @override
  List<Object> get props => [e, s];
}

class ReportDetailSucces extends ReportDetailState {
  final ReportModel data;

  const ReportDetailSucces({required this.data});

  @override
  List<Object> get props => [data];
}
