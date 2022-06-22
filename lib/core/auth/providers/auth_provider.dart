import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:injectable/injectable.dart';
import 'package:kaltim_report/constant/constant.dart';
import 'package:kaltim_report/core/auth/providers/auth_provider_interface.dart';
import 'package:kaltim_report/modules/profile/models/profile_model.dart';

@Injectable(as: AuthProviderInterface)
class AuthProvider implements AuthProviderInterface {
  final FirebaseAuth firebaseAuth;
  final GoogleSignIn googleSignIn;
  final FirebaseFirestore firebaseFirestore;

  AuthProvider(this.firebaseAuth, this.googleSignIn, this.firebaseFirestore);

  @override
  bool isLoggedIn() => firebaseAuth.currentUser != null;

  @override
  User get loggedUser => firebaseAuth.currentUser!;

  @override
  Future<void> logOut() async {
    firebaseAuth.signOut();
    googleSignIn.signOut();
  }

  @override
  Future<ProfileModel> getUserCurrentData() async {
    return await firebaseFirestore
        .collection(ApiPath.users)
        .doc(loggedUser.uid)
        .get()
        .then((value) => ProfileModel.fromJson(value.data()!));
  }

  @override
  Future<List<String>> getAllUserDeviceToken() async {
    final list = await firebaseFirestore.collection(ApiPath.users).get().then(
        (value) => value.docs.map((e) => e.data()['device_token']).toList());

    final notNullList =
        List<String>.from(list.where((element) => element != null).toList());

    return notNullList;
  }

  @override
  Future<void> deleteDeviceToken() {
    return firebaseFirestore
        .collection(ApiPath.users)
        .doc(loggedUser.uid)
        .update({"device_token": FieldValue.delete()});
  }
}
