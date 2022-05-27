import 'package:firebase_auth/firebase_auth.dart';
import 'package:kaltim_report/modules/profile/models/profile_model.dart';

abstract class AuthProviderInterface {
  User get loggedUser;

  bool isLoggedIn();

  Future<void> logOut();

  Future<ProfileModel> getUserCurrentData();
}
