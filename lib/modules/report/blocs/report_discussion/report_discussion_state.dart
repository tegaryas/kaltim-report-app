part of 'report_discussion_bloc.dart';

abstract class ReportDiscussionState extends Equatable {
  const ReportDiscussionState();

  @override
  List<Object> get props => [];
}

class ReportDiscussionInitial extends ReportDiscussionState {}

class ReportDiscussionListLoading extends ReportDiscussionState {}

class ReportDiscussionListFailed extends ReportDiscussionState {
  final Object e;
  final StackTrace s;

  const ReportDiscussionListFailed(this.e, this.s);

  @override
  List<Object> get props => [e, s];
}

class ReportDiscussionListSuccess extends ReportDiscussionState {
  final List<ReportDiscussionModel> data;

  const ReportDiscussionListSuccess(this.data);

  @override
  List<Object> get props => [data];
}
