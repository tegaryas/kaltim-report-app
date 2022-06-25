part of 'report_discussion_bloc.dart';

abstract class ReportDiscussionEvent extends Equatable {
  const ReportDiscussionEvent();

  @override
  List<Object> get props => [];
}

class ReportDiscussionListFetch extends ReportDiscussionEvent {
  final String id;

  const ReportDiscussionListFetch(this.id);

  @override
  List<Object> get props => [id];
}

class ReportDiscussionListUpdate extends ReportDiscussionEvent {
  final List<ReportDiscussionModel> data;

  const ReportDiscussionListUpdate(this.data);

  @override
  List<Object> get props => [data];
}
