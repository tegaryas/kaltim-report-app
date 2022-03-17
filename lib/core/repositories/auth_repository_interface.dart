import 'package:firebase_auth/firebase_auth.dart';

abstract class AuthRepositoryInterface {
  User get loggedUser;

  bool isLoggedIn();

  Future<void> logOut();
}
