import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:injectable/injectable.dart';
import 'package:kaltim_report/constant/constant.dart';
import 'package:kaltim_report/modules/auth/providers/login_provider_interface.dart';

@Injectable(as: LoginProviderInterface)
class LoginProvider implements LoginProviderInterface {
  final FirebaseAuth firebaseAuth;
  final GoogleSignIn googleSignIn;
  final FirebaseFirestore firebaseFirestore;

  const LoginProvider({
    required this.firebaseAuth,
    required this.googleSignIn,
    required this.firebaseFirestore,
  });

  @override
  Future<void> logInWithEmailAndPassword(String email, String password) async {
    await firebaseAuth.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
  }

  @override
  Future<void> logInWithGoogle() async {
    final googleUser = await googleSignIn.signIn();
    final googleAuth = await googleUser!.authentication;
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );
    await firebaseAuth.signInWithCredential(credential);
  }

  @override
  Future<bool> isUserRegister(String email) async {
    final result = await firebaseFirestore
        .collection(ApiPath.users)
        .where("email", isEqualTo: email.toString())
        .get();

    if (result.docs.isEmpty) return false;

    return true;
  }
}
