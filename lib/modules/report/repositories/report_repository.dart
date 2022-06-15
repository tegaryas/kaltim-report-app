import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:injectable/injectable.dart';
import 'package:kaltim_report/modules/report/models/report_category_model.dart';

import 'package:kaltim_report/modules/report/models/report_form_model.dart';
import 'package:kaltim_report/modules/report/models/report_list_filter_model.dart';
import 'package:kaltim_report/modules/report/models/report_model.dart';
import 'package:kaltim_report/modules/report/providers/report_provider_interface.dart';
import 'package:kaltim_report/modules/report/repositories/report_repository_interface.dart';

@Injectable(as: ReportRepositoryInterface)
class ReportRepository implements ReportRepositoryInterface {
  final ReportProviderInterface reportProvider;

  ReportRepository({required this.reportProvider});

  @override
  Future<void> addReportForm(ReportFormModel reportForm) async {
    await reportProvider.addReportForm(reportForm);
  }

  @override
  UploadTask? uploadReportImage(XFile file) {
    return reportProvider.uploadReportImage(file);
  }

  @override
  Stream<List<ReportModel>> getCurrentUserReport() {
    return reportProvider.getCurrentUserReport();
  }

  @override
  Future<List<ReportModel>> getAllReportList(
      {required ReportListFilterModel filter}) {
    return reportProvider.getAllReportList(filter);
  }

  @override
  Future<List<ReportModel>> getCurrentUserReportHome() {
    return reportProvider.getCurrentUserReportHome();
  }

  @override
  Future<ReportModel> getReportById(String id) {
    return reportProvider.getReportById(id);
  }

  @override
  Future<void> updateReportStatus(String id, ReportProgressModel data) {
    return reportProvider.updateReportStatus(id, data);
  }

  @override
  Future<void> deleteReportById(String id) {
    return reportProvider.deleteReportById(id);
  }

  @override
  Future<List<ReportCategoryModel>> getReportCategories() {
    return reportProvider.getReportCategories();
  }
}
