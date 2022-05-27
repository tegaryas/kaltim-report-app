import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:injectable/injectable.dart';
import 'package:kaltim_report/modules/covid/models/models.dart';
import 'package:kaltim_report/modules/covid/repositories/covid_repository_interface.dart';

part 'vaccination_event.dart';
part 'vaccination_state.dart';

@injectable
class VaccinationBloc extends Bloc<VaccinationEvent, VaccinationState> {
  final CovidRepositoryInterface covidRepository;
  final FirebaseCrashlytics firebaseCrashlytics;
  VaccinationBloc(this.covidRepository, this.firebaseCrashlytics)
      : super(VaccinationInitial()) {
    on<VaccinationFetch>((event, emit) async {
      try {
        emit(VaccinationLoading());
        final res = await covidRepository.getVaccinationData();
        emit(VaccinationSuccess(data: res));
      } catch (e, s) {
        firebaseCrashlytics.recordError(e, s);
        emit(VaccinationFailed(e, s));
      }
    });
  }
}
