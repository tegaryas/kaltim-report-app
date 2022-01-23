import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:injectable/injectable.dart';
import 'package:kaltim_report/modules/home/models/feature_model.dart';
import 'package:kaltim_report/modules/home/providers/home_provider_interface.dart';

@Injectable(as: HomeProviderInterface)
class HomeProvider implements HomeProviderInterface {
  final FirebaseFirestore firestore = FirebaseFirestore.instance;

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
        .orderBy("name")
        .snapshots()
        .map((snapshot) {
      return snapshot.docs
          .map((doc) => FeatureModel.fromJson(doc.data()))
          .toList();
    });
  }
}
