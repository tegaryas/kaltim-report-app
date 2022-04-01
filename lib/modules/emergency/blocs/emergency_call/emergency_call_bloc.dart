import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:injectable/injectable.dart';
import 'package:kaltim_report/modules/emergency/models/emergency_call_form_model.dart';
import 'package:kaltim_report/modules/emergency/repositories/emergency_call_repository_interface.dart';

part 'emergency_call_event.dart';
part 'emergency_call_state.dart';

@injectable
class EmergencyCallBloc extends Bloc<EmergencyCallEvent, EmergencyCallState> {
  final EmergencyCallRepositoryInterface emergencyCallRepository;
  final FirebaseCrashlytics firebaseCrashlytics;
  EmergencyCallBloc(this.emergencyCallRepository, this.firebaseCrashlytics)
      : super(EmergencyCallInitial()) {
    on<EmergencyCallSendFrom>((event, emit) async {
      try {
        emit(EmergencyCallLoading());
        await emergencyCallRepository.postUserEmergencyCall(event.data);
        emit(EmergencyCallSuccess());
      } catch (e, s) {
        firebaseCrashlytics.recordError(e, s);
        emit(EmergencyCallFailed(e, s));
      }
    });
  }
}
