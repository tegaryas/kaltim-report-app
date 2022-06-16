import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:kaltim_report/modules/report/models/report_category_model.dart';
import 'package:kaltim_report/modules/report/models/report_export_form_model.dart';

import 'package:kaltim_report/modules/report/models/report_form_model.dart';
import 'package:kaltim_report/modules/report/models/report_list_filter_model.dart';
import 'package:kaltim_report/modules/report/models/report_model.dart';

abstract class ReportProviderInterface {
  Future<void> addReportForm(ReportFormModel reportForm);

  Stream<List<ReportModel>> getCurrentUserReport();

  UploadTask? uploadReportImage(XFile file);

  Future<List<ReportModel>> getAllReportList(ReportListFilterModel filter);

  Future<List<ReportModel>> getCurrentUserReportHome();

  Future<ReportModel> getReportById(String id);

  Future<void> updateReportStatus(String id, ReportProgressModel data);

  Future<void> deleteReportById(String id);

  Future<List<ReportCategoryModel>> getReportCategories();

  Future<void> exportReport(ReportExportFormModel form);

  Future<void> addBookmarkReport(ReportModel report);

  Future<void> removeBookmarkReport(ReportModel report);

  Future<bool> isAlreadyBookmark(String id);

  Future<List<ReportModel>> getBookmarkReport(ReportListFilterModel filter);
}
