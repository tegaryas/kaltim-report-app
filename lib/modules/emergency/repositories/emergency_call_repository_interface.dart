import 'package:kaltim_report/modules/emergency/models/emergency_call_form_model.dart';
import 'package:kaltim_report/modules/emergency/models/emergency_call_model.dart';

abstract class EmergencyCallRepositoryInterface {
  Future<void> postUserEmergencyCall(EmergencyCallFormModel data);

  Future<List<EmergencyCallModel>> getEmergencyCallList();
}
