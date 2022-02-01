import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:injectable/injectable.dart';
import 'package:kaltim_report/modules/auth/repositories/register_repository_interface.dart';

part 'reset_password_event.dart';
part 'reset_password_state.dart';

@injectable
class ResetPasswordBloc extends Bloc<ResetPasswordEvent, ResetPasswordState> {
  final RegisterRepositoryInterface registerRepository;

  String? errorMessage;
  ResetPasswordBloc({required this.registerRepository})
      : super(ResetPasswordInitial()) {
    on<ResetPasswordEvent>((event, emit) async {
      if (event is ResetPasswordUser) {
        try {
          emit(ResetPasswordLoading());
          await registerRepository.resetPassword(event.email);
          emit(ResetPasswordSucess(email: event.email));
        } on FirebaseAuthException catch (e) {
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
          emit(ResetPasswordFailed(errorMessage: errorMessage!));
        }
      }
    });
  }
}
