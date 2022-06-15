import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:injectable/injectable.dart';
import 'package:kaltim_report/modules/profile/models/profile_form_model.dart';
import 'package:kaltim_report/modules/profile/models/profile_model.dart';
import 'package:kaltim_report/modules/profile/providers/profile_provider_interface.dart';
import 'package:kaltim_report/modules/profile/repositories/profile_repository_interface.dart';

@Injectable(as: ProfileRepositoryInterface)
class ProfileRepository implements ProfileRepositoryInterface {
  final ProfileProviderInterface profileProvider;

  ProfileRepository({required this.profileProvider});
  @override
  Stream<ProfileModel> getCurrentUserData() {
    return profileProvider.getCurrentUserData();
  }

  @override
  Future<void> updateProfileData(ProfileFormModel data) {
    return profileProvider.updateProfileData(data);
  }

  @override
  Future<void> updateUserPassword(String newPassword) {
    return profileProvider.updateUserPassword(newPassword);
  }

  @override
  Future<ProfileModel> getUserData() {
    return profileProvider.getUserData();
  }

  @override
  UploadTask? uploadProfilePicture(XFile file) {
    return profileProvider.uploadProfilePicture(file);
  }
}
