import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:image_picker/image_picker.dart';
import 'package:injectable/injectable.dart';
import 'package:kaltim_report/modules/profile/models/profile_form_model.dart';
import 'package:kaltim_report/modules/profile/repositories/profile_repository_interface.dart';

part 'profile_picture_update_event.dart';
part 'profile_picture_update_state.dart';

@injectable
class ProfilePictureUpdateBloc
    extends Bloc<ProfilePictureUpdateEvent, ProfilePictureUpdateState> {
  final ProfileRepositoryInterface profileRepository;
  final FirebaseCrashlytics firebaseCrashlytics;
  ProfilePictureUpdateBloc(this.profileRepository, this.firebaseCrashlytics)
      : super(ProfilePictureUpdateInitial()) {
    on<ProfilePictureUpdateAdd>((event, emit) async {
      try {
        emit(ProfilePictureUpdateLoading());
        String? imageUrl;

        if (event.image != null) {
          final uploadTask =
              profileRepository.uploadProfilePicture(event.image!);
          if (uploadTask != null) {
            await uploadTask.then((taskSnapshot) async {
              imageUrl = await taskSnapshot.ref.getDownloadURL();
            });
          }
        }

        await profileRepository.updateProfileData(
          ProfileFormModel(profilePic: imageUrl),
        );

        emit(ProfilePictureUpdateSuccess());
      } catch (e, s) {
        firebaseCrashlytics.recordError(e, s);
        emit(ProfilePictureUpdateFailed(e, s));
      }
    });
  }
}
