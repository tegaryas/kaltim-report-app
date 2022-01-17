import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:injectable/injectable.dart';
import 'package:kaltim_report/modules/auth/models/register_model.dart';
import 'package:kaltim_report/modules/auth/repositories/register_repository_interface.dart';

@Injectable(as: RegisterRepositoryInterface)
class RegisterRepository implements RegisterRepositoryInterface {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  CollectionReference users = FirebaseFirestore.instance.collection("Users");

  @override
  Future<void> registerWithEmailAndPassword(
      String email, String password) async {
    try {
      await _firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
    } on FirebaseAuthException catch (e) {
      print("ERROR: $e");
    }
  }

  @override
  Future<void> registerUserData(RegisterModel data) async {
    try {
      await users.doc(data.idToken).set(data.toJson());
    } on FirebaseAuthException catch (e) {
      print("ERROR: $e");
    }
  }

  @override
  Future<List<String>> checkEmailExsist(String email) async {
    return _firebaseAuth.fetchSignInMethodsForEmail(email);
  }
}
