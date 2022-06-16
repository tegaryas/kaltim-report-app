import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:csv/csv.dart';
import 'package:excel/excel.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:injectable/injectable.dart';
import 'package:intl/intl.dart';

import 'package:kaltim_report/core/repositories/auth_repository_interface.dart';
import 'package:kaltim_report/modules/report/models/report_category_model.dart';
import 'package:kaltim_report/modules/report/models/report_export_form_model.dart';
import 'package:kaltim_report/modules/report/models/report_form_model.dart';
import 'package:kaltim_report/modules/report/models/report_list_filter_model.dart';
import 'package:kaltim_report/modules/report/models/report_model.dart';
import 'package:kaltim_report/modules/report/providers/report_provider_interface.dart';

@Injectable(as: ReportProviderInterface)
class ReportProvider implements ReportProviderInterface {
  final FirebaseFirestore firestore;
  final FirebaseStorage imageStorage;
  final AuthRepositoryInterface authRepository;

  ReportProvider({
    required this.authRepository,
    required this.firestore,
    required this.imageStorage,
  });

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

  @override
  Future<List<ReportModel>> getAllReportList(
      ReportListFilterModel filter) async {
    if (filter.lastDocument == "") {
      return await firestore
          .collection('Report')
          .orderBy("id", descending: true)
          .where('lastStatus', isEqualTo: filter.status?.toShortString())
          .limit(filter.pageSize)
          .get()
          .then((value) =>
              value.docs.map((e) => ReportModel.fromJson(e.data())).toList());
    } else {
      return await firestore
          .collection('Report')
          .orderBy("id", descending: true)
          .where('lastStatus', isEqualTo: filter.status?.toShortString())
          .startAfter([filter.lastDocument])
          .limit(filter.pageSize)
          .get()
          .then((value) =>
              value.docs.map((e) => ReportModel.fromJson(e.data())).toList());
    }
  }

  @override
  Future<List<ReportModel>> getCurrentUserReportHome() async {
    return await firestore
        .collection('Report')
        .orderBy("dateInput", descending: true)
        .where("userId", isEqualTo: authRepository.loggedUser.uid)
        .limit(4)
        .get()
        .then((value) =>
            value.docs.map((e) => ReportModel.fromJson(e.data())).toList());
  }

  @override
  Future<ReportModel> getReportById(String id) async {
    return await firestore
        .collection("Report")
        .doc(id)
        .get()
        .then((value) => ReportModel.fromJson(value.data()!));
  }

  @override
  Future<void> updateReportStatus(String id, ReportProgressModel data) async {
    await firestore.collection("Report").doc(id).update({
      "lastStatus": data.statusType.toShortString(),
      "reportProgress": FieldValue.arrayUnion([data.toJson()]),
      'lastUpdate': data.date
    });
  }

  @override
  Future<void> deleteReportById(String id) async {
    await firestore.collection("Report").doc(id).delete();
  }

  @override
  Future<List<ReportCategoryModel>> getReportCategories() async {
    return await firestore.collection('ReportCategory').get().then((value) =>
        value.docs.map((e) => ReportCategoryModel.fromJson(e.data())).toList());
  }

  @override
  Future<void> exportReport(ReportExportFormModel form) async {
    List<List<dynamic>> rows = [];

    final res = await firestore
        .collection('Report')
        .where("dateInput", isGreaterThanOrEqualTo: form.startDate)
        .where("dateInput", isLessThanOrEqualTo: form.endDate)
        .get()
        .then((value) =>
            value.docs.map((e) => ReportModel.fromJson(e.data())).toList());

    rows.add([
      "ID",
      "ID Pengguna",
      "Alamat",
      "Kategori",
      "Tanggal Masuk",
      "Status Terakhir",
      "Detail Masalah",
      "Detail Tambahan"
    ]);

    if (res.isNotEmpty) {
      for (var i = 0; i < res.length; i++) {
        List<dynamic> row = [];

        row.add(res[i].id);
        row.add(res[i].userId);
        row.add(res[i].address);
        row.add(res[i].category.name);
        row.add(DateFormat('dd/MM/yyyy HH:mm').format(res[i].dateInput!));
        row.add(res[i].lastStatus.toShortString());
        row.add(res[i].problem);
        row.add(res[i].description);
        rows.add(row);
      }

      switch (form.format) {
        case ReportExportFormat.csv:
          final file =
              await File("/storage/emulated/0/Download/data.csv").create();
          String csv = const ListToCsvConverter().convert(rows);
          file.writeAsString(csv);
          break;
        case ReportExportFormat.excel:
          final file =
              await File("/storage/emulated/0/Download/data.xlsx").create();
          final excel = Excel.createExcel();

          Sheet sheetObject = excel['Sheet 1'];

          for (var row in rows) {
            sheetObject.appendRow(row);
          }

          final cek = excel.encode();

          file.writeAsBytes(cek!);

          break;
        default:
      }
    }
  }
}
