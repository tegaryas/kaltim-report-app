import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:injectable/injectable.dart';
import 'package:kaltim_report/modules/home/models/banner_model.dart';
import 'package:kaltim_report/modules/home/models/covid_feature_model.dart';
import 'package:kaltim_report/modules/home/models/feature_model.dart';
import 'package:kaltim_report/modules/home/providers/home_provider_interface.dart';
import 'package:kaltim_report/services/remote_config_service/remote_config_service_interface.dart';

@Injectable(as: HomeProviderInterface)
class HomeProvider implements HomeProviderInterface {
  final FirebaseFirestore firestore;
  final RemoteConfigServiceInterface remoteConfigService;

  HomeProvider(this.firestore, this.remoteConfigService);

  @override
  Future<List<DocumentSnapshot>> getReportList() async {
    return (await firestore
            .collection("Report")
            .orderBy("dateInput", descending: true)
            .limit(10)
            .get())
        .docs;
  }

  @override
  Future<List<DocumentSnapshot<Object?>>> getReportNextList(
      List<DocumentSnapshot<Object?>> documentList) async {
    return (await firestore
            .collection("Report")
            .orderBy("dateInput", descending: true)
            .startAfterDocument(documentList[documentList.length - 1])
            .limit(10)
            .get())
        .docs;
  }

  @override
  Stream<List<FeatureModel>> getFeatureList() {
    return firestore
        .collection("Features")
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
    return await firestore.collection('banner').get().then((value) =>
        value.docs.map((e) => BannerModel.fromJson(e.data())).toList());
  }

  @override
  Future<List<CovidFeatureConfigModel>> getCovidFeature() async {
    final res = await remoteConfigService.getJson('feature_covid');

    return (res['features'] as List<dynamic>)
        .map((e) => CovidFeatureConfigModel.fromJson(e as Map<String, dynamic>))
        .toList();
  }
}
