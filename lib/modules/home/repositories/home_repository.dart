import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:injectable/injectable.dart';
import 'package:kaltim_report/modules/home/models/banner_model.dart';
import 'package:kaltim_report/modules/home/models/covid_feature_model.dart';
import 'package:kaltim_report/modules/home/models/statistic_model.dart';
import 'package:kaltim_report/modules/home/models/feature_model.dart';
import 'package:kaltim_report/modules/home/providers/home_provider_interface.dart';
import 'package:kaltim_report/modules/home/repositories/home_repository_interface.dart';

@Injectable(as: HomeRepositoryInterface)
class HomeRepository implements HomeRepositoryInterface {
  final HomeProviderInterface homeProvider;
  HomeRepository({required this.homeProvider});

  @override
  Future<List<DocumentSnapshot>> getReportList() {
    return homeProvider.getReportList();
  }

  @override
  Stream<List<FeatureModel>> getFeatureList() {
    return homeProvider.getFeatureList();
  }

  @override
  Future<List<BannerModel>> getBanner() {
    return homeProvider.getBanner();
  }

  @override
  Future<List<CovidFeatureConfigModel>> getCovidFeature() {
    return homeProvider.getCovidFeature();
  }

  @override
  Future<List<DonutChartModel>> getReportStatistic() {
    return homeProvider.getReportStatistic();
  }

  @override
  Future<List<ReportStatusChartModel?>> getReportStatisticByStatus() {
    return homeProvider.getReportStatisticByStatus();
  }
}
