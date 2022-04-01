import 'dart:convert';

import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:flutter/services.dart';
import 'package:injectable/injectable.dart';
import 'package:kaltim_report/services/connection_helper.dart';
import 'package:kaltim_report/services/remote_config_service/remote_config_service_interface.dart';
import 'package:shared_preferences/shared_preferences.dart';

@Injectable(as: RemoteConfigServiceInterface)
class RemoteConfigService implements RemoteConfigServiceInterface {
  final FirebaseRemoteConfig remoteConfig;
  final SharedPreferences sharedPreferences;
  final FirebaseCrashlytics firebaseCrashlytics;
  RemoteConfigService({
    required this.remoteConfig,
    required this.sharedPreferences,
    required this.firebaseCrashlytics,
  });

  @override
  Future<bool> getBool(String key) async {
    await validateCache();
    return remoteConfig.getBool(key);
  }

  @override
  Future<double> getDouble(String key) async {
    await validateCache();
    return remoteConfig.getDouble(key);
  }

  @override
  Future<int> getInt(String key) async {
    await validateCache();
    return remoteConfig.getInt(key);
  }

  @override
  Future<Map<String, dynamic>> getJson(String key) async {
    await validateCache();
    final String value = remoteConfig.getString(key);
    return jsonDecode(value) as Map<String, dynamic>;
  }

  @override
  Future<String> getString(String key) async {
    await validateCache();
    return remoteConfig.getString(key);
  }

  @override
  Future<void> validateCache() async {
    try {
      final bool newUpdateExist =
          sharedPreferences.getBool("CONFIG_STALE") ?? false;
      if ((remoteConfig.lastFetchStatus != RemoteConfigFetchStatus.success ||
              (DateTime.now().difference(remoteConfig.lastFetchTime).inHours >
                  remoteConfig.settings.minimumFetchInterval.inHours)) ||
          newUpdateExist) {
        await invalidateCache();

        await sharedPreferences.setBool("CONFIG_STALE", true);
      }
    } on PlatformException catch (exception, stack) {
      firebaseCrashlytics.recordError(exception, stack);
    }
  }

  @override
  Future<void> invalidateCache() async {
    try {
      final bool isOnline = await ConnectionHelper.isNetworkOnline();
      if (isOnline) {
        // Using zero duration to force fetching from remote server.
        await remoteConfig.setConfigSettings(RemoteConfigSettings(
            fetchTimeout: const Duration(seconds: 10),
            minimumFetchInterval: Duration.zero));
        await remoteConfig.fetchAndActivate();
      }
    } on PlatformException catch (exception, stack) {
      // Fetch exception.
      firebaseCrashlytics.recordError(exception, stack);
    }
  }
}
