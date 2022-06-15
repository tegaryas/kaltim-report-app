import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:injectable/injectable.dart';

import 'package:kaltim_report/core/repositories/auth_repository_interface.dart';
import 'package:kaltim_report/modules/profile/models/profile_form_model.dart';
import 'package:kaltim_report/modules/profile/models/profile_model.dart';
import 'package:kaltim_report/modules/profile/providers/profile_provider_interface.dart';
import 'package:kaltim_report/modules/report/models/report_model.dart';

@Injectable(as: ProfileProviderInterface)
class ProfileProvider implements ProfileProviderInterface {
  final FirebaseFirestore firestore;
  final AuthRepositoryInterface authRepository;
  final FirebaseStorage imageStorage;

  ProfileProvider({
    required this.authRepository,
    required this.firestore,
    required this.imageStorage,
  });

  @override
  Stream<ProfileModel> getCurrentUserData() {
    return firestore
        .collection("Users")
        .doc(authRepository.loggedUser.uid)
        .snapshots()
        .map((event) => ProfileModel.fromJson(event.data()!));
  }

  @override
  Stream<ReportModel> getSavedReport() {
    // TODO: implement getSavedReport
    throw UnimplementedError();
  }

  @override
  Future<void> updateProfileData(ProfileFormModel data) async {
    await firestore
        .collection("Users")
        .doc(authRepository.loggedUser.uid)
        .update(data.toJson());
  }

  @override
  Future<void> updateUserPassword(String newPassword) async {
    await authRepository.loggedUser.updatePassword(newPassword);
  }

  @override
  Future<ProfileModel> getUserData() {
    return firestore
        .collection("Users")
        .doc(authRepository.loggedUser.uid)
        .get()
        .then((value) => ProfileModel.fromJson(value.data()!));
  }

  @override
  UploadTask? uploadProfilePicture(XFile file) {
    final ref = imageStorage.ref().child("images/${file.path}");

    final convertXFile = File(file.path);

    return ref.putFile(convertXFile);
  }
}
