import 'package:kaltim_report/modules/call/models/emergency_call_model.dart';

abstract class CallRepositoryInterface {
  Stream<List<EmergencyCallModel>> getEmergencyCallList();
}
