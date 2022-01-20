import 'package:kaltim_report/modules/profile/models/profile_model.dart';

abstract class ProfileRepositoryInterface {
  Stream<ProfileModel> getCurrentUserData();
}
