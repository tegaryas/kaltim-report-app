import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:url_launcher/url_launcher.dart';

abstract class LauncherHelper {
  LauncherHelper._();
  static Future<bool> launchCaller(String phoneNumber) async {
    try {
      var url = "tel:$phoneNumber";
      if (await canLaunchUrl(Uri.parse(url))) {
        return await launchUrl(Uri.parse(url));
      } else {
        return false;
      }
    } catch (e) {
      return false;
    }
  }

  static Future<bool> openUrl(String url) async {
    try {
      if (await canLaunchUrl(Uri.parse(url))) {
        return launchUrl(Uri.parse(url));
      } else {
        return false;
      }
    } catch (e) {
      return false;
    }
  }

  static Future<bool> launchMaps(GeoPoint latLang) async {
    String appleUrl =
        'https://maps.apple.com/?saddr=&daddr=${latLang.latitude},${latLang.longitude}&directionsmode=driving';
    String googleUrl =
        "google.navigation:q=${latLang.latitude},${latLang.longitude}&mode=d";

    if (Platform.isIOS) {
      if (await canLaunchUrl(Uri.parse(appleUrl))) {
        return launchUrl(Uri.parse(appleUrl));
      } else {
        if (await canLaunchUrl(Uri.parse(googleUrl))) {
          return launchUrl(Uri.parse(googleUrl));
        } else {
          return false;
        }
      }
    } else {
      if (await canLaunchUrl(Uri.parse(googleUrl))) {
        return launchUrl(Uri.parse(googleUrl));
      } else {
        return false;
      }
    }
  }

  static Future<bool> openEmailDraft(String email, {String? subject}) async {
    try {
      if (await canLaunchUrl(Uri.parse("mailto:$email"))) {
        final Uri emailLaunchUri = Uri(
          scheme: 'mailto',
          path: email,
          query: {'subject': subject ?? 'New Title Here'}
              .entries
              .map((e) =>
                  '${Uri.encodeComponent(e.key)}=${Uri.encodeComponent(e.value)}')
              .join('&'),
        );

        return launchUrl(Uri.parse(emailLaunchUri.toString()));
      } else {
        return false;
      }
    } catch (e) {
      return false;
    }
  }
}
