import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:injectable/injectable.dart';
import 'package:kaltim_report/constant/constant.dart';
import 'package:kaltim_report/modules/home/models/banner_model.dart';
import 'package:kaltim_report/modules/home/models/covid_feature_model.dart';
import 'package:kaltim_report/modules/home/models/statistic_model.dart';
import 'package:kaltim_report/modules/home/models/feature_model.dart';
import 'package:kaltim_report/modules/home/providers/home_provider_interface.dart';
import 'package:kaltim_report/modules/report/models/report_model.dart';
import 'package:kaltim_report/services/remote_config_service/remote_config_service_interface.dart';

@Injectable(as: HomeProviderInterface)
class HomeProvider implements HomeProviderInterface {
  final FirebaseFirestore firestore;
  final RemoteConfigServiceInterface remoteConfigService;

  HomeProvider(this.firestore, this.remoteConfigService);

  @override
  Future<List<DocumentSnapshot>> getReportList() async {
    return (await firestore
            .collection(ApiPath.report)
            .orderBy("dateInput", descending: true)
            .limit(10)
            .get())
        .docs;
  }

  @override
  Stream<List<FeatureModel>> getFeatureList() {
    return firestore
        .collection(ApiPath.feature)
        .orderBy("name", descending: true)
        .snapshots()
        .map((snapshot) {
      return snapshot.docs
          .map((doc) => FeatureModel.fromJson(doc.data()))
          .toList();
    });
  }

  @override
  Future<List<BannerModel>> getBanner() async {
    return await firestore.collection(ApiPath.banner).get().then((value) =>
        value.docs.map((e) => BannerModel.fromJson(e.data())).toList());
  }

  @override
  Future<List<CovidFeatureConfigModel>> getCovidFeature() async {
    final res = await remoteConfigService.getJson('feature_covid');

    return (res['features'] as List<dynamic>)
        .map((e) => CovidFeatureConfigModel.fromJson(e as Map<String, dynamic>))
        .toList();
  }

  @override
  Future<List<DonutChartModel>> getReportStatistic() async {
    final res = await firestore
        .collection(ApiPath.report)
        .where("dateInput",
            isGreaterThanOrEqualTo: DateTime(DateTime.now().year,
                DateTime.now().month - 1, DateTime.now().day))
        .where("dateInput", isLessThanOrEqualTo: DateTime.now())
        .get();

    final groupedCategory = res.docs
        .map((e) => ReportModel.fromJson(e.data()))
        .toList()
        .groupListsBy((element) => element.category.name);

    final List<DonutChartModel> chartData = groupedCategory.entries.map((e) {
      return DonutChartModel(
        categoryName: e.key,
        length: e.value.length,
      );
    }).toList();

    return chartData;
  }

  @override
  Future<List<ReportStatusChartModel?>> getReportStatisticByStatus() async {
    final res = await firestore
        .collection(ApiPath.report)
        .where("dateInput",
            isGreaterThanOrEqualTo: DateTime(DateTime.now().year,
                DateTime.now().month - 1, DateTime.now().day))
        .where("dateInput", isLessThanOrEqualTo: DateTime.now())
        .get();

    final groupedCategory = res.docs
        .map((e) => ReportModel.fromJson(e.data()))
        .toList()
        .groupListsBy((element) => element.lastStatus);

    final List<ReportStatusChartModel> chartData =
        groupedCategory.entries.map((e) {
      return ReportStatusChartModel(
        type: e.key,
        length: e.value.length,
      );
    }).toList();

    return chartData;
  }
}
