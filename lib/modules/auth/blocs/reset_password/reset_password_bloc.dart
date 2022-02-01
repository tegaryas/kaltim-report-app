import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:kaltim_report/modules/auth/repositories/register_repository_interface.dart';

part 'reset_password_event.dart';
part 'reset_password_state.dart';

@injectable
class ResetPasswordBloc extends Bloc<ResetPasswordEvent, ResetPasswordState> {
  final RegisterRepositoryInterface registerRepository;
  ResetPasswordBloc({required this.registerRepository})
      : super(ResetPasswordInitial()) {
    on<ResetPasswordEvent>((event, emit) async {
      if (event is ResetPasswordUser) {
        try {
          emit(ResetPasswordLoading());
          await registerRepository.resetPassword(event.email);
          emit(ResetPasswordSucess(email: event.email));
        } catch (e) {
          emit(ResetPasswordFailed(errorMessage: e.toString()));
        }
      }
    });
  }
}
