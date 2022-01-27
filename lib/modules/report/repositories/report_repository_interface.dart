import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';

import 'package:kaltim_report/modules/report/models/report_form_model.dart';
import 'package:kaltim_report/modules/report/models/report_model.dart';

abstract class ReportRepositoryInterface {
  Future<void> addReportForm(ReportFormModel reportForm);
  Stream<List<ReportModel>> getCurrentUserReport();
  UploadTask? uploadReportImage(XFile file);
}
