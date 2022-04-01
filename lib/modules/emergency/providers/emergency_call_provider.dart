import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:injectable/injectable.dart';
import 'package:kaltim_report/modules/emergency/models/emergency_call_form_model.dart';
import 'package:kaltim_report/modules/emergency/providers/emergency_call_provider_interface.dart';

@Injectable(as: EmergencyCallProviderInterface)
class EmergencyCallProvider implements EmergencyCallProviderInterface {
  final FirebaseFirestore firebaseFirestore;

  EmergencyCallProvider(this.firebaseFirestore);
  @override
  Future<void> postUserEmergencyCall(EmergencyCallFormModel data) async {
    await firebaseFirestore
        .collection("emergency_report")
        .doc()
        .set(data.toJson());
  }
}
