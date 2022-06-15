part of 'home_statistic_data_bloc.dart';

abstract class HomeStatisticDataEvent extends Equatable {
  const HomeStatisticDataEvent();

  @override
  List<Object> get props => [];
}

class HomeStatisticDataFetch extends HomeStatisticDataEvent {}
