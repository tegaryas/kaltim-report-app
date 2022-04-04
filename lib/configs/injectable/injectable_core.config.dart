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
import 'package:shared_preferences/shared_preferences.dart' as _i31;

import '../../core/bloc/auth_bloc.dart' as _i61;
import '../../core/providers/auth_provider.dart' as _i33;
import '../../core/providers/auth_provider_interface.dart' as _i32;
import '../../core/repositories/auth_repository.dart' as _i35;
import '../../core/repositories/auth_repository_interface.dart' as _i34;
import '../../modules/auth/blocs/login/login_bloc.dart' as _i48;
import '../../modules/auth/blocs/register/register_bloc.dart' as _i53;
import '../../modules/auth/blocs/reset_password/reset_password_bloc.dart'
    as _i30;
import '../../modules/auth/providers/login_provider.dart' as _i19;
import '../../modules/auth/providers/login_provider_interface.dart' as _i18;
import '../../modules/auth/providers/register_provider.dart' as _i27;
import '../../modules/auth/providers/register_provider_interface.dart' as _i26;
import '../../modules/auth/repositories/login_repository.dart' as _i21;
import '../../modules/auth/repositories/login_repository_interface.dart'
    as _i20;
import '../../modules/auth/repositories/register_repository.dart' as _i29;
import '../../modules/auth/repositories/register_repository_interface.dart'
    as _i28;
import '../../modules/call/blocs/calls/call_bloc.dart' as _i62;
import '../../modules/call/providers/call_provider.dart' as _i37;
import '../../modules/call/providers/call_provider_interface.dart' as _i36;
import '../../modules/call/repositories/call_repository.dart' as _i39;
import '../../modules/call/repositories/call_repository_interface.dart' as _i38;
import '../../modules/emergency/blocs/emergency_call/emergency_call_bloc.dart'
    as _i64;
import '../../modules/emergency/providers/emergency_call_provider.dart' as _i41;
import '../../modules/emergency/providers/emergency_call_provider_interface.dart'
    as _i40;
import '../../modules/emergency/repositories/emergency_call_repository.dart'
    as _i43;
import '../../modules/emergency/repositories/emergency_call_repository_interface.dart'
    as _i42;
import '../../modules/gempa_bumi/blocs/gempa_bumi_bloc/gempa_bumi_bloc.dart'
    as _i44;
import '../../modules/gempa_bumi/blocs/gempa_bumi_last_recently_bloc/gempa_bumi_last_recently_bloc.dart'
    as _i45;
import '../../modules/gempa_bumi/blocs/gempa_bumi_magnetudo_bloc/gempa_bumi_magnetudo_bloc.dart'
    as _i46;
import '../../modules/gempa_bumi/providers/gempa_bumi_provider.dart' as _i12;
import '../../modules/gempa_bumi/providers/gempa_bumi_provider_interface.dart'
    as _i11;
import '../../modules/gempa_bumi/repositories/gempa_bumi_repository.dart'
    as _i14;
import '../../modules/gempa_bumi/repositories/gempa_bumi_repository_interface.dart'
    as _i13;
import '../../modules/home/blocs/banner/banner_bloc.dart' as _i75;
import '../../modules/home/blocs/feature/feature_bloc.dart' as _i76;
import '../../modules/home/blocs/home_covid/home_covid_bloc.dart' as _i77;
import '../../modules/home/blocs/home_report/home_report_bloc.dart' as _i67;
import '../../modules/home/providers/home_provider.dart' as _i66;
import '../../modules/home/providers/home_provider_interface.dart' as _i65;
import '../../modules/home/repositories/home_repository.dart' as _i69;
import '../../modules/home/repositories/home_repository_interface.dart' as _i68;
import '../../modules/news/blocs/news_list_new/news_list_new_bloc.dart' as _i71;
import '../../modules/news/providers/news_provider.dart' as _i23;
import '../../modules/news/providers/news_provider_interface.dart' as _i22;
import '../../modules/news/repositories/news_repository.dart' as _i25;
import '../../modules/news/repositories/news_repository_interface.dart' as _i24;
import '../../modules/profile/blocs/edit_profile/edit_profile_bloc.dart'
    as _i63;
import '../../modules/profile/blocs/profile/profile_bloc.dart' as _i72;
import '../../modules/profile/blocs/update_password/update_password_bloc.dart'
    as _i60;
import '../../modules/profile/models/environment_model.dart' as _i4;
import '../../modules/profile/providers/profile_provider.dart' as _i50;
import '../../modules/profile/providers/profile_provider_interface.dart'
    as _i49;
