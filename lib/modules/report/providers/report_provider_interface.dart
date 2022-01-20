import 'package:kaltim_report/modules/report/models/report_form_model.dart';

abstract class ReportProviderInterface {
  Future<void> addReportForm(ReportFormModel reportForm);
}
