import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:kaltim_report/core/repositories/auth_repositories_interface.dart';
import 'package:kaltim_report/modules/auth/repositories/login_repository_interface.dart';

part 'login_event.dart';
part 'login_state.dart';

@injectable
class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final LoginRepositoryInterface loginRepository;
  final AuthRepositoryInterface authRepository;
  LoginBloc({required this.loginRepository, required this.authRepository})
      : super(LoginInitial()) {
    on<LoginEvent>((event, emit) async {
      if (event is LoginStart) {
        try {
          emit(LoginLoading());
          await loginRepository.logInWithEmailAndPassword(
              event.email, event.password);
          bool isSignedIn = authRepository.isLoggedIn();
          if (isSignedIn) {
            emit(LoginSuccess());
          } else {
            emit(const LoginFailed(error: "Error"));
          }
        } catch (e) {
          emit(LoginFailed(error: e));
        }
      }
      if (event is LoginStartWithGoogle) {
        try {
          emit(LoginLoading());
          await loginRepository.logInWithGoogle();
          bool isSignedIn = authRepository.isLoggedIn();
          if (isSignedIn) {
            emit(LoginSuccess());
          } else {
            emit(const LoginFailed(error: "Error"));
          }
        } catch (e) {
          emit(LoginFailed(error: e));
        }
      }
    });
  }
}
