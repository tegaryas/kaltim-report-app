import 'package:firebase_auth/firebase_auth.dart';
import 'package:injectable/injectable.dart';
import 'package:kaltim_report/modules/auth/repositories/login_repository_interface.dart';

@Injectable(as: LoginRepositoryInterface)
class LoginRepository implements LoginRepositoryInterface {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  @override
  Future<void> logInWithEmailAndPassword(String email, String password) async {
    try {
      await _firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
    } on FirebaseAuthException catch (e) {
      print("ERROR: $e");
    }
  }
}
