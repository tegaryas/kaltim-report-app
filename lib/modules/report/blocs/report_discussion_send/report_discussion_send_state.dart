part of 'report_discussion_send_bloc.dart';

abstract class ReportDiscussionSendState extends Equatable {
  const ReportDiscussionSendState();

  @override
  List<Object> get props => [];
}

class ReportDiscussionSendInitial extends ReportDiscussionSendState {}

class ReportDiscussionSendLoading extends ReportDiscussionSendState {}

class ReportDiscussionSendFailed extends ReportDiscussionSendState {
  final Object e;
  final StackTrace s;

  const ReportDiscussionSendFailed(this.e, this.s);

  @override
  List<Object> get props => [e, s];
}

class ReportDiscussionSendSuccess extends ReportDiscussionSendState {}
