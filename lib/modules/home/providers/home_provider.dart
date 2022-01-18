import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:injectable/injectable.dart';
import 'package:kaltim_report/modules/home/models/report_model.dart';
import 'package:kaltim_report/modules/home/providers/home_provider_interface.dart';

@Injectable(as: HomeProviderInterface)
class HomeProvider implements HomeProviderInterface {
  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  @override
  Stream<List<ReportModel>> getReportList() {
    return firestore
        .collection("Report")
        .orderBy("dateInput")
        .snapshots()
        .map((snapshot) {
      return snapshot.docs
          .map((doc) => ReportModel.fromJson(doc.data()))
          .toList();
    });
  }
}
