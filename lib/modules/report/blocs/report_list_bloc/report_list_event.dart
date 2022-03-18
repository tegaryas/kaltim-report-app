part of 'report_list_bloc.dart';

abstract class ReportListEvent extends Equatable {
  const ReportListEvent();

  @override
  List<Object?> get props => [];
}

class ReportListFetch extends ReportListEvent {
  final String lastDocumentKey;

  const ReportListFetch(this.lastDocumentKey);

  @override
  List<Object> get props => [lastDocumentKey];
}

class ReportListStarted extends ReportListEvent {
  final ReportListFilterModel? filter;

  const ReportListStarted({this.filter});

  @override
  List<Object?> get props => [filter];
}
