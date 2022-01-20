part of 'report_form_bloc.dart';

abstract class ReportFormEvent extends Equatable {
  const ReportFormEvent();

  @override
  List<Object> get props => [];
}

class ReportFormAdd extends ReportFormEvent {
  final ReportFormModel form;

  const ReportFormAdd({required this.form});

  @override
  List<Object> get props => [form];
}
