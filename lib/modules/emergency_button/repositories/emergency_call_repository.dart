import 'package:injectable/injectable.dart';
import 'package:kaltim_report/modules/emergency_button/models/emergency_call_form_model.dart';
import 'package:kaltim_report/modules/emergency_button/models/emergency_call_model.dart';
import 'package:kaltim_report/modules/emergency_button/providers/emergency_call_provider_interface.dart';
import 'package:kaltim_report/modules/emergency_button/repositories/emergency_call_repository_interface.dart';

@Injectable(as: EmergencyCallRepositoryInterface)
class EmergencyCallRepository implements EmergencyCallRepositoryInterface {
  final EmergencyCallProviderInterface emergencyCallProvider;

  EmergencyCallRepository(this.emergencyCallProvider);
  @override
  Future<void> postUserEmergencyCall(EmergencyCallFormModel data) {
    return emergencyCallProvider.postUserEmergencyCall(data);
  }

  @override
  Future<List<EmergencyCallModel>> getEmergencyCallList() {
    return emergencyCallProvider.getEmergencyCallList();
  }

  @override
  Future<void> removeUserEmergencyCall(String id) {
    return emergencyCallProvider.removeUserEmergencyCall(id);
  }

  @override
  Stream<List<EmergencyCallModel>> getEmergencyCallListStream() {
    return emergencyCallProvider.getEmergencyCallListStream();
  }
}
