import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:injectable/injectable.dart';
import 'package:kaltim_report/core/auth/repositories/auth_repository_interface.dart';
import 'package:kaltim_report/core/notification/providers/notification_provider_interface.dart';
import 'package:kaltim_report/modules/auth/models/register_model.dart';
import 'package:kaltim_report/modules/auth/repositories/login_repository_interface.dart';
import 'package:kaltim_report/modules/auth/repositories/register_repository_interface.dart';
import 'package:kaltim_report/modules/profile/models/profile_form_model.dart';
import 'package:kaltim_report/modules/profile/repositories/profile_repository_interface.dart';

part 'login_event.dart';
part 'login_state.dart';

@injectable
class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final LoginRepositoryInterface loginRepository;
  final AuthRepositoryInterface authRepository;
  final RegisterRepositoryInterface registerRepository;
  final OneSignalNotificationProviderInterface notificationProvider;
  final ProfileRepositoryInterface profileRepository;

  String? errorMessage;
  LoginBloc({
    required this.loginRepository,
    required this.authRepository,
    required this.registerRepository,
    required this.notificationProvider,
    required this.profileRepository,
  }) : super(LoginInitial()) {
    on<LoginStart>((event, emit) async {
      try {
        emit(LoginLoading());
        await loginRepository.logInWithEmailAndPassword(
            event.email, event.password);
        bool isSignedIn = authRepository.isLoggedIn();
        if (isSignedIn) {
          final deviceToken = await notificationProvider.getOneSignalId();

          await profileRepository
              .updateProfileData(ProfileFormModel(deviceToken: deviceToken));

          emit(LoginSuccess());
        } else {
          emit(const LoginFailed(error: "Harap login beberapa saat lagi"));
        }
      } on FirebaseAuthException catch (e) {
        switch (e.code) {
          case "wrong-password":
            errorMessage = "Password yang anda masukkan salah";
            break;
          case "user-disabled":
            errorMessage = "Akun kamu dinonaktifkan sementara";
            break;
          case "user-not-found":
            errorMessage = "Nampaknya email kamu belum didaftarkan";
            break;
          case "invalid-email":
            errorMessage = "Email kamu tidak valid nih";
            break;
          default:
            errorMessage = e.message;
        }

        emit(LoginFailed(error: errorMessage!));
      }
    });

    on<LoginStartWithGoogle>((event, emit) async {
      try {
        emit(LoginLoading());
        await loginRepository.logInWithGoogle();
        bool isSignedIn = authRepository.isLoggedIn();
        if (isSignedIn) {
          var currentUser = authRepository.loggedUser;

          final bool isRegister =
              await loginRepository.isUserRegister(currentUser.email!);

          if (!isRegister) {
            await registerRepository.registerUserData(RegisterModel(
              name: currentUser.displayName!,
              email: currentUser.email!,
              username: currentUser.displayName!,
              idToken: currentUser.uid,
              phoneNumber: currentUser.phoneNumber,
              profilePic: currentUser.photoURL,
            ));
          }

          final deviceToken = await notificationProvider.getOneSignalId();

          await profileRepository
              .updateProfileData(ProfileFormModel(deviceToken: deviceToken));

          emit(LoginSuccess());
        }
      } on FirebaseAuthException catch (e) {
        switch (e.code) {
          case "wrong-password":
            errorMessage = "Password yang anda masukkan salah";
            break;
          case "user-disabled":
            errorMessage = "Akun kamu dinonaktifkan sementara";
            break;
          case "user-not-found":
            errorMessage = "Nampaknya email kamu belum didaftarkan";
            break;
          case "invalid-email":
            errorMessage = "Email kamu tidak valid nih";
            break;
          default:
            errorMessage = e.message;
        }

        emit(LoginFailed(error: errorMessage!));
      } catch (e) {
        emit(LoginAborted());
      }
    });
  }
}
