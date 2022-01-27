import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:injectable/injectable.dart';
import 'package:kaltim_report/core/repositories/auth_repositories_interface.dart';

import 'package:kaltim_report/modules/report/models/report_form_model.dart';
import 'package:kaltim_report/modules/report/models/report_model.dart';
import 'package:kaltim_report/modules/report/providers/report_provider_interface.dart';

@Injectable(as: ReportProviderInterface)
class ReportProvider implements ReportProviderInterface {
  final FirebaseFirestore firestore = FirebaseFirestore.instance;
  final FirebaseStorage imageStorage = FirebaseStorage.instance;
  final AuthRepositoryInterface authRepository;

  ReportProvider({required this.authRepository});

  @override
  Future<void> addReportForm(ReportFormModel reportForm) async {
    await firestore
        .collection("Report")
        .doc(reportForm.id)
        .set(reportForm.toJson());
  }

  @override
  UploadTask? uploadReportImage(XFile file) {
    final ref = imageStorage.ref().child("images/${file.path}");

    final convertXFile = File(file.path);

    return ref.putFile(convertXFile);
  }

  @override
  Stream<List<ReportModel>> getCurrentUserReport() {
    return firestore
        .collection("Report")
        .orderBy("dateInput", descending: true)
        .where("userId", isEqualTo: authRepository.loggedUser.uid)
        .snapshots()
        .map((snapshot) {
      return snapshot.docs
          .map((doc) => ReportModel.fromJson(doc.data()))
          .toList();
    });
  }
}
