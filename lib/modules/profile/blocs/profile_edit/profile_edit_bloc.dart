import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import 'package:injectable/injectable.dart';
import 'package:kaltim_report/modules/profile/models/profile_form_model.dart';
import 'package:kaltim_report/modules/profile/repositories/profile_repository_interface.dart';

part 'profile_edit_event.dart';
part 'profile_edit_state.dart';

@injectable
class ProfileEditBloc extends Bloc<ProfileEditEvent, ProfileEditState> {
  final ProfileRepositoryInterface profileRepository;
  ProfileEditBloc({required this.profileRepository})
      : super(ProfileEditInitial()) {
    on<ProfileUpdateFormData>((event, emit) async {
      try {
        emit(ProfileEditLoading());
        await profileRepository.updateProfileData(event.data);
        emit(ProfileEditLoaded(data: event.data));
      } catch (e) {
        emit(ProfileEditFailed());
      }
    });
  }
}
