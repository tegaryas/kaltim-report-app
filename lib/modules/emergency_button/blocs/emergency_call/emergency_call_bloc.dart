import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import 'package:injectable/injectable.dart';
import 'package:kaltim_report/modules/emergency_button/models/emergency_call_form_model.dart';
import 'package:kaltim_report/modules/emergency_button/repositories/emergency_call_repository_interface.dart';
import 'package:kaltim_report/modules/profile/repositories/profile_repository_interface.dart';

part 'emergency_call_event.dart';
part 'emergency_call_state.dart';

@injectable
class EmergencyCallBloc extends Bloc<EmergencyCallEvent, EmergencyCallState> {
  final EmergencyCallRepositoryInterface emergencyCallRepository;
  final ProfileRepositoryInterface profileRepository;

  EmergencyCallBloc(this.emergencyCallRepository, this.profileRepository)
      : super(EmergencyCallInitial()) {
    on<EmergencyCallSendForm>(
      (event, emit) async {
        try {
          emit(EmergencyCallLoading());

          final profile = await profileRepository.getUserData();

          await emergencyCallRepository.postUserEmergencyCall(
            EmergencyCallFormModel(
              location: event.data.location,
              dateInput: event.data.dateInput,
              name: profile.name,
              phoneNumber: profile.phoneNumber,
              userId: profile.idToken,
            ),
          );
          emit(EmergencyCallSuccess());
        } catch (e, s) {
          emit(EmergencyCallFailed(e, s));
        }
      },
    );
  }
}
