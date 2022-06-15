part of 'report_update_form_bloc.dart';

abstract class ReportUpdateFormState extends Equatable {
  const ReportUpdateFormState();

  @override
  List<Object> get props => [];
}

class ReportUpdateFormInitial extends ReportUpdateFormState {}

class ReportUpdateFormLoading extends ReportUpdateFormState {}

class ReportUpdateFormFailed extends ReportUpdateFormState {
  final Object e;
  final StackTrace s;

  const ReportUpdateFormFailed(this.e, this.s);

  @override
  List<Object> get props => [e, s];
}

class ReportUpdateFormSuccess extends ReportUpdateFormState {}

class ReportUpdateFormDeleteSuccess extends ReportUpdateFormState {}
