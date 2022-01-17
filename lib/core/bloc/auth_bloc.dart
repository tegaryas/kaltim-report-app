import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:kaltim_report/core/repositories/auth_repositories_interface.dart';

part 'auth_event.dart';
part 'auth_state.dart';

@singleton
class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthRepositoryInterface authRepository;
  AuthBloc({required this.authRepository}) : super(AuthUninitalized()) {
    on<AuthEvent>((event, emit) async {
      if (event is AuthStarted) {
        try {
          bool isLoggedIn = authRepository.isLoggedIn();
          if (isLoggedIn) {
            emit(AuthAuthenticated());
          } else {
            emit(AuthUnauthenticated());
          }
        } catch (e, s) {
          emit(AuthFailure(e, s));
        }
      }
      if (event is AuthLogout) {
        try {
          await authRepository.logOut();
          emit(AuthUnauthenticated());
        } catch (e) {
          emit(AuthUnauthenticated());
        }
      }
    });
  }
}
