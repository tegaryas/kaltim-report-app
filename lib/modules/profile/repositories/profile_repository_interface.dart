import 'package:kaltim_report/modules/profile/models/profile_form_model.dart';
import 'package:kaltim_report/modules/profile/models/profile_model.dart';

abstract class ProfileRepositoryInterface {
  Stream<ProfileModel> getCurrentUserData();

  Future<void> updateProfileData(ProfileFormModel data);
}
