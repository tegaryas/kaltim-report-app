// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:cloud_firestore/cloud_firestore.dart' as _i7;
import 'package:dio/dio.dart' as _i3;
import 'package:firebase_auth/firebase_auth.dart' as _i5;
import 'package:firebase_crashlytics/firebase_crashlytics.dart' as _i6;
import 'package:firebase_messaging/firebase_messaging.dart' as _i8;
import 'package:firebase_remote_config/firebase_remote_config.dart' as _i9;
import 'package:firebase_storage/firebase_storage.dart' as _i10;
import 'package:get_it/get_it.dart' as _i1;
import 'package:google_sign_in/google_sign_in.dart' as _i17;
import 'package:injectable/injectable.dart' as _i2;
import 'package:shared_preferences/shared_preferences.dart' as _i33;

import '../../core/auth/bloc/auth_bloc.dart' as _i73;
import '../../core/auth/providers/auth_provider.dart' as _i35;
import '../../core/auth/providers/auth_provider_interface.dart' as _i34;
import '../../core/auth/repositories/auth_repository.dart' as _i37;
import '../../core/auth/repositories/auth_repository_interface.dart' as _i36;
import '../../core/notification/blocs/notification/notification_bloc.dart'
    as _i56;
import '../../core/notification/blocs/notification_send/notification_send_bloc.dart'
    as _i57;
import '../../core/notification/providers/notification_provider.dart' as _i27;
import '../../core/notification/providers/notification_provider_interface.dart'
    as _i26;
import '../../modules/auth/blocs/login/login_bloc.dart' as _i85;
import '../../modules/auth/blocs/register/register_bloc.dart' as _i62;
import '../../modules/auth/blocs/reset_password/reset_password_bloc.dart'
    as _i32;
import '../../modules/auth/providers/login_provider.dart' as _i19;
import '../../modules/auth/providers/login_provider_interface.dart' as _i18;
import '../../modules/auth/providers/register_provider.dart' as _i29;
import '../../modules/auth/providers/register_provider_interface.dart' as _i28;
import '../../modules/auth/repositories/login_repository.dart' as _i21;
import '../../modules/auth/repositories/login_repository_interface.dart'
    as _i20;
import '../../modules/auth/repositories/register_repository.dart' as _i31;
import '../../modules/auth/repositories/register_repository_interface.dart'
    as _i30;
import '../../modules/call/blocs/calls/call_bloc.dart' as _i74;
import '../../modules/call/providers/call_provider.dart' as _i39;
import '../../modules/call/providers/call_provider_interface.dart' as _i38;
import '../../modules/call/repositories/call_repository.dart' as _i41;
import '../../modules/call/repositories/call_repository_interface.dart' as _i40;
import '../../modules/covid/blocs/hospital_province/hospital_province_bloc.dart'
    as _i55;
import '../../modules/covid/blocs/vaccination/vaccination_bloc.dart' as _i72;
import '../../modules/covid/providers/covid_provider.dart' as _i43;
import '../../modules/covid/providers/covid_provider_interface.dart' as _i42;
import '../../modules/covid/repositories/covid_repository.dart' as _i45;
import '../../modules/covid/repositories/covid_repository_interface.dart'
    as _i44;
import '../../modules/emergency_button/blocs/emergency_call/emergency_call_bloc.dart'
    as _i75;
import '../../modules/emergency_button/blocs/emergency_call_list/emergency_call_list_bloc.dart'
    as _i76;
import '../../modules/emergency_button/blocs/emergency_call_stream/emergency_call_stream_bloc.dart'
    as _i50;
import '../../modules/emergency_button/blocs/emergency_validate_phone_number/emergency_validate_phone_number_bloc.dart'
    as _i77;
import '../../modules/emergency_button/providers/emergency_call_provider.dart'
    as _i47;
import '../../modules/emergency_button/providers/emergency_call_provider_interface.dart'
    as _i46;
import '../../modules/emergency_button/repositories/emergency_call_repository.dart'
    as _i49;
import '../../modules/emergency_button/repositories/emergency_call_repository_interface.dart'
    as _i48;
import '../../modules/gempa_bumi/blocs/gempa_bumi_bloc/gempa_bumi_bloc.dart'
    as _i51;
import '../../modules/gempa_bumi/blocs/gempa_bumi_last_recently_bloc/gempa_bumi_last_recently_bloc.dart'
    as _i52;
import '../../modules/gempa_bumi/blocs/gempa_bumi_magnetudo_bloc/gempa_bumi_magnetudo_bloc.dart'
    as _i53;
