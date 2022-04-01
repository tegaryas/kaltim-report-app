part of 'home_covid_bloc.dart';

abstract class HomeCovidState extends Equatable {
  const HomeCovidState();

  @override
  List<Object> get props => [];
}

class HomeCovidInitial extends HomeCovidState {}

class HomeCovidLoading extends HomeCovidState {}

class HomeCovidFailed extends HomeCovidState {
  final Object e;
  final StackTrace s;

  const HomeCovidFailed(this.e, this.s);

  @override
  List<Object> get props => [e, s];
}

class HomeCovidSuccess extends HomeCovidState {
  final List<CovidFeatureConfigModel> config;

  const HomeCovidSuccess({required this.config});

  @override
  List<Object> get props => [config];
}
