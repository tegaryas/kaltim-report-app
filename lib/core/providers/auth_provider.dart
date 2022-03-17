import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:injectable/injectable.dart';
import 'package:kaltim_report/core/providers/auth_provider_interface.dart';

@Injectable(as: AuthProviderInterface)
class AuthProvider implements AuthProviderInterface {
  final FirebaseAuth firebaseAuth;
  final GoogleSignIn googleSignIn;

  AuthProvider(this.firebaseAuth, this.googleSignIn);

  @override
  bool isLoggedIn() => firebaseAuth.currentUser != null;

  @override
  User get loggedUser => firebaseAuth.currentUser!;

  @override
  Future<void> logOut() async {
    firebaseAuth.signOut();
    googleSignIn.signOut();
  }
}