import '../../modules/gempa_bumi/providers/gempa_bumi_provider.dart' as _i12;
import '../../modules/gempa_bumi/providers/gempa_bumi_provider_interface.dart'
    as _i11;
import '../../modules/gempa_bumi/repositories/gempa_bumi_repository.dart'
    as _i14;
import '../../modules/gempa_bumi/repositories/gempa_bumi_repository_interface.dart'
    as _i13;
import '../../modules/home/blocs/banner/banner_bloc.dart' as _i97;
import '../../modules/home/blocs/feature/feature_bloc.dart' as _i98;
import '../../modules/home/blocs/home_covid/home_covid_bloc.dart' as _i99;
import '../../modules/home/blocs/home_report/home_report_bloc.dart' as _i80;
import '../../modules/home/blocs/home_statistic_chart/home_statistic_chart_bloc.dart'
    as _i83;
import '../../modules/home/blocs/home_statistic_data/home_statistic_data_bloc.dart'
    as _i84;
import '../../modules/home/providers/home_provider.dart' as _i79;
import '../../modules/home/providers/home_provider_interface.dart' as _i78;
import '../../modules/home/repositories/home_repository.dart' as _i82;
import '../../modules/home/repositories/home_repository_interface.dart' as _i81;
import '../../modules/news/blocs/news_list_new/news_list_new_bloc.dart' as _i86;
import '../../modules/news/providers/news_provider.dart' as _i23;
import '../../modules/news/providers/news_provider_interface.dart' as _i22;
import '../../modules/news/repositories/news_repository.dart' as _i25;
import '../../modules/news/repositories/news_repository_interface.dart' as _i24;
import '../../modules/profile/blocs/profile/profile_bloc.dart' as _i87;
import '../../modules/profile/blocs/profile_edit/profile_edit_bloc.dart'
    as _i88;
import '../../modules/profile/blocs/profile_picture_update/profile_picture_update_bloc.dart'
    as _i89;
import '../../modules/profile/blocs/update_password/update_password_bloc.dart'
    as _i71;
import '../../modules/profile/models/environment_model.dart' as _i4;
import '../../modules/profile/providers/profile_provider.dart' as _i59;
import '../../modules/profile/providers/profile_provider_interface.dart'
    as _i58;
import '../../modules/profile/repositories/profile_repository.dart' as _i61;
import '../../modules/profile/repositories/profile_repository_interface.dart'
    as _i60;
import '../../modules/report/blocs/geolocation/geolocation_bloc.dart' as _i54;
import '../../modules/report/blocs/report_bookmark/report_bookmark_bloc.dart'
    as _i90;
import '../../modules/report/blocs/report_bookmark_user/report_bookmark_user_bloc.dart'
    as _i91;
import '../../modules/report/blocs/report_category/report_category_bloc.dart'
    as _i92;
import '../../modules/report/blocs/report_detail/report_detail_bloc.dart'
    as _i93;
import '../../modules/report/blocs/report_export/report_export_bloc.dart'
    as _i94;
import '../../modules/report/blocs/report_form/report_form_bloc.dart' as _i95;
import '../../modules/report/blocs/report_list_bloc/report_list_bloc.dart'
    as _i96;
import '../../modules/report/blocs/report_update_form/report_update_form_bloc.dart'
    as _i69;
import '../../modules/report/blocs/report_user/report_user_bloc.dart' as _i70;
import '../../modules/report/providers/report_provider.dart' as _i66;
import '../../modules/report/providers/report_provider_interface.dart' as _i65;
import '../../modules/report/repositories/report_repository.dart' as _i68;
import '../../modules/report/repositories/report_repository_interface.dart'
    as _i67;
import '../../services/geolocator/geolocator_repository.dart' as _i16;
import '../../services/geolocator/geolocator_repository_interface.dart' as _i15;
import '../../services/native_api_service.dart' as _i100;
import '../../services/remote_config_service/remote_config_service.dart'
    as _i64;
import '../../services/remote_config_service/remote_config_service_interface.dart'
    as _i63; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
