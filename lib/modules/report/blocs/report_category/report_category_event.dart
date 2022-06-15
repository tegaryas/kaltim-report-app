part of 'report_category_bloc.dart';

abstract class ReportCategoryEvent extends Equatable {
  const ReportCategoryEvent();

  @override
  List<Object> get props => [];
}

class ReportCategoryFetch extends ReportCategoryEvent {}
