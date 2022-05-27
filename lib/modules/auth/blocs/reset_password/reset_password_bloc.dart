import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:injectable/injectable.dart';
import 'package:kaltim_report/modules/auth/repositories/repositories.dart';

part 'reset_password_event.dart';
part 'reset_password_state.dart';

@injectable
class ResetPasswordBloc extends Bloc<ResetPasswordEvent, ResetPasswordState> {
  final RegisterRepositoryInterface registerRepository;
  final FirebaseCrashlytics firebaseCrashlytics;

  String? errorMessage;
  ResetPasswordBloc({
    required this.registerRepository,
    required this.firebaseCrashlytics,
  }) : super(ResetPasswordInitial()) {
    on<ResetPasswordUser>((event, emit) async {
      try {
        emit(ResetPasswordLoading());
        await registerRepository.resetPassword(event.email);
        emit(ResetPasswordSucess(email: event.email));
      } on FirebaseAuthException catch (e, s) {
        switch (e.code) {
          case "user-not-found":
            errorMessage = "Nampaknya email kamu belum didaftarkan";
            break;
          case "invalid-email":
            errorMessage = "Email kamu tidak valid nih";
            break;
          default:
            errorMessage = "An undefined Error happened.";
        }
        firebaseCrashlytics.recordError(e, s);
        emit(ResetPasswordFailed(errorMessage: errorMessage!));
      }
    });
  }
}
