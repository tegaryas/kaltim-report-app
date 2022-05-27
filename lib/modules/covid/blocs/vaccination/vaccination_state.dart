part of 'vaccination_bloc.dart';

abstract class VaccinationState extends Equatable {
  const VaccinationState();

  @override
  List<Object> get props => [];
}

class VaccinationInitial extends VaccinationState {}

class VaccinationLoading extends VaccinationState {}

class VaccinationFailed extends VaccinationState {
  final Object e;
  final StackTrace s;

  const VaccinationFailed(this.e, this.s);

  @override
  List<Object> get props => [e, s];
}

class VaccinationSuccess extends VaccinationState {
  final VaccinationModel data;

  const VaccinationSuccess({required this.data});

  @override
  List<Object> get props => [data];
}
