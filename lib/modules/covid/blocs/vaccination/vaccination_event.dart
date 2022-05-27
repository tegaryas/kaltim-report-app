part of 'vaccination_bloc.dart';

abstract class VaccinationEvent extends Equatable {
  const VaccinationEvent();

  @override
  List<Object> get props => [];
}

class VaccinationFetch extends VaccinationEvent {}
