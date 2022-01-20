import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:injectable/injectable.dart';
import 'package:kaltim_report/modules/report/models/report_form_model.dart';
import 'package:kaltim_report/modules/report/providers/report_provider_interface.dart';

@Injectable(as: ReportProviderInterface)
class ReportProvider implements ReportProviderInterface {
  CollectionReference report = FirebaseFirestore.instance.collection("Report");
  @override
  Future<void> addReportForm(ReportFormModel reportForm) async {
    try {
      await report.doc(reportForm.id).set(reportForm.toJson());
    } on FirebaseException catch (e) {
      print("ERROR: $e");
    }
  }
}
