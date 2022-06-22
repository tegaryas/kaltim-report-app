import 'package:kaltim_report/modules/emergency_button/models/emergency_call_form_model.dart';
import 'package:kaltim_report/modules/emergency_button/models/emergency_call_model.dart';

abstract class EmergencyCallProviderInterface {
  Future<void> postUserEmergencyCall(EmergencyCallFormModel data);

  Future<List<EmergencyCallModel>> getEmergencyCallList();

  Future<void> removeUserEmergencyCall(String id);

  Stream<List<EmergencyCallModel>> getEmergencyCallListStream();
}
