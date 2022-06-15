import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:kaltim_report/modules/profile/models/profile_form_model.dart';
import 'package:kaltim_report/modules/profile/models/profile_model.dart';
import 'package:kaltim_report/modules/report/models/report_model.dart';

abstract class ProfileProviderInterface {
  Stream<ProfileModel> getCurrentUserData();

  Stream<ReportModel> getSavedReport();

  Future<void> updateProfileData(ProfileFormModel data);

  Future<void> updateUserPassword(String newPassword);

  Future<ProfileModel> getUserData();

  UploadTask? uploadProfilePicture(XFile file);
}
