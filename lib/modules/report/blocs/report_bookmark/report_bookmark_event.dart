part of 'report_bookmark_bloc.dart';

abstract class ReportBookmarkEvent extends Equatable {
  const ReportBookmarkEvent();

  @override
  List<Object> get props => [];
}

class ReportBookmarkAdd extends ReportBookmarkEvent {
  final ReportModel report;

  const ReportBookmarkAdd({required this.report});

  @override
  List<Object> get props => [report];
}

class ReportBookmarkRemove extends ReportBookmarkEvent {
  final ReportModel report;

  const ReportBookmarkRemove({required this.report});

  @override
  List<Object> get props => [report];
}

class ReportBookmarkIsAdded extends ReportBookmarkEvent {
  final String id;

  const ReportBookmarkIsAdded({required this.id});

  @override
  List<Object> get props => [id];
}
