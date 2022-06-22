import 'package:bloc_test/bloc_test.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:kaltim_report/modules/emergency_button/blocs/emergency_call/emergency_call_bloc.dart';
import 'package:kaltim_report/modules/emergency_button/blocs/emergency_call_list/emergency_call_list_bloc.dart';
import 'package:kaltim_report/modules/emergency_button/models/emergency_call_form_model.dart';
import 'package:kaltim_report/modules/emergency_button/models/emergency_call_model.dart';
import 'package:kaltim_report/modules/emergency_button/providers/emergency_call_provider.dart';
import 'package:kaltim_report/modules/emergency_button/repositories/emergency_call_repository.dart';
import 'package:kaltim_report/modules/profile/models/profile_model.dart';
import 'package:kaltim_report/modules/profile/providers/profile_provider.dart';
import 'package:kaltim_report/modules/profile/repositories/profile_repository.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'emergency_button_test.mocks.dart';

@GenerateMocks([
  EmergencyCallRepository,
  EmergencyCallProvider,
  ProfileRepository,
  ProfileProvider,
])
void main() {
  final MockEmergencyCallProvider emergencyButtonProvider =
      MockEmergencyCallProvider();
  final EmergencyCallRepository emergencyButtonRepository =
      EmergencyCallRepository(emergencyButtonProvider);

  final MockProfileProvider profileProvider = MockProfileProvider();
  final ProfileRepository profileRepository =
      ProfileRepository(profileProvider: profileProvider);

  group('Test Emergency Button Bloc', () {
    group('Given User Try To Make Emergency Call,', () {
      final EmergencyCallFormModel postData = EmergencyCallFormModel(
        location: const GeoPoint(0, 0),
        dateInput: DateTime.now(),
        name: "Tegar",
        phoneNumber: '0912019302',
        userId: '',
      );

      const ProfileModel profileModel = ProfileModel(
        name: "name",
        email: "email",
        username: "username",
        password: "password",
        role: UserRole.user,
      );

      when(emergencyButtonRepository.postUserEmergencyCall(postData))
          .thenAnswer((_) => Future.value());

      when(profileRepository.getUserData())
          .thenAnswer((_) => Future.value(profileModel));

      blocTest("When Success, should emits [Success]",
          build: () =>
              EmergencyCallBloc(emergencyButtonRepository, profileRepository),
          act: (EmergencyCallBloc bloc) =>
              bloc.add(EmergencyCallSendForm(data: postData)),
          expect: () => [
                EmergencyCallLoading(),
                EmergencyCallSuccess(),
              ],
          verify: (_) {
            verifyNever(
                emergencyButtonRepository.postUserEmergencyCall(postData));
          });
    });

    group('Given User Try To Fetch List Emergency,', () {
      when(emergencyButtonRepository.getEmergencyCallList())
          .thenAnswer((_) => Future.value(<EmergencyCallModel>[]));

      blocTest("When Success, should emits [Success]",
          build: () => EmergencyCallListBloc(emergencyButtonRepository),
          act: (EmergencyCallListBloc bloc) =>
              bloc.add(EmergencyCallListFetch()),
          expect: () => [
                EmergencyCallListLoading(),
                const EmergencyCallListSuccess(data: <EmergencyCallModel>[]),
              ],
          verify: (_) {
            verify(emergencyButtonRepository.getEmergencyCallList()).called(1);
          });
    });
  });
}
