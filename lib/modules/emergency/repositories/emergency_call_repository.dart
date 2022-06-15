import 'package:injectable/injectable.dart';
import 'package:kaltim_report/modules/emergency/models/emergency_call_form_model.dart';
import 'package:kaltim_report/modules/emergency/models/emergency_call_model.dart';
import 'package:kaltim_report/modules/emergency/providers/emergency_call_provider_interface.dart';
import 'package:kaltim_report/modules/emergency/repositories/emergency_call_repository_interface.dart';

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
}
