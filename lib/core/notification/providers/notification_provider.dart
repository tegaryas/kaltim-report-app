import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';
import 'package:kaltim_report/configs/injectable/injectable_core.dart';
import 'package:kaltim_report/core/notification/blocs/notification/notification_bloc.dart';
import 'package:kaltim_report/core/notification/models/notification_payload_model.dart';
import 'package:kaltim_report/core/notification/providers/notification_provider_interface.dart';
import 'package:onesignal_flutter/onesignal_flutter.dart';

final NotificationBloc notificationBloc = getIt.get<NotificationBloc>();

Future<void> _processOpenedNotification(
    OSNotificationOpenedResult result) async {
  if (result.notification.additionalData == null) return;

  try {
    final NotificationPayloadModel notifModel =
        NotificationPayloadModel.fromJson(result.notification.additionalData!);

    await _processNotificationPayload(notifModel);
  } catch (e, s) {
    FirebaseCrashlytics.instance.recordError(e, s);
  }
}

Future<dynamic> _processNotificationPayload(
    NotificationPayloadModel payload) async {
  notificationBloc.add(NotificationOpened(payload));
}

@Injectable(as: OneSignalNotificationProviderInterface)
class OneSignalNotificationProvider
    implements OneSignalNotificationProviderInterface {
  @override
  Future<String?> getOneSignalId() async {
    var deviceState = await OneSignal.shared.getDeviceState();

    if (deviceState == null || deviceState.userId == null) return null;
    var playerId = deviceState.userId;

    return playerId;
  }

  @override
  Future<void> initNotificationService() async {
    if (kDebugMode) {
      OneSignal.shared.setLogLevel(OSLogLevel.verbose, OSLogLevel.none);
    }

    OneSignal.shared.setAppId("89ba6795-f217-4b8f-b509-3f5c83f62ed4");

    OneSignal.shared.promptUserForPushNotificationPermission();

    OneSignal.shared.requiresUserPrivacyConsent();

    OneSignal.shared.setLaunchURLsInApp(true);

    OneSignal.shared.setNotificationOpenedHandler(_processOpenedNotification);
  }

  @override
  Future<void> postNotification(
      List<String> playersIds, String content, String heading) async {
    var notification = OSCreateNotification(
        playerIds: playersIds.toSet().toList(),
        content: content,
        heading: heading,
        additionalData: {
          "action_type": "url",
          "params": "{\"screen_path\":\"/emergency-call/list-user\"}"
        });

    await OneSignal.shared.postNotification(notification);
  }
}
