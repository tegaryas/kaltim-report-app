import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:csv/csv.dart';
import 'package:excel/excel.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter_email_sender/flutter_email_sender.dart';
import 'package:image_picker/image_picker.dart';
import 'package:injectable/injectable.dart';
import 'package:intl/intl.dart';
import 'package:kaltim_report/constant/constant.dart';

import 'package:kaltim_report/core/auth/repositories/auth_repository_interface.dart';
import 'package:kaltim_report/modules/report/models/report_category_model.dart';
import 'package:kaltim_report/modules/report/models/report_discussion_model.dart';
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
        .collection(ApiPath.report)
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
        .collection(ApiPath.report)
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
          .collection(ApiPath.report)
          .orderBy("id", descending: true)
          .where('lastStatus', isEqualTo: filter.status?.toShortString())
          .limit(filter.pageSize)
          .get()
          .then((value) =>
              value.docs.map((e) => ReportModel.fromJson(e.data())).toList());
    } else {
      return await firestore
          .collection(ApiPath.report)
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
        .collection(ApiPath.report)
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
        .collection(ApiPath.report)
        .doc(id)
        .get()
        .then((value) => ReportModel.fromJson(value.data()!));
  }

  @override
  Future<void> updateReportStatus(String id, ReportProgressModel data) async {
    await firestore.collection(ApiPath.report).doc(id).update({
      "lastStatus": data.statusType.toShortString(),
      "reportProgress": FieldValue.arrayUnion([data.toJson()]),
      'lastUpdate': data.date
    });
  }

  @override
  Future<void> deleteReportById(String id) async {
    await firestore.collection(ApiPath.report).doc(id).delete();
  }

  @override
  Future<List<ReportCategoryModel>> getReportCategories() async {
    return await firestore.collection(ApiPath.reportCategory).get().then(
        (value) => value.docs
            .map((e) => ReportCategoryModel.fromJson(e.data()))
            .toList());
  }

  @override
  Future<void> exportReport(ReportExportFormModel form) async {
    List<List<dynamic>> rows = [];

    final res = await firestore
        .collection(ApiPath.report)
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

  @override
  Future<void> addBookmarkReport(ReportModel report) async {
    await firestore
        .collection(ApiPath.users)
        .doc(authRepository.loggedUser.uid)
        .collection(ApiPath.bookmarkReport)
        .doc(report.id)
        .set(report.toJson());
  }

  @override
  Future<bool> isAlreadyBookmark(String id) async {
    final res = await firestore
        .collection(ApiPath.users)
        .doc(authRepository.loggedUser.uid)
        .collection(ApiPath.bookmarkReport)
        .doc(id)
        .get();

    return res.data() != null;
  }

  @override
  Future<void> removeBookmarkReport(ReportModel report) async {
    await firestore
        .collection(ApiPath.users)
        .doc(authRepository.loggedUser.uid)
        .collection(ApiPath.bookmarkReport)
        .doc(report.id)
        .delete();
  }

  @override
  Future<List<ReportModel>> getBookmarkReport(
      ReportListFilterModel filter) async {
    if (filter.lastDocument == "") {
      return await firestore
          .collection(ApiPath.users)
          .doc(authRepository.loggedUser.uid)
          .collection(ApiPath.bookmarkReport)
          .orderBy("id", descending: true)
          .where('lastStatus', isEqualTo: filter.status?.toShortString())
          .limit(filter.pageSize)
          .get()
          .then((value) =>
              value.docs.map((e) => ReportModel.fromJson(e.data())).toList());
    } else {
      return await firestore
          .collection(ApiPath.users)
          .doc(authRepository.loggedUser.uid)
          .collection(ApiPath.bookmarkReport)
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
  Future<void> sendExportReportToEmail(Email email) {
    return FlutterEmailSender.send(email);
  }

  @override
  Stream<List<ReportDiscussionModel>> getReportDiscussions(String id) {
    return firestore
        .collection(ApiPath.report)
        .doc(id)
        .collection(ApiPath.reportDiscussion)
        .orderBy("dateInput", descending: true)
        .snapshots()
        .map((snapshot) {
      return snapshot.docs
          .map((doc) => ReportDiscussionModel.fromJson(doc.data()))
          .toList();
    });
  }

  @override
  Future<void> sendReportDiscussion(ReportDiscussionModel form) {
    return firestore
        .collection(ApiPath.report)
        .doc(form.reportId)
        .collection(ApiPath.reportDiscussion)
        .doc()
        .set(form.toJson());
  }
}
