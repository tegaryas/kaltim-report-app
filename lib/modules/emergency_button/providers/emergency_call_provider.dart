import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:injectable/injectable.dart';
import 'package:kaltim_report/constant/constant.dart';
import 'package:kaltim_report/core/auth/repositories/auth_repository_interface.dart';
import 'package:kaltim_report/modules/emergency_button/models/emergency_call_form_model.dart';
import 'package:kaltim_report/modules/emergency_button/models/emergency_call_model.dart';
import 'package:kaltim_report/modules/emergency_button/providers/emergency_call_provider_interface.dart';

@Injectable(as: EmergencyCallProviderInterface)
class EmergencyCallProvider implements EmergencyCallProviderInterface {
  final FirebaseFirestore firebaseFirestore;
  final AuthRepositoryInterface authRepository;

  EmergencyCallProvider(this.firebaseFirestore, this.authRepository);
  @override
  Future<void> postUserEmergencyCall(EmergencyCallFormModel data) async {
    await firebaseFirestore
        .collection(ApiPath.emergencyButton)
        .doc(authRepository.loggedUser.uid)
        .set(data.toJson());
  }

  @override
  Future<List<EmergencyCallModel>> getEmergencyCallList() async {
    final res = await firebaseFirestore
        .collection(ApiPath.emergencyButton)
        .where('userId', isNotEqualTo: authRepository.loggedUser.uid)
        .get()
        .then((value) => value.docs
            .map((e) => EmergencyCallModel.fromJson(e.data()))
            .toList());

    res.sort((a, b) => a.dateInput.compareTo(b.dateInput));

    return res;
  }

  @override
  Future<void> removeUserEmergencyCall(String id) async {
    await firebaseFirestore
        .collection(ApiPath.emergencyButton)
        .doc(id)
        .delete();
  }

  @override
  Stream<List<EmergencyCallModel>> getEmergencyCallListStream() {
    return firebaseFirestore
        .collection(ApiPath.emergencyButton)
        .where('userId', isNotEqualTo: authRepository.loggedUser.uid)
        .snapshots()
        .map((snapshot) {
      return snapshot.docs
          .map((doc) => EmergencyCallModel.fromJson(doc.data()))
          .toList();
    });
  }
}
