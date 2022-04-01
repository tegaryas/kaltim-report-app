part of 'home_covid_bloc.dart';

abstract class HomeCovidEvent extends Equatable {
  const HomeCovidEvent();

  @override
  List<Object> get props => [];
}

class HomeCovidFetch extends HomeCovidEvent {}
