part of 'report_update_form_bloc.dart';

abstract class ReportUpdateFormEvent extends Equatable {
  const ReportUpdateFormEvent();

  @override
  List<Object> get props => [];
}

class ReportUpdateFormAdd extends ReportUpdateFormEvent {
  final ReportProgressModel data;
  final String id;
  final XFile? imageFile;

  const ReportUpdateFormAdd({
    required this.data,
    required this.id,
    this.imageFile,
  });

  @override
  List<Object> get props => [data, id];
}

class ReportUpdateFormDelete extends ReportUpdateFormEvent {
  final String id;

  const ReportUpdateFormDelete({required this.id});

  @override
  List<Object> get props => [id];
}
