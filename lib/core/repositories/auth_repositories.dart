import 'package:firebase_auth/firebase_auth.dart';
import 'package:injectable/injectable.dart';

import 'auth_repositories_interface.dart';

@Singleton(as: AuthRepositoryInterface)
class AuthRepository implements AuthRepositoryInterface {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  @override
  bool isLoggedIn() => _firebaseAuth.currentUser != null;

  @override
  User get loggedUser => _firebaseAuth.currentUser!;

  @override
  Future<void> logOut() async {
    _firebaseAuth.signOut();
  }
}
