import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:kaltim_report/core/auth/providers/auth_provider.dart';
import 'package:kaltim_report/core/auth/repositories/auth_repository.dart';
import 'package:kaltim_report/core/notification/providers/notification_provider.dart';
import 'package:kaltim_report/modules/auth/blocs/login/login_bloc.dart';
import 'package:kaltim_report/modules/auth/blocs/register/register_bloc.dart';
import 'package:kaltim_report/modules/auth/providers/login_provider.dart';
import 'package:kaltim_report/modules/auth/providers/register_provider.dart';
import 'package:kaltim_report/modules/auth/repositories/login_repository.dart';
import 'package:kaltim_report/modules/auth/repositories/register_repository.dart';
import 'package:kaltim_report/modules/profile/models/profile_form_model.dart';
import 'package:kaltim_report/modules/profile/providers/profile_provider.dart';
import 'package:kaltim_report/modules/profile/repositories/profile_repository.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'report_test.mocks.dart';

@GenerateMocks([
  LoginProvider,
  LoginRepository,
  AuthRepository,
  AuthProvider,
  RegisterRepository,
  RegisterProvider,
  ProfileRepository,
  ProfileProvider,
  OneSignalNotificationProvider,
])
void main() {
  final MockLoginProvider loginProvider = MockLoginProvider();
  final LoginRepository loginRepository = LoginRepository(loginProvider);

  final MockRegisterProvider registerProvider = MockRegisterProvider();
  final RegisterRepository registerRepository =
      RegisterRepository(registerProvider);

  final MockAuthProvider authProvider = MockAuthProvider();
  final AuthRepository authRepository = AuthRepository(authProvider);

  final MockProfileProvider profileProvider = MockProfileProvider();
  final ProfileRepository profileRepository =
      ProfileRepository(profileProvider: profileProvider);

  final MockOneSignalNotificationProvider notificationProvider =
      MockOneSignalNotificationProvider();

  group('Test Report Bloc', () {
    group('Given User Try To Add Report,', () {
      when(registerRepository.checkEmailExsist("tegar.yas26@gmail.com"))
          .thenAnswer((_) => Future.value(<String>[]));

      blocTest("When Success, should emits [Success]",
          build: () => RegisterBloc(
              authRepository: authRepository,
              registerRepository: registerRepository),
          act: (RegisterBloc bloc) =>
              bloc.add(const RegisterStarted(email: 'tegar.yas26@gmail.com')),
          expect: () => [
                RegisterLoading(),
                const RegisterUser(email: "tegar.yas26@gmail.com")
              ],
          verify: (_) {
            verify(registerRepository.checkEmailExsist('tegar.yas26@gmail.com'))
                .called(1);
          });
    });

    group('Given User Try To See Detail Report,', () {
      when(loginRepository.logInWithEmailAndPassword(
              "tegar.yas26@gmail.com", "Test123"))
          .thenAnswer((_) => Future.value());

      when(authRepository.isLoggedIn()).thenAnswer((_) => true);

      when(notificationProvider.getOneSignalId())
          .thenAnswer((_) => Future.value());

      when(profileRepository
              .updateProfileData(const ProfileFormModel(deviceToken: "")))
          .thenAnswer((_) => Future.value());

      blocTest("When Success, should emits [Success]",
          build: () => LoginBloc(
                authRepository: authRepository,
                registerRepository: registerRepository,
                loginRepository: loginRepository,
                profileRepository: profileRepository,
                notificationProvider: notificationProvider,
              ),
          act: (LoginBloc bloc) => bloc.add(const LoginStart(
              email: 'tegar.yas26@gmail.com', password: 'Test123')),
          expect: () => [
                LoginLoading(),
                LoginSuccess(),
              ],
          verify: (_) {
            verify(loginRepository.logInWithEmailAndPassword(
                    "tegar.yas26@gmail.com", "Test123"))
                .called(1);
          });
    });

    // group('Given User Try To ,', () {
    //   when(registerRepository.resetPassword("tegar.yas26@gmail.com"))
    //       .thenAnswer((_) => Future.value());

    //   blocTest("When Success, should emits [Success]",
    //       build: () => ResetPasswordBloc(
    //             registerRepository: registerRepository,
    //           ),
    //       act: (ResetPasswordBloc bloc) =>
    //           bloc.add(const ResetPasswordUser(email: 'tegar.yas26@gmail.com')),
    //       expect: () => [
    //             ResetPasswordLoading(),
    //             const ResetPasswordSucess(email: 'tegar.yas26@gmail.com'),
    //           ],
    //       verify: (_) {
    //         verify(registerRepository.resetPassword("tegar.yas26@gmail.com"))
    //             .called(1);
    //       });
    // });
  });
}
