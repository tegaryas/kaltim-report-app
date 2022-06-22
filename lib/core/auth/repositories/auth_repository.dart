import 'package:firebase_auth/firebase_auth.dart';
import 'package:injectable/injectable.dart';
import 'package:kaltim_report/core/auth/providers/auth_provider_interface.dart';
import 'package:kaltim_report/modules/profile/models/profile_model.dart';

import 'auth_repository_interface.dart';

@Injectable(as: AuthRepositoryInterface)
class AuthRepository implements AuthRepositoryInterface {
  final AuthProviderInterface authProvider;

  AuthRepository(this.authProvider);

  @override
  bool isLoggedIn() => authProvider.isLoggedIn();

  @override
  User get loggedUser => authProvider.loggedUser;

  @override
  Future<void> logOut() async {
    authProvider.logOut();
  }

  @override
  Future<ProfileModel> getUserCurrentData() {
    return authProvider.getUserCurrentData();
  }

  @override
  Future<List<String>> getAllUserDeviceToken() {
    return authProvider.getAllUserDeviceToken();
  }

  @override
  Future<void> deleteDeviceToken() {
    return authProvider.deleteDeviceToken();
  }
}
