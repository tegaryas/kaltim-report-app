part of 'hospital_province_bloc.dart';

abstract class HospitalProvinceState extends Equatable {
  const HospitalProvinceState();

  @override
  List<Object> get props => [];
}

class HospitalProvinceInitial extends HospitalProvinceState {}

class HospitalProvinceLoading extends HospitalProvinceState {}

class HospitalProvinceFailed extends HospitalProvinceState {
  final Object e;
  final StackTrace s;

  const HospitalProvinceFailed(this.e, this.s);

  @override
  List<Object> get props => [e, s];
}

class HospitalProvinceSuccess extends HospitalProvinceState {
  final List<CovidPlaceModel> data;

  const HospitalProvinceSuccess({required this.data});

  @override
  List<Object> get props => [data];
}
