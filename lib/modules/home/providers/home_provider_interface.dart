import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:kaltim_report/modules/home/models/feature_model.dart';

abstract class HomeProviderInterface {
  Future<List<DocumentSnapshot>> getReportList();

  Future<List<DocumentSnapshot>> getReportNextList(
      List<DocumentSnapshot> documentList);

  Stream<List<FeatureModel>> getFeatureList();
}