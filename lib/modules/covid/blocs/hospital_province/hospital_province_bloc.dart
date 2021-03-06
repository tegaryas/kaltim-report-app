import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import 'package:injectable/injectable.dart';
import 'package:kaltim_report/modules/covid/models/covid_place_model.dart';
import 'package:kaltim_report/modules/covid/repositories/covid_repository_interface.dart';

part 'hospital_province_event.dart';
part 'hospital_province_state.dart';

@injectable
class HospitalProvinceBloc
    extends Bloc<HospitalProvinceEvent, HospitalProvinceState> {
  final CovidRepositoryInterface covidRepository;

  HospitalProvinceBloc(
    this.covidRepository,
  ) : super(HospitalProvinceInitial()) {
    on<HospitalProvinceFetch>((event, emit) async {
      try {
        emit(HospitalProvinceLoading());
        final res = await covidRepository.getProvincesList();
        emit(HospitalProvinceSuccess(data: res));
      } catch (e, s) {
        emit(HospitalProvinceFailed(e, s));
      }
    });
  }
}
