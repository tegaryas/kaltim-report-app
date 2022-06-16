import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:injectable/injectable.dart';
import 'package:kaltim_report/core/repositories/auth_repository_interface.dart';
import 'package:kaltim_report/modules/auth/models/register_model.dart';
import 'package:kaltim_report/modules/auth/repositories/login_repository_interface.dart';
import 'package:kaltim_report/modules/auth/repositories/register_repository_interface.dart';

part 'login_event.dart';
part 'login_state.dart';

@injectable
class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final LoginRepositoryInterface loginRepository;
  final AuthRepositoryInterface authRepository;
  final RegisterRepositoryInterface registerRepository;
  final FirebaseCrashlytics firebaseCrashlytics;

  String? errorMessage;
  LoginBloc({
    required this.loginRepository,
    required this.authRepository,
    required this.registerRepository,
    required this.firebaseCrashlytics,
  }) : super(LoginInitial()) {
    on<LoginStart>((event, emit) async {
      try {
        emit(LoginLoading());
        await loginRepository.logInWithEmailAndPassword(
            event.email, event.password);
        bool isSignedIn = authRepository.isLoggedIn();
        if (isSignedIn) {
          emit(LoginSuccess());
        } else {
          emit(const LoginFailed(error: "Harap login beberapa saat lagi"));
        }
      } on FirebaseAuthException catch (e, s) {
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

        firebaseCrashlytics.recordError(e, s);

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
              password: currentUser.uid,
              idToken: currentUser.uid,
              phoneNumber: currentUser.phoneNumber,
              profilePic: currentUser.photoURL,
            ));
          }

          emit(LoginSuccess());
        }
      } on FirebaseAuthException catch (e, s) {
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
        firebaseCrashlytics.recordError(e, s);

        emit(LoginFailed(error: errorMessage!));
      } catch (e) {
        emit(LoginAborted());
      }
    });
  }
}
