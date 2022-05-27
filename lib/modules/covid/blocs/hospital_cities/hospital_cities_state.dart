part of 'hospital_cities_bloc.dart';

abstract class HospitalCitiesState extends Equatable {
  const HospitalCitiesState();
  
  @override
  List<Object> get props => [];
}

class HospitalCitiesInitial extends HospitalCitiesState {}
