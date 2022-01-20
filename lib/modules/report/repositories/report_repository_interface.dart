import 'package:kaltim_report/modules/report/models/report_form_model.dart';

abstract class ReportRepositoryInterface {
  Future<void> addReportForm(ReportFormModel reportForm);
}
