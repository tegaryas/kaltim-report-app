import 'package:injectable/injectable.dart';
import 'package:kaltim_report/modules/profile/models/environment_model.dart';
import 'package:package_info_plus/package_info_plus.dart';
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
}
