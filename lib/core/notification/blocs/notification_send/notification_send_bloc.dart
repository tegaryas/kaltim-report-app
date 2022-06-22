import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:kaltim_report/core/auth/repositories/auth_repository_interface.dart';
import 'package:kaltim_report/core/notification/providers/notification_provider_interface.dart';

part 'notification_send_event.dart';
part 'notification_send_state.dart';

@injectable
class NotificationSendBloc
    extends Bloc<NotificationSendEvent, NotificationSendState> {
  final OneSignalNotificationProviderInterface oneSignalNotificationProvider;
  final AuthRepositoryInterface authRepository;
  NotificationSendBloc(this.oneSignalNotificationProvider, this.authRepository)
      : super(NotificationSendInitial()) {
    on<NotificationSendStarted>(
      (event, emit) async {
        try {
          emit(NotificationSendLoading());
          final playersIds = await authRepository.getAllUserDeviceToken();

          await oneSignalNotificationProvider.postNotification(
            playersIds,
            "Salah satu warga Desa Singa Gembara membutuhkan bantuanmu. Segera tolong!",
            "Panggilan Darurat",
          );
          emit(NotificationSendSuccess());
        } catch (e, s) {
          emit(NotificationSendFailed(e, s));
        }
      },
    );
  }
}
