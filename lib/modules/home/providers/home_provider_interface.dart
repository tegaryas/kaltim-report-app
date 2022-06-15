import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:kaltim_report/modules/home/models/banner_model.dart';
import 'package:kaltim_report/modules/home/models/covid_feature_model.dart';
import 'package:kaltim_report/modules/home/models/statistic_model.dart';
import 'package:kaltim_report/modules/home/models/feature_model.dart';

abstract class HomeProviderInterface {
  Future<List<DocumentSnapshot>> getReportList();

  Future<List<DocumentSnapshot>> getReportNextList(
      List<DocumentSnapshot> documentList);

  Stream<List<FeatureModel>> getFeatureList();

  Future<List<BannerModel>> getBanner();

  Future<List<CovidFeatureConfigModel>> getCovidFeature();

  Future<List<DonutChartModel>> getReportStatistic();

  Future<List<ReportStatusChartModel>> getReportStatisticByStatus();
}
