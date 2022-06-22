import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import 'package:injectable/injectable.dart';
import 'package:kaltim_report/modules/profile/repositories/profile_repository_interface.dart';

part 'emergency_validate_phone_number_event.dart';
part 'emergency_validate_phone_number_state.dart';

@injectable
class EmergencyValidatePhoneNumberBloc extends Bloc<
    EmergencyValidatePhoneNumberEvent, EmergencyValidatePhoneNumberState> {
  final ProfileRepositoryInterface profileRepository;

  EmergencyValidatePhoneNumberBloc(
    this.profileRepository,
  ) : super(EmergencyValidatePhoneNumberInitial()) {
    on<EmergencyValidatePhoneNumberCheck>((event, emit) async {
      try {
        emit(EmergencyValidatePhoneNumberLoading());
        final res = await profileRepository.getUserData();
        if (res.isPhoneNumberExist) {
          emit(EmergencyValidatePhoneNumberExist(res.phoneNumber!));
        } else {
          emit(EmergencyValidatePhoneNumberNotExist());
        }
      } catch (e, s) {
        emit(EmergencyValidatePhoneNumberFailed(e, s));
      }
    });
  }
}
