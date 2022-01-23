import 'package:injectable/injectable.dart';
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
}