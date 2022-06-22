import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:kaltim_report/core/notification/models/notification_navigation_model.dart';
import 'package:kaltim_report/core/notification/models/notification_payload_model.dart';
import 'package:kaltim_report/core/notification/providers/notification_provider_interface.dart';

part 'notification_event.dart';
part 'notification_state.dart';

@injectable
class NotificationBloc extends Bloc<NotificationEvent, NotificationState> {
  final OneSignalNotificationProviderInterface
      oneSignalNotificationProviderInterface;
  NotificationBloc(this.oneSignalNotificationProviderInterface)
      : super(NotificationInitial()) {
    on<NotificationStarted>((event, emit) async {
      try {
        await oneSignalNotificationProviderInterface.initNotificationService();
        emit(NotificationStartSuccess());
      } catch (e, s) {
        emit(NotificationStartFailure(e, s));
      }
    });

    on<NotificationOpened>((event, emit) async {
      try {
        final payload = event.model;
        if (payload.actionType == ActionType.url) {
          emit(NotificationOpenUrl(payload.params));
        } else if (payload.actionType == ActionType.screen) {
          final paramDecoded =
              NotificationNavigationModel.fromString(payload.params);
          emit(NotificationOpenScreen(paramDecoded));
        }
      } catch (e, s) {
        emit(NotificationFailure(e, s));
      }
    });
  }
}
