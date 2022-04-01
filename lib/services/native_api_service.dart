import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:injectable/injectable.dart';
import 'package:kaltim_report/modules/profile/models/environment_model.dart';
import 'package:kaltim_report/services/remote_config_service/remote_config_default.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:universal_platform/universal_platform.dart';

@module
abstract class NativeApiService {
  @preResolve
  @lazySingleton
  Future<EnvironmentModel> getPlatformInfo() async {
    final PackageInfo packageInfo = await PackageInfo.fromPlatform();

    if (UniversalPlatform.isAndroid) {
      return EnvironmentModel(
          appBuildNumber: packageInfo.buildNumber,
          appVersion: packageInfo.version,
          packageName: packageInfo.packageName,
          osType: EnvOsType.android,
          appVersionOld: packageInfo.version,
          osTypeOld: EnvOsType.android);
    } else if (UniversalPlatform.isIOS) {
      return EnvironmentModel(
          appBuildNumber: packageInfo.buildNumber,
          appVersion: packageInfo.version,
          packageName: packageInfo.packageName,
          osType: EnvOsType.ios,
          appVersionOld: packageInfo.version,
          osTypeOld: EnvOsType.ios);
    } else if (UniversalPlatform.isWeb) {
      return EnvironmentModel(
          appBuildNumber: packageInfo.buildNumber,
          appVersion: packageInfo.version,
          packageName: packageInfo.packageName,
          osType: EnvOsType.web,
          appVersionOld: packageInfo.version,
          osTypeOld: EnvOsType.web);
    } else {
      throw "Error";
    }
  }

  @singleton
  FirebaseAuth get firebaseAuth => FirebaseAuth.instance;

  @injectable
  GoogleSignIn get googleSignIn => GoogleSignIn();

  @singleton
  FirebaseFirestore get firebaseFirestore => FirebaseFirestore.instance;

  @lazySingleton
  FirebaseStorage get firebaseStorage => FirebaseStorage.instance;

  @singleton
  FirebaseCrashlytics get firebaseCrashlytics => FirebaseCrashlytics.instance;

  @singleton
  FirebaseMessaging get firebaseMessaging => FirebaseMessaging.instance;

  @injectable
  Dio get dio => Dio();

  @preResolve
  @lazySingleton
  Future<FirebaseRemoteConfig> get remoteConfig async {
    final remoteConfig = FirebaseRemoteConfig.instance;

    await remoteConfig.setConfigSettings(
      RemoteConfigSettings(
        fetchTimeout: const Duration(seconds: 15),
        minimumFetchInterval: const Duration(hours: 12),
      ),
    );

    await remoteConfig.setDefaults(remoteConfigDefaultValue);

    await remoteConfig.ensureInitialized();
    return remoteConfig;
  }

  @preResolve
  @lazySingleton
  Future<SharedPreferences> get prefs => SharedPreferences.getInstance();
}
