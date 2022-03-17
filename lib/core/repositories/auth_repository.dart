import 'package:firebase_auth/firebase_auth.dart';
import 'package:injectable/injectable.dart';
import 'package:kaltim_report/core/providers/auth_provider_interface.dart';

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
}
