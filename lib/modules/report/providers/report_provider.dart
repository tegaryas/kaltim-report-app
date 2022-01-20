import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:injectable/injectable.dart';
import 'package:kaltim_report/modules/report/models/report_form_model.dart';
import 'package:kaltim_report/modules/report/providers/report_provider_interface.dart';

@Injectable(as: ReportProviderInterface)
class ReportProvider implements ReportProviderInterface {
  CollectionReference report = FirebaseFirestore.instance.collection("Report");
  FirebaseStorage imageStorage = FirebaseStorage.instance;
  @override
  Future<void> addReportForm(ReportFormModel reportForm) async {
    try {
      await report.doc(reportForm.id).set(reportForm.toJson());
    } on FirebaseException catch (e) {
      print("ERROR: $e");
    }
  }

  @override
  UploadTask? uploadReportImage(XFile file) {
    try {
      final ref = imageStorage.ref().child("images/${file.path}");

      final convertXFile = File(file.path);

      return ref.putFile(convertXFile);
    } on FirebaseException catch (e) {
      return null;
    }
  }
}
