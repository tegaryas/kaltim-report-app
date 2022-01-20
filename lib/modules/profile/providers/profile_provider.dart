import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:injectable/injectable.dart';
import 'package:kaltim_report/core/repositories/auth_repositories_interface.dart';
import 'package:kaltim_report/modules/home/models/report_model.dart';
import 'package:kaltim_report/modules/profile/models/profile_model.dart';
import 'package:kaltim_report/modules/profile/providers/profile_provider_interface.dart';

@Injectable(as: ProfileProviderInterface)
class ProfileProvider implements ProfileProviderInterface {
  final FirebaseFirestore firestore = FirebaseFirestore.instance;
  final AuthRepositoryInterface authRepository;

  ProfileProvider({required this.authRepository});

  @override
  Stream<ProfileModel> getCurrentUserData() {
    return firestore
        .collection("Users")
        .doc(authRepository.loggedUser.uid)
        .snapshots()
        .map((event) => ProfileModel.fromJson(event.data()!));
  }

  @override
  Stream<ReportModel> getSavedReport() {
    // TODO: implement getSavedReport
    throw UnimplementedError();
  }
}
