part of 'report_bookmark_user_bloc.dart';

abstract class ReportBookmarkUserEvent extends Equatable {
  const ReportBookmarkUserEvent();

  @override
  List<Object?> get props => [];
}

class ReportBookmarkUserListFetch extends ReportBookmarkUserEvent {
  final String lastDocumentKey;

  const ReportBookmarkUserListFetch(this.lastDocumentKey);

  @override
  List<Object> get props => [lastDocumentKey];
}

class ReportBookmarkUserListStarted extends ReportBookmarkUserEvent {
  final ReportListFilterModel? filter;
  final ReportStatusType? status;

  const ReportBookmarkUserListStarted({this.filter, this.status});

  @override
  List<Object?> get props => [filter];
}
