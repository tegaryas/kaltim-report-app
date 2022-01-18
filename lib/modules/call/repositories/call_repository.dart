import 'package:injectable/injectable.dart';
import 'package:kaltim_report/modules/call/models/emergency_call_model.dart';
import 'package:kaltim_report/modules/call/providers/call_provider_interface.dart';
import 'package:kaltim_report/modules/call/repositories/call_repository_interface.dart';

@Injectable(as: CallRepositoryInterface)
class CallRepository implements CallRepositoryInterface {
  final CallProviderInterface callProvider;

  CallRepository({required this.callProvider});
  @override
  Stream<List<EmergencyCallModel>> getEmergencyCallList() {
    return callProvider.getEmergencyCallList();
  }
}
