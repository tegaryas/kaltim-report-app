part of 'report_list_bloc.dart';

abstract class ReportListState extends Equatable {
  const ReportListState();

  @override
  List<Object> get props => [];
}

class ReportListInitial extends ReportListState {}

class ReportListLoading extends ReportListState {}

class ReportListSuccess extends ReportListState {
  final PagingController<String, ReportModel> pagingController;

  const ReportListSuccess({required this.pagingController});

  @override
  List<Object> get props => [pagingController];
}

class ReportListFailed extends ReportListState {
  final Object e;
  final StackTrace s;

  const ReportListFailed(this.e, this.s);

  @override
  List<Object> get props => [e, s];
}