Future<_i1.GetIt> $initGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) async {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  final nativeApiService = _$NativeApiService();
  gh.factory<_i3.Dio>(() => nativeApiService.dio);
  await gh.lazySingletonAsync<_i4.EnvironmentModel>(
      () => nativeApiService.getPlatformInfo(),
      preResolve: true);
  gh.singleton<_i5.FirebaseAuth>(nativeApiService.firebaseAuth);
  gh.singleton<_i6.FirebaseCrashlytics>(nativeApiService.firebaseCrashlytics);
  gh.singleton<_i7.FirebaseFirestore>(nativeApiService.firebaseFirestore);
  gh.singleton<_i8.FirebaseMessaging>(nativeApiService.firebaseMessaging);
  await gh.lazySingletonAsync<_i9.FirebaseRemoteConfig>(
      () => nativeApiService.remoteConfig,
      preResolve: true);
  gh.lazySingleton<_i10.FirebaseStorage>(
      () => nativeApiService.firebaseStorage);
  gh.factory<_i11.GempaBumiProviderInterface>(
      () => _i12.GempaBumiProvider(get<_i3.Dio>()));
  gh.factory<_i13.GempaBumiRepositoryInterface>(
      () => _i14.GempaBumiRepository(get<_i11.GempaBumiProviderInterface>()));
  gh.factory<_i15.GeolocatorRepositoryInterface>(
      () => _i16.GeolocatorRepository());
  gh.factory<_i17.GoogleSignIn>(() => nativeApiService.googleSignIn);
  gh.factory<_i18.LoginProviderInterface>(() => _i19.LoginProvider(
      firebaseAuth: get<_i5.FirebaseAuth>(),
      googleSignIn: get<_i17.GoogleSignIn>(),
      firebaseFirestore: get<_i7.FirebaseFirestore>()));
  gh.factory<_i20.LoginRepositoryInterface>(
      () => _i21.LoginRepository(get<_i18.LoginProviderInterface>()));
  gh.factory<_i22.NewsProviderInterface>(
      () => _i23.NewsProvider(get<_i3.Dio>()));
  gh.factory<_i24.NewsRepositoryInterface>(
      () => _i25.NewsRepository(get<_i22.NewsProviderInterface>()));
  gh.factory<_i26.OneSignalNotificationProviderInterface>(
      () => _i27.OneSignalNotificationProvider());
  gh.factory<_i28.RegisterProviderInterface>(() => _i29.RegisterProvider(
      firebaseAuth: get<_i5.FirebaseAuth>(),
      firebaseFirestore: get<_i7.FirebaseFirestore>()));
  gh.factory<_i30.RegisterRepositoryInterface>(
      () => _i31.RegisterRepository(get<_i28.RegisterProviderInterface>()));
  gh.factory<_i32.ResetPasswordBloc>(() => _i32.ResetPasswordBloc(
      registerRepository: get<_i30.RegisterRepositoryInterface>(),
      firebaseCrashlytics: get<_i6.FirebaseCrashlytics>()));
  await gh.lazySingletonAsync<_i33.SharedPreferences>(
      () => nativeApiService.prefs,
      preResolve: true);
  gh.factory<_i34.AuthProviderInterface>(() => _i35.AuthProvider(
      get<_i5.FirebaseAuth>(),
      get<_i17.GoogleSignIn>(),
      get<_i7.FirebaseFirestore>()));
  gh.factory<_i36.AuthRepositoryInterface>(
      () => _i37.AuthRepository(get<_i34.AuthProviderInterface>()));
  gh.factory<_i38.CallProviderInterface>(
      () => _i39.CallProvider(get<_i7.FirebaseFirestore>()));
  gh.factory<_i40.CallRepositoryInterface>(() =>
      _i41.CallRepository(callProvider: get<_i38.CallProviderInterface>()));
  gh.factory<_i42.CovidProviderInterface>(
      () => _i43.CovidProvider(get<_i3.Dio>()));
  gh.factory<_i44.CovidRepositoryInterface>(
      () => _i45.CovidRepository(get<_i42.CovidProviderInterface>()));
  gh.factory<_i46.EmergencyCallProviderInterface>(() =>
      _i47.EmergencyCallProvider(
          get<_i7.FirebaseFirestore>(), get<_i36.AuthRepositoryInterface>()));
  gh.factory<_i48.EmergencyCallRepositoryInterface>(() =>
      _i49.EmergencyCallRepository(get<_i46.EmergencyCallProviderInterface>()));
  gh.factory<_i50.EmergencyCallStreamBloc>(() => _i50.EmergencyCallStreamBloc(
      get<_i48.EmergencyCallRepositoryInterface>(),
      get<_i6.FirebaseCrashlytics>()));
  gh.factory<_i51.GempaBumiBloc>(() => _i51.GempaBumiBloc(
      get<_i13.GempaBumiRepositoryInterface>(),
      get<_i6.FirebaseCrashlytics>()));
  gh.factory<_i52.GempaBumiLastRecentlyBloc>(() =>
      _i52.GempaBumiLastRecentlyBloc(get<_i13.GempaBumiRepositoryInterface>(),
          get<_i6.FirebaseCrashlytics>()));
  gh.factory<_i53.GempaBumiMagnetudoBloc>(() => _i53.GempaBumiMagnetudoBloc(
      get<_i13.GempaBumiRepositoryInterface>(),
      get<_i6.FirebaseCrashlytics>()));
  gh.factory<_i54.GeolocationBloc>(() => _i54.GeolocationBloc(
      geolocatorRepository: get<_i15.GeolocatorRepositoryInterface>()));
  gh.factory<_i55.HospitalProvinceBloc>(() => _i55.HospitalProvinceBloc(
      get<_i44.CovidRepositoryInterface>(), get<_i6.FirebaseCrashlytics>()));
  gh.factory<_i56.NotificationBloc>(() => _i56.NotificationBloc(
      get<_i26.OneSignalNotificationProviderInterface>()));
  gh.factory<_i57.NotificationSendBloc>(() => _i57.NotificationSendBloc(
      get<_i26.OneSignalNotificationProviderInterface>(),
      get<_i36.AuthRepositoryInterface>()));
  gh.factory<_i58.ProfileProviderInterface>(() => _i59.ProfileProvider(
      authRepository: get<_i36.AuthRepositoryInterface>(),
      firestore: get<_i7.FirebaseFirestore>(),
      imageStorage: get<_i10.FirebaseStorage>()));
  gh.factory<_i60.ProfileRepositoryInterface>(() => _i61.ProfileRepository(
      profileProvider: get<_i58.ProfileProviderInterface>()));
  gh.factory<_i62.RegisterBloc>(() => _i62.RegisterBloc(
      registerRepository: get<_i30.RegisterRepositoryInterface>(),
      authRepository: get<_i36.AuthRepositoryInterface>(),
      firebaseCrashlytics: get<_i6.FirebaseCrashlytics>()));
  gh.factory<_i63.RemoteConfigServiceInterface>(() => _i64.RemoteConfigService(
      remoteConfig: get<_i9.FirebaseRemoteConfig>(),
      sharedPreferences: get<_i33.SharedPreferences>(),
      firebaseCrashlytics: get<_i6.FirebaseCrashlytics>()));
  gh.factory<_i65.ReportProviderInterface>(() => _i66.ReportProvider(
      authRepository: get<_i36.AuthRepositoryInterface>(),
      firestore: get<_i7.FirebaseFirestore>(),
      imageStorage: get<_i10.FirebaseStorage>()));
  gh.factory<_i67.ReportRepositoryInterface>(() => _i68.ReportRepository(
      reportProvider: get<_i65.ReportProviderInterface>()));
  gh.factory<_i69.ReportUpdateFormBloc>(() => _i69.ReportUpdateFormBloc(
      get<_i67.ReportRepositoryInterface>(), get<_i6.FirebaseCrashlytics>()));
  gh.factory<_i70.ReportUserBloc>(() => _i70.ReportUserBloc(
      get<_i67.ReportRepositoryInterface>(), get<_i6.FirebaseCrashlytics>()));
  gh.factory<_i71.UpdatePasswordBloc>(() => _i71.UpdatePasswordBloc(
      profileRepository: get<_i60.ProfileRepositoryInterface>(),
      firebaseCrashlytics: get<_i6.FirebaseCrashlytics>()));
  gh.factory<_i72.VaccinationBloc>(() => _i72.VaccinationBloc(
      get<_i44.CovidRepositoryInterface>(), get<_i6.FirebaseCrashlytics>()));
  gh.factory<_i73.AuthBloc>(() => _i73.AuthBloc(
      authRepository: get<_i36.AuthRepositoryInterface>(),
      firebaseCrashlytics: get<_i6.FirebaseCrashlytics>()));
  gh.factory<_i74.CallBloc>(() => _i74.CallBloc(
      callRepository: get<_i40.CallRepositoryInterface>(),
      firebaseCrashlytics: get<_i6.FirebaseCrashlytics>()));
  gh.factory<_i75.EmergencyCallBloc>(() => _i75.EmergencyCallBloc(
      get<_i48.EmergencyCallRepositoryInterface>(),
      get<_i6.FirebaseCrashlytics>(),
      get<_i60.ProfileRepositoryInterface>()));
  gh.factory<_i76.EmergencyCallListBloc>(() => _i76.EmergencyCallListBloc(
      get<_i48.EmergencyCallRepositoryInterface>(),
      get<_i6.FirebaseCrashlytics>()));
  gh.factory<_i77.EmergencyValidatePhoneNumberBloc>(() =>
      _i77.EmergencyValidatePhoneNumberBloc(
          get<_i60.ProfileRepositoryInterface>(),
          get<_i6.FirebaseCrashlytics>()));
  gh.factory<_i78.HomeProviderInterface>(() => _i79.HomeProvider(
      get<_i7.FirebaseFirestore>(), get<_i63.RemoteConfigServiceInterface>()));
  gh.factory<_i80.HomeReportBloc>(() => _i80.HomeReportBloc(
      get<_i67.ReportRepositoryInterface>(), get<_i6.FirebaseCrashlytics>()));
  gh.factory<_i81.HomeRepositoryInterface>(() =>
      _i82.HomeRepository(homeProvider: get<_i78.HomeProviderInterface>()));
  gh.factory<_i83.HomeStatisticChartBloc>(() => _i83.HomeStatisticChartBloc(
      get<_i81.HomeRepositoryInterface>(), get<_i6.FirebaseCrashlytics>()));
  gh.factory<_i84.HomeStatisticDataBloc>(() => _i84.HomeStatisticDataBloc(
      get<_i81.HomeRepositoryInterface>(), get<_i6.FirebaseCrashlytics>()));
  gh.factory<_i85.LoginBloc>(() => _i85.LoginBloc(
      loginRepository: get<_i20.LoginRepositoryInterface>(),
      authRepository: get<_i36.AuthRepositoryInterface>(),
      registerRepository: get<_i30.RegisterRepositoryInterface>(),
      firebaseCrashlytics: get<_i6.FirebaseCrashlytics>(),
      notificationProvider: get<_i26.OneSignalNotificationProviderInterface>(),
      profileRepository: get<_i60.ProfileRepositoryInterface>()));
  gh.factory<_i86.NewsListNewBloc>(() => _i86.NewsListNewBloc(
      get<_i24.NewsRepositoryInterface>(),
      get<_i63.RemoteConfigServiceInterface>()));
  gh.factory<_i87.ProfileBloc>(() => _i87.ProfileBloc(
      profileRepository: get<_i60.ProfileRepositoryInterface>(),
      firebaseCrashlytics: get<_i6.FirebaseCrashlytics>()));
  gh.factory<_i88.ProfileEditBloc>(() => _i88.ProfileEditBloc(
      profileRepository: get<_i60.ProfileRepositoryInterface>(),
      firebaseCrashlytics: get<_i6.FirebaseCrashlytics>()));
  gh.factory<_i89.ProfilePictureUpdateBloc>(() => _i89.ProfilePictureUpdateBloc(
      get<_i60.ProfileRepositoryInterface>(), get<_i6.FirebaseCrashlytics>()));
  gh.factory<_i90.ReportBookmarkBloc>(() => _i90.ReportBookmarkBloc(
      get<_i67.ReportRepositoryInterface>(), get<_i6.FirebaseCrashlytics>()));
  gh.factory<_i91.ReportBookmarkUserBloc>(() => _i91.ReportBookmarkUserBloc(
      get<_i67.ReportRepositoryInterface>(), get<_i6.FirebaseCrashlytics>()));
  gh.factory<_i92.ReportCategoryBloc>(() => _i92.ReportCategoryBloc(
      get<_i67.ReportRepositoryInterface>(), get<_i6.FirebaseCrashlytics>()));
  gh.factory<_i93.ReportDetailBloc>(() => _i93.ReportDetailBloc(
      get<_i67.ReportRepositoryInterface>(), get<_i6.FirebaseCrashlytics>()));
  gh.factory<_i94.ReportExportBloc>(() => _i94.ReportExportBloc(
      get<_i67.ReportRepositoryInterface>(), get<_i6.FirebaseCrashlytics>()));
  gh.factory<_i95.ReportFormBloc>(() => _i95.ReportFormBloc(
      reportRepository: get<_i67.ReportRepositoryInterface>(),
      authRepository: get<_i36.AuthRepositoryInterface>(),
      firebaseCrashlytics: get<_i6.FirebaseCrashlytics>()));
  gh.factory<_i96.ReportListBloc>(() => _i96.ReportListBloc(
      get<_i67.ReportRepositoryInterface>(), get<_i6.FirebaseCrashlytics>()));
  gh.factory<_i97.BannerBloc>(() => _i97.BannerBloc(
      get<_i81.HomeRepositoryInterface>(), get<_i6.FirebaseCrashlytics>()));
  gh.factory<_i98.FeatureBloc>(() =>
      _i98.FeatureBloc(homeRepository: get<_i78.HomeProviderInterface>()));
  gh.factory<_i99.HomeCovidBloc>(() => _i99.HomeCovidBloc(
      get<_i81.HomeRepositoryInterface>(), get<_i6.FirebaseCrashlytics>()));
  return get;
}

class _$NativeApiService extends _i100.NativeApiService {}
