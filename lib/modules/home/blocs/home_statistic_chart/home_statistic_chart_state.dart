part of 'home_statistic_chart_bloc.dart';

abstract class HomeStatisticChartState extends Equatable {
  const HomeStatisticChartState();

  @override
  List<Object> get props => [];
}

class HomeStatisticChartInitial extends HomeStatisticChartState {}

class HomeStatisticChartLoading extends HomeStatisticChartState {}

class HomeStatisticChartFailed extends HomeStatisticChartState {
  final Object e;
  final StackTrace s;

  const HomeStatisticChartFailed(this.e, this.s);

  @override
  List<Object> get props => [e, s];
}

class HomeStatisticChartSuccess extends HomeStatisticChartState {
  final List<DonutChartModel> data;

  const HomeStatisticChartSuccess({required this.data});

  @override
  List<Object> get props => [data];
}
