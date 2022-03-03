import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:kaltim_report/modules/profile/models/profile_form_model.dart';
import 'package:kaltim_report/modules/profile/repositories/profile_repository_interface.dart';

part 'edit_profile_event.dart';
part 'edit_profile_state.dart';

@injectable
class EditProfileBloc extends Bloc<EditProfileEvent, EditProfileState> {
  final ProfileRepositoryInterface profileRepository;
  EditProfileBloc({required this.profileRepository})
      : super(EditProfileInitial()) {
    on<EditProfileEvent>((event, emit) async {
      if (event is ProfileUpdateFormData) {
        try {
          emit(EditProfileLoading());
          await profileRepository.updateProfileData(event.data);
          emit(EditProfileLoaded(data: event.data));
        } catch (e) {
          emit(EditProfileFailed());
        }
      }
    });
  }
}
