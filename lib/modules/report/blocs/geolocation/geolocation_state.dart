part of 'geolocation_bloc.dart';

abstract class GeolocationState extends Equatable {
  const GeolocationState();

  @override
  List<Object> get props => [];
}

class GeolocationInitial extends GeolocationState {}

class GeolocationLoading extends GeolocationState {}

class GeolocationLoaded extends GeolocationState {
  final Position position;

  const GeolocationLoaded({required this.position});

  @override
  List<Object> get props => [];
}

class GeolocationError extends GeolocationState {}
