import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:injectable/injectable.dart';
import 'package:kaltim_report/constant/constant.dart';
import 'package:kaltim_report/modules/call/models/emergency_call_model.dart';
import 'package:kaltim_report/modules/call/providers/call_provider_interface.dart';

@Injectable(as: CallProviderInterface)
class CallProvider implements CallProviderInterface {
  final FirebaseFirestore firestore;

  CallProvider(this.firestore);

  @override
  Stream<List<EmergencyCallModel>> getEmergencyCallList() {
    return firestore
        .collection(ApiPath.emergencyCall)
        .snapshots()
        .map((snapshot) {
      return snapshot.docs
          .map((doc) => EmergencyCallModel.fromJson(doc.data()))
          .toList();
    });
  }
}
