import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:geolocator/geolocator.dart';
import 'package:injectable/injectable.dart';
import 'package:kaltim_report/services/geolocator/geolocator_repository_interface.dart';

part 'geolocation_event.dart';
part 'geolocation_state.dart';

@injectable
class GeolocationBloc extends Bloc<GeolocationEvent, GeolocationState> {
  final GeolocatorRepositoryInterface geolocatorRepository;
  StreamSubscription? _geolocationSubscription;
  GeolocationBloc({required this.geolocatorRepository})
      : super(GeolocationInitial()) {
    on<LoadGeolocation>((event, emit) async {
      try {
        _geolocationSubscription?.cancel();
        final Position? position =
            await geolocatorRepository.getCurrentLocation();

        add(UpdateGeolocation(position: position!));
      } catch (e) {
        emit(GeolocationError());
      }
    });

    on<UpdateGeolocation>((event, emit) async {
      emit(GeolocationLoaded(position: event.position));
    });
  }

  @override
  Future<void> close() {
    _geolocationSubscription?.cancel();
    return super.close();
  }
}
