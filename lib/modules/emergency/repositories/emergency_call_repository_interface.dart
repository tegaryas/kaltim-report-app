import 'package:kaltim_report/modules/emergency/models/emergency_call_form_model.dart';

abstract class EmergencyCallRepositoryInterface {
  Future<void> postUserEmergencyCall(EmergencyCallFormModel data);
}
