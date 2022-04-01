import 'package:kaltim_report/modules/emergency/models/emergency_call_form_model.dart';

abstract class EmergencyCallProviderInterface {
  Future<void> postUserEmergencyCall(EmergencyCallFormModel data);
}
