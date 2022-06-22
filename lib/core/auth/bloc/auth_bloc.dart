import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import 'package:injectable/injectable.dart';
import 'package:kaltim_report/core/auth/repositories/auth_repository_interface.dart';
import 'package:kaltim_report/modules/profile/models/profile_model.dart';

part 'auth_event.dart';
part 'auth_state.dart';

@injectable
class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthRepositoryInterface authRepository;

  AuthBloc({required this.authRepository}) : super(AuthUninitalized()) {
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
        emit(AuthFailure(e, s));
      }
    });

    on<AuthLogout>((event, emit) async {
      emit(AuthUnauthenticated());
      await authRepository.deleteDeviceToken();
      await authRepository.logOut();
    });
  }
}
