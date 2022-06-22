abstract class OneSignalNotificationProviderInterface {
  Future<void> initNotificationService();

  Future<String?> getOneSignalId();

  Future<void> postNotification(
      List<String> playersIds, String content, String heading);
}
