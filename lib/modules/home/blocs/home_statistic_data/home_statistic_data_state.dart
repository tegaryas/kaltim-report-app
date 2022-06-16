part of 'home_statistic_data_bloc.dart';

abstract class HomeStatisticDataState extends Equatable {
  const HomeStatisticDataState();

  @override
  List<Object> get props => [];
}

class HomeStatisticDataInitial extends HomeStatisticDataState {}

class HomeStatisticDataLoading extends HomeStatisticDataState {}

class HomeStatisticDataFailed extends HomeStatisticDataState {
  final Object e;
  final StackTrace s;

  const HomeStatisticDataFailed(this.e, this.s);

  @override
  List<Object> get props => [e, s];
}

class HomeStatisticDataSuccess extends HomeStatisticDataState {
  final List<ReportStatusChartModel?> data;

  const HomeStatisticDataSuccess({required this.data});

  @override
  List<Object> get props => [data];
}
