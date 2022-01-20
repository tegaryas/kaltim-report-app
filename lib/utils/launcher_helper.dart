import 'package:url_launcher/url_launcher.dart';

abstract class LauncherHelper {
  LauncherHelper._();
  static Future<bool> launchCaller(int phoneNumber) async {
    try {
      var url = "tel:${phoneNumber.toString()}";
      if (await canLaunch(url)) {
        return await launch(url);
      } else {
        return false;
      }
    } catch (e) {
      return false;
    }
  }
}
