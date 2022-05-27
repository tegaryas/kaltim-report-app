import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:injectable/injectable.dart';
import 'package:kaltim_report/core/repositories/auth_repository_interface.dart';
import 'package:kaltim_report/modules/profile/models/profile_model.dart';

part 'auth_event.dart';
part 'auth_state.dart';

@injectable
class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthRepositoryInterface authRepository;
  final FirebaseCrashlytics firebaseCrashlytics;
  AuthBloc({required this.authRepository, required this.firebaseCrashlytics})
      : super(AuthUninitalized()) {
    on<AuthStarted>((event, emit) async {
      try {
        bool isLoggedIn = authRepository.isLoggedIn();
        if (isLoggedIn) {
          final res = await authRepository.getUserCurrentData();
          if (res.role == UserRole.admin) {
            emit(AuthAuthenticatedAsAdmin());
          } else {
            emit(AuthAuthenticated());
          }
        } else {
          emit(AuthUnauthenticated());
        }
      } catch (e, s) {
        firebaseCrashlytics.recordError(e, s);
        emit(AuthFailure(e, s));
      }
    });

    on<AuthLogout>((event, emit) async {
      emit(AuthUnauthenticated());
      await authRepository.logOut();
    });
  }
}
