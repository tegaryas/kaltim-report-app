part of 'report_discussion_send_bloc.dart';

abstract class ReportDiscussionSendEvent extends Equatable {
  const ReportDiscussionSendEvent();

  @override
  List<Object> get props => [];
}

class ReportDiscussionSendForm extends ReportDiscussionSendEvent {
  final ReportDiscussionModel form;

  const ReportDiscussionSendForm(this.form);

  @override
  List<Object> get props => [form];
}
