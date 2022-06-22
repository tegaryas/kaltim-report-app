import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:kaltim_report/modules/profile/blocs/profile/profile_bloc.dart';
import 'package:kaltim_report/modules/profile/blocs/profile_edit/profile_edit_bloc.dart';
import 'package:kaltim_report/modules/profile/blocs/update_password/update_password_bloc.dart';
import 'package:kaltim_report/modules/profile/models/profile_form_model.dart';
import 'package:kaltim_report/modules/profile/models/profile_model.dart';
import 'package:kaltim_report/modules/profile/providers/profile_provider.dart';
import 'package:kaltim_report/modules/profile/repositories/profile_repository.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'profile_test.mocks.dart';

@GenerateMocks([
  ProfileRepository,
  ProfileProvider,
])
void main() {
  final MockProfileProvider profileProvider = MockProfileProvider();
  final ProfileRepository profileRepository =
      ProfileRepository(profileProvider: profileProvider);

  group('Test Profile Bloc', () {
    group('Given User Try To Fetch Profile Data,', () {
      const ProfileModel profileModel = ProfileModel(
        name: "tegar",
        email: "email@gmail.com",
        username: "cek cek",
        password: 'coba coba',
        role: UserRole.user,
      );

      when(profileRepository.getCurrentUserData())
          .thenAnswer((_) => Stream.fromIterable([profileModel]));

      blocTest("When Success, should emits [Success]",
          build: () => ProfileBloc(profileRepository: profileRepository),
          act: (ProfileBloc bloc) => bloc.add((ProfileFetching())),
          expect: () => [
                ProfileLoading(),
                const ProfileLoaded(profile: profileModel),
              ],
          verify: (_) {
            verify(profileRepository.getCurrentUserData()).called(1);
          });
    });

    group('Given User Try To Update Profile Data,', () {
      const ProfileFormModel profileModel = ProfileFormModel();

      when(profileRepository.updateProfileData(profileModel))
          .thenAnswer((_) => Future.value());

      blocTest("When Success, should emits [Success]",
          build: () => ProfileEditBloc(profileRepository: profileRepository),
          act: (ProfileEditBloc bloc) =>
              bloc.add((const ProfileUpdateFormData(data: profileModel))),
          expect: () => [
                ProfileEditLoading(),
                const ProfileEditLoaded(data: profileModel),
              ],
          verify: (_) {
            verify(profileRepository.updateProfileData(profileModel)).called(1);
          });
    });

    group('Given User Try To Update New Password,', () {
      const String newPassword = 'baru';

      when(profileRepository.updateUserPassword(newPassword))
          .thenAnswer((_) => Future.value());

      blocTest("When Success, should emits [Success]",
          build: () => UpdatePasswordBloc(profileRepository: profileRepository),
          act: (UpdatePasswordBloc bloc) =>
              bloc.add((const UpdatePasswordUser(newPassword))),
          expect: () => [
                UpdatePasswordLoading(),
                UpdatePasswordSuccess(),
              ],
          verify: (_) {
            verify(profileRepository.updateUserPassword(newPassword)).called(1);
          });
    });
  });
}
