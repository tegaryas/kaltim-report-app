import 'package:kaltim_report/modules/home/models/feature_model.dart';
import 'package:kaltim_report/modules/home/models/report_model.dart';

abstract class HomeProviderInterface {
  Stream<List<ReportModel>> getReportList();
  Stream<List<FeatureModel>> getFeatureList();
}
