import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:injectable/injectable.dart';
import 'package:kaltim_report/modules/auth/models/register_model.dart';
import 'package:kaltim_report/modules/auth/providers/register_provider_interface.dart';

@Injectable(as: RegisterProviderInterface)
class RegisterProvider implements RegisterProviderInterface {
  final FirebaseAuth firebaseAuth;
  final FirebaseFirestore firebaseFirestore;

  const RegisterProvider({
    required this.firebaseAuth,
    required this.firebaseFirestore,
  });

  @override
  Future<void> registerWithEmailAndPassword(
      String email, String password) async {
    await firebaseAuth.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );
  }

  @override
  Future<void> registerUserData(RegisterModel data) async {
    await firebaseFirestore
        .collection("Users")
        .doc(data.idToken)
        .set(data.toJson());
  }

  @override
  Future<List<String>> checkEmailExsist(String email) async {
    return firebaseAuth.fetchSignInMethodsForEmail(email);
  }

  @override
  Future<void> resetPassword(String email) {
    return firebaseAuth.sendPasswordResetEmail(email: email);
  }
}
