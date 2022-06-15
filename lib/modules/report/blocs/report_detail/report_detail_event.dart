part of 'report_detail_bloc.dart';

abstract class ReportDetailEvent extends Equatable {
  const ReportDetailEvent();

  @override
  List<Object> get props => [];
}

class ReportDetailFetch extends ReportDetailEvent {
  final String id;

  const ReportDetailFetch({required this.id});

  @override
  List<Object> get props => [id];
}
