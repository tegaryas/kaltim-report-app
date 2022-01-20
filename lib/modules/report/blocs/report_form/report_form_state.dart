part of 'report_form_bloc.dart';

abstract class ReportFormState extends Equatable {
  const ReportFormState();

  @override
  List<Object> get props => [];
}

class ReportFormInitial extends ReportFormState {}

class ReportFormLoading extends ReportFormState {}

class ReportFormAddedSucess extends ReportFormState {
  final ReportFormModel form;

  const ReportFormAddedSucess({required this.form});

  @override
  List<Object> get props => [form];
}

class ReportFormFailure extends ReportFormState {
  final Object error;
  final StackTrace stackTrace;

  const ReportFormFailure({required this.error, required this.stackTrace});

  @override
  List<Object> get props => [error, stackTrace];
}
