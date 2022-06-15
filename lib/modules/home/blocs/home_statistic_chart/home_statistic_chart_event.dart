part of 'home_statistic_chart_bloc.dart';

abstract class HomeStatisticChartEvent extends Equatable {
  const HomeStatisticChartEvent();

  @override
  List<Object> get props => [];
}

class HomeStatisticChartFetch extends HomeStatisticChartEvent {}