import '../../modules/profile/repositories/profile_repository.dart' as _i52;
import '../../modules/profile/repositories/profile_repository_interface.dart'
    as _i51;
import '../../modules/report/blocs/geolocation/geolocation_bloc.dart' as _i47;
import '../../modules/report/blocs/my_report/my_report_bloc.dart' as _i70;
import '../../modules/report/blocs/report_form/report_form_bloc.dart' as _i73;
import '../../modules/report/blocs/report_list_bloc/report_list_bloc.dart'
    as _i74;
import '../../modules/report/providers/report_provider.dart' as _i57;
import '../../modules/report/providers/report_provider_interface.dart' as _i56;
import '../../modules/report/repositories/report_repository.dart' as _i59;
import '../../modules/report/repositories/report_repository_interface.dart'
    as _i58;
import '../../services/geolocator/geolocator_repository.dart' as _i16;
import '../../services/geolocator/geolocator_repository_interface.dart' as _i15;
import '../../services/native_api_service.dart' as _i78;
import '../../services/remote_config_service/remote_config_service.dart'
    as _i55;
import '../../services/remote_config_service/remote_config_service_interface.dart'
    as _i54; // ignore_for_file: unnecessary_lambdas

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
  gh.factory<_i26.RegisterProviderInterface>(() => _i27.RegisterProvider(
      firebaseAuth: get<_i5.FirebaseAuth>(),
      firebaseFirestore: get<_i7.FirebaseFirestore>()));
  gh.factory<_i28.RegisterRepositoryInterface>(
      () => _i29.RegisterRepository(get<_i26.RegisterProviderInterface>()));
  gh.factory<_i30.ResetPasswordBloc>(() => _i30.ResetPasswordBloc(
      registerRepository: get<_i28.RegisterRepositoryInterface>(),
      firebaseCrashlytics: get<_i6.FirebaseCrashlytics>()));
  await gh.lazySingletonAsync<_i31.SharedPreferences>(
      () => nativeApiService.prefs,
      preResolve: true);
  gh.factory<_i32.AuthProviderInterface>(() =>
      _i33.AuthProvider(get<_i5.FirebaseAuth>(), get<_i17.GoogleSignIn>()));
  gh.factory<_i34.AuthRepositoryInterface>(
      () => _i35.AuthRepository(get<_i32.AuthProviderInterface>()));
  gh.factory<_i36.CallProviderInterface>(
      () => _i37.CallProvider(get<_i7.FirebaseFirestore>()));
  gh.factory<_i38.CallRepositoryInterface>(() =>
      _i39.CallRepository(callProvider: get<_i36.CallProviderInterface>()));
  gh.factory<_i40.EmergencyCallProviderInterface>(
      () => _i41.EmergencyCallProvider(get<_i7.FirebaseFirestore>()));
  gh.factory<_i42.EmergencyCallRepositoryInterface>(() =>
      _i43.EmergencyCallRepository(get<_i40.EmergencyCallProviderInterface>()));
  gh.factory<_i44.GempaBumiBloc>(() => _i44.GempaBumiBloc(
      get<_i13.GempaBumiRepositoryInterface>(),
      get<_i6.FirebaseCrashlytics>()));
  gh.factory<_i45.GempaBumiLastRecentlyBloc>(() =>
      _i45.GempaBumiLastRecentlyBloc(get<_i13.GempaBumiRepositoryInterface>(),
          get<_i6.FirebaseCrashlytics>()));
  gh.factory<_i46.GempaBumiMagnetudoBloc>(() => _i46.GempaBumiMagnetudoBloc(
      get<_i13.GempaBumiRepositoryInterface>(),
      get<_i6.FirebaseCrashlytics>()));
  gh.factory<_i47.GeolocationBloc>(() => _i47.GeolocationBloc(
      geolocatorRepository: get<_i15.GeolocatorRepositoryInterface>()));
  gh.factory<_i48.LoginBloc>(() => _i48.LoginBloc(
      loginRepository: get<_i20.LoginRepositoryInterface>(),
      authRepository: get<_i34.AuthRepositoryInterface>(),
      registerRepository: get<_i28.RegisterRepositoryInterface>(),
      firebaseCrashlytics: get<_i6.FirebaseCrashlytics>()));
  gh.factory<_i49.ProfileProviderInterface>(() => _i50.ProfileProvider(
      authRepository: get<_i34.AuthRepositoryInterface>(),
      firestore: get<_i7.FirebaseFirestore>()));
  gh.factory<_i51.ProfileRepositoryInterface>(() => _i52.ProfileRepository(
      profileProvider: get<_i49.ProfileProviderInterface>()));
  gh.factory<_i53.RegisterBloc>(() => _i53.RegisterBloc(
      registerRepository: get<_i28.RegisterRepositoryInterface>(),
      authRepository: get<_i34.AuthRepositoryInterface>(),
      firebaseCrashlytics: get<_i6.FirebaseCrashlytics>()));
  gh.factory<_i54.RemoteConfigServiceInterface>(() => _i55.RemoteConfigService(
      remoteConfig: get<_i9.FirebaseRemoteConfig>(),
      sharedPreferences: get<_i31.SharedPreferences>(),
      firebaseCrashlytics: get<_i6.FirebaseCrashlytics>()));
  gh.factory<_i56.ReportProviderInterface>(() => _i57.ReportProvider(
      authRepository: get<_i34.AuthRepositoryInterface>(),
      firestore: get<_i7.FirebaseFirestore>(),
      imageStorage: get<_i10.FirebaseStorage>()));
  gh.factory<_i58.ReportRepositoryInterface>(() => _i59.ReportRepository(
      reportProvider: get<_i56.ReportProviderInterface>()));
  gh.factory<_i60.UpdatePasswordBloc>(() => _i60.UpdatePasswordBloc(
      profileRepository: get<_i51.ProfileRepositoryInterface>(),
      firebaseCrashlytics: get<_i6.FirebaseCrashlytics>()));
  gh.factory<_i61.AuthBloc>(() => _i61.AuthBloc(
      authRepository: get<_i34.AuthRepositoryInterface>(),
      firebaseCrashlytics: get<_i6.FirebaseCrashlytics>()));
  gh.factory<_i62.CallBloc>(() => _i62.CallBloc(
      callRepository: get<_i38.CallRepositoryInterface>(),
      firebaseCrashlytics: get<_i6.FirebaseCrashlytics>()));
  gh.factory<_i63.EditProfileBloc>(() => _i63.EditProfileBloc(
      profileRepository: get<_i51.ProfileRepositoryInterface>(),
      firebaseCrashlytics: get<_i6.FirebaseCrashlytics>()));
  gh.factory<_i64.EmergencyCallBloc>(() => _i64.EmergencyCallBloc(
      get<_i42.EmergencyCallRepositoryInterface>(),
      get<_i6.FirebaseCrashlytics>()));
  gh.factory<_i65.HomeProviderInterface>(() => _i66.HomeProvider(
      get<_i7.FirebaseFirestore>(), get<_i54.RemoteConfigServiceInterface>()));
  gh.factory<_i67.HomeReportBloc>(() => _i67.HomeReportBloc(
      get<_i58.ReportRepositoryInterface>(), get<_i6.FirebaseCrashlytics>()));
  gh.factory<_i68.HomeRepositoryInterface>(() =>
      _i69.HomeRepository(homeProvider: get<_i65.HomeProviderInterface>()));
  gh.factory<_i70.MyReportBloc>(() => _i70.MyReportBloc(
      get<_i58.ReportRepositoryInterface>(), get<_i6.FirebaseCrashlytics>()));
  gh.factory<_i71.NewsListNewBloc>(() => _i71.NewsListNewBloc(
      get<_i24.NewsRepositoryInterface>(),
      get<_i54.RemoteConfigServiceInterface>()));
  gh.factory<_i72.ProfileBloc>(() => _i72.ProfileBloc(
      profileRepository: get<_i51.ProfileRepositoryInterface>(),
      firebaseCrashlytics: get<_i6.FirebaseCrashlytics>()));
  gh.factory<_i73.ReportFormBloc>(() => _i73.ReportFormBloc(
      reportRepository: get<_i58.ReportRepositoryInterface>(),
      authRepository: get<_i34.AuthRepositoryInterface>(),
      firebaseCrashlytics: get<_i6.FirebaseCrashlytics>()));
  gh.factory<_i74.ReportListBloc>(() => _i74.ReportListBloc(
      get<_i58.ReportRepositoryInterface>(), get<_i6.FirebaseCrashlytics>()));
  gh.factory<_i75.BannerBloc>(() => _i75.BannerBloc(
      get<_i68.HomeRepositoryInterface>(), get<_i6.FirebaseCrashlytics>()));
  gh.factory<_i76.FeatureBloc>(() =>
      _i76.FeatureBloc(homeRepository: get<_i65.HomeProviderInterface>()));
  gh.factory<_i77.HomeCovidBloc>(() => _i77.HomeCovidBloc(
      get<_i68.HomeRepositoryInterface>(), get<_i6.FirebaseCrashlytics>()));
  return get;
}

class _$NativeApiService extends _i78.NativeApiService {}
