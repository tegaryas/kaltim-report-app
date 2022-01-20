part of 'report_form_bloc.dart';

abstract class ReportFormEvent extends Equatable {
  const ReportFormEvent();

  @override
  List<Object> get props => [];
}

class ReportFormAddAll extends ReportFormEvent {
  final ReportFormModel form;
  final String imageUrl;

  const ReportFormAddAll({
    required this.form,
    required this.imageUrl,
  });

  @override
  List<Object> get props => [form, imageUrl];
}

class ReportFormAdd extends ReportFormEvent {
  final ReportFormModel form;
  final XFile imageFile;

  const ReportFormAdd({
    required this.form,
    required this.imageFile,
  });

  @override
  List<Object> get props => [form, imageFile];
}
