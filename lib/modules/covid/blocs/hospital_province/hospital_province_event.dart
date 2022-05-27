part of 'hospital_province_bloc.dart';

abstract class HospitalProvinceEvent extends Equatable {
  const HospitalProvinceEvent();

  @override
  List<Object> get props => [];
}

class HospitalProvinceFetch extends HospitalProvinceEvent {}
