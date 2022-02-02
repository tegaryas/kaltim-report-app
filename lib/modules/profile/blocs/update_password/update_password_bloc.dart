import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:injectable/injectable.dart';
import 'package:kaltim_report/modules/profile/repositories/profile_repository_interface.dart';

part 'update_password_event.dart';
part 'update_password_state.dart';

@injectable
class UpdatePasswordBloc
    extends Bloc<UpdatePasswordEvent, UpdatePasswordState> {
  final ProfileRepositoryInterface profileRepository;

  late String? errorMessage;

  UpdatePasswordBloc({required this.profileRepository})
      : super(UpdatePasswordInitial()) {
    on<UpdatePasswordEvent>((event, emit) async {
      if (event is UpdatePasswordUser) {
        try {
          emit(UpdatePasswordLoading());

          await profileRepository.updateUserPassword(event.newPassword);
          emit(UpdatePasswordSuccess());
        } on FirebaseAuthException catch (e) {
          switch (e.code) {
            case "weak-password":
              errorMessage = "Password yang Anda Masukkan Masih Lemah";
              break;
            default:
              errorMessage = "An undefined Error happened.";
          }
          emit(UpdatePasswordFailed(e: errorMessage!));
        }
      }
    });
  }
}
