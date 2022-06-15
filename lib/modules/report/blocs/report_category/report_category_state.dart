part of 'report_category_bloc.dart';

abstract class ReportCategoryState extends Equatable {
  const ReportCategoryState();

  @override
  List<Object> get props => [];
}

class ReportCategoryInitial extends ReportCategoryState {}

class ReportCategoryLoading extends ReportCategoryState {}

class ReportCategoryFailed extends ReportCategoryState {
  final Object e;
  final StackTrace s;

  const ReportCategoryFailed(this.e, this.s);

  @override
  List<Object> get props => [e, s];
}

class ReportCategorySuccess extends ReportCategoryState {
  final List<ReportCategoryModel> data;

  const ReportCategorySuccess({required this.data});

  @override
  List<Object> get props => [data];
}
