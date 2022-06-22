import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:injectable/injectable.dart';
import 'package:kaltim_report/core/auth/repositories/auth_repository_interface.dart';
import 'package:kaltim_report/modules/auth/models/register_model.dart';
import 'package:kaltim_report/modules/auth/repositories/register_repository_interface.dart';

part 'register_event.dart';
part 'register_state.dart';

@injectable
class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  final RegisterRepositoryInterface registerRepository;
  final AuthRepositoryInterface authRepository;
  String? errorMessage;
  RegisterBloc({
    required this.registerRepository,
    required this.authRepository,
  }) : super(RegisterInitial()) {
    on<RegisterStarted>((event, emit) async {
      try {
        emit(RegisterLoading());
        final isEmailExsist =
            await registerRepository.checkEmailExsist(event.email);

        if (isEmailExsist.isNotEmpty) {
          emit(RegisterAlreadyRegistered(email: event.email));
        } else {
          emit(RegisterUser(email: event.email));
        }
      } on FirebaseAuthException catch (e) {
        switch (e.code) {
          case "weak-password":
            errorMessage = "Password yang anda masukkan masih lemah";
            break;
          case "email-already-in-use":
            errorMessage = "Emali telah di pakai";
            break;
          case "invalid-email":
            errorMessage = "Email kamu tidak valid nih";
            break;
          default:
            errorMessage = e.message;
        }

        emit(RegisterFailed(error: errorMessage!));
      }
    });

    on<RegisterCompleteData>((event, emit) async {
      try {
        emit(RegisterLoading());
        final isEmailExsist =
            await registerRepository.checkEmailExsist(event.data.email);

        if (isEmailExsist.isEmpty) {
          await registerRepository
              .registerWithEmailAndPassword(
                  event.data.email, event.data.password!)
              .then((value) async {
            var userId = authRepository.loggedUser.uid;
            await registerRepository.registerUserData(RegisterModel(
              name: event.data.username,
              email: event.data.email,
              username: event.data.username,
              password: event.data.password,
              idToken: userId,
              phoneNumber: event.data.phoneNumber,
            ));
          });

          emit(RegisterSuccess());
        }
      } on FirebaseAuthException catch (e) {
        switch (e.code) {
          case "weak-password":
            errorMessage = "Password yang anda masukkan masih lemah";
            break;
          case "email-already-in-use":
            errorMessage = "Akun kamu dinonaktifkan sementara";
            break;
          case "invalid-email":
            errorMessage = "Email kamu tidak valid nih";
            break;
          default:
            errorMessage = e.message;
        }

        emit(RegisterFailed(error: errorMessage!));
      }
    });
  }
}
