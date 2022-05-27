import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';

part 'hospital_cities_event.dart';
part 'hospital_cities_state.dart';

@injectable
class HospitalCitiesBloc
    extends Bloc<HospitalCitiesEvent, HospitalCitiesState> {
  HospitalCitiesBloc() : super(HospitalCitiesInitial()) {
    on<HospitalCitiesEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
