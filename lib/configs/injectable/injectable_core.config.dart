// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:cloud_firestore/cloud_firestore.dart' as _i11;
import 'package:dio/dio.dart' as _i3;
import 'package:firebase_auth/firebase_auth.dart' as _i9;
import 'package:firebase_crashlytics/firebase_crashlytics.dart' as _i10;
import 'package:firebase_messaging/firebase_messaging.dart' as _i12;
import 'package:firebase_remote_config/firebase_remote_config.dart' as _i13;
import 'package:firebase_storage/firebase_storage.dart' as _i14;
import 'package:get_it/get_it.dart' as _i1;
import 'package:google_sign_in/google_sign_in.dart' as _i21;
import 'package:injectable/injectable.dart' as _i2;
import 'package:shared_preferences/shared_preferences.dart' as _i35;

import '../../core/bloc/auth_bloc.dart' as _i62;
import '../../core/providers/auth_provider.dart' as _i37;
import '../../core/providers/auth_provider_interface.dart' as _i36;
import '../../core/repositories/auth_repository.dart' as _i39;
import '../../core/repositories/auth_repository_interface.dart' as _i38;
import '../../modules/auth/blocs/login/login_bloc.dart' as _i49;
import '../../modules/auth/blocs/register/register_bloc.dart' as _i54;
import '../../modules/auth/blocs/reset_password/reset_password_bloc.dart'
    as _i34;
import '../../modules/auth/providers/login_provider.dart' as _i23;
import '../../modules/auth/providers/login_provider_interface.dart' as _i22;
import '../../modules/auth/providers/register_provider.dart' as _i31;
import '../../modules/auth/providers/register_provider_interface.dart' as _i30;
import '../../modules/auth/repositories/login_repository.dart' as _i25;
import '../../modules/auth/repositories/login_repository_interface.dart'
    as _i24;
import '../../modules/auth/repositories/register_repository.dart' as _i33;
import '../../modules/auth/repositories/register_repository_interface.dart'
    as _i32;
import '../../modules/call/blocs/calls/call_bloc.dart' as _i63;
import '../../modules/call/providers/call_provider.dart' as _i41;
import '../../modules/call/providers/call_provider_interface.dart' as _i40;
import '../../modules/call/repositories/call_repository.dart' as _i43;
import '../../modules/call/repositories/call_repository_interface.dart' as _i42;
import '../../modules/emergency/blocs/emergency_call/emergency_call_bloc.dart'
    as _i44;
import '../../modules/emergency/providers/emergency_call_provider.dart' as _i5;
import '../../modules/emergency/providers/emergency_call_provider_interface.dart'
    as _i4;
import '../../modules/emergency/repositories/emergency_call_repository.dart'
    as _i7;
import '../../modules/emergency/repositories/emergency_call_repository_interface.dart'
    as _i6;
import '../../modules/gempa_bumi/blocs/gempa_bumi_bloc/gempa_bumi_bloc.dart'
    as _i45;
import '../../modules/gempa_bumi/blocs/gempa_bumi_last_recently_bloc/gempa_bumi_last_recently_bloc.dart'
    as _i46;
import '../../modules/gempa_bumi/blocs/gempa_bumi_magnetudo_bloc/gempa_bumi_magnetudo_bloc.dart'
    as _i47;
import '../../modules/gempa_bumi/providers/gempa_bumi_provider.dart' as _i16;
import '../../modules/gempa_bumi/providers/gempa_bumi_provider_interface.dart'
    as _i15;
import '../../modules/gempa_bumi/repositories/gempa_bumi_repository.dart'
    as _i18;
import '../../modules/gempa_bumi/repositories/gempa_bumi_repository_interface.dart'
    as _i17;
import '../../modules/home/blocs/banner/banner_bloc.dart' as _i75;
import '../../modules/home/blocs/feature/feature_bloc.dart' as _i76;
import '../../modules/home/blocs/home_covid/home_covid_bloc.dart' as _i77;
import '../../modules/home/blocs/home_report/home_report_bloc.dart' as _i67;
import '../../modules/home/providers/home_provider.dart' as _i66;
import '../../modules/home/providers/home_provider_interface.dart' as _i65;
import '../../modules/home/repositories/home_repository.dart' as _i69;
import '../../modules/home/repositories/home_repository_interface.dart' as _i68;
import '../../modules/news/blocs/news_list_new/news_list_new_bloc.dart' as _i71;
import '../../modules/news/providers/news_provider.dart' as _i27;
import '../../modules/news/providers/news_provider_interface.dart' as _i26;
import '../../modules/news/repositories/news_repository.dart' as _i29;
import '../../modules/news/repositories/news_repository_interface.dart' as _i28;
import '../../modules/profile/blocs/edit_profile/edit_profile_bloc.dart'
    as _i64;
import '../../modules/profile/blocs/profile/profile_bloc.dart' as _i72;
import '../../modules/profile/blocs/update_password/update_password_bloc.dart'
    as _i61;
import '../../modules/profile/models/environment_model.dart' as _i8;
import '../../modules/profile/providers/profile_provider.dart' as _i51;
import '../../modules/profile/providers/profile_provider_interface.dart'
    as _i50;
import '../../modules/profile/repositories/profile_repository.dart' as _i53;
import '../../modules/profile/repositories/profile_repository_interface.dart'
    as _i52;
import '../../modules/report/blocs/geolocation/geolocation_bloc.dart' as _i48;
import '../../modules/report/blocs/my_report/my_report_bloc.dart' as _i70;
import '../../modules/report/blocs/report_form/report_form_bloc.dart' as _i73;
import '../../modules/report/blocs/report_list_bloc/report_list_bloc.dart'
    as _i74;
import '../../modules/report/providers/report_provider.dart' as _i58;
import '../../modules/report/providers/report_provider_interface.dart' as _i57;
import '../../modules/report/repositories/report_repository.dart' as _i60;
import '../../modules/report/repositories/report_repository_interface.dart'
    as _i59;
import '../../services/geolocator/geolocator_repository.dart' as _i20;
import '../../services/geolocator/geolocator_repository_interface.dart' as _i19;
import '../../services/native_api_service.dart' as _i78;
import '../../services/remote_config_service/remote_config_service.dart'
    as _i56;
import '../../services/remote_config_service/remote_config_service_interface.dart'
    as _i55; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
Future<_i1.GetIt> $initGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) async {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  final nativeApiService = _$NativeApiService();
  gh.factory<_i3.Dio>(() => nativeApiService.dio);
  gh.factory<_i4.EmergencyCallProviderInterface>(
      () => _i5.EmergencyCallProvider());
  gh.factory<_i6.EmergencyCallRepositoryInterface>(
      () => _i7.EmergencyCallRepository());
  await gh.lazySingletonAsync<_i8.EnvironmentModel>(
      () => nativeApiService.getPlatformInfo(),
      preResolve: true);
  gh.singleton<_i9.FirebaseAuth>(nativeApiService.firebaseAuth);
  gh.singleton<_i10.FirebaseCrashlytics>(nativeApiService.firebaseCrashlytics);
  gh.singleton<_i11.FirebaseFirestore>(nativeApiService.firebaseFirestore);
  gh.singleton<_i12.FirebaseMessaging>(nativeApiService.firebaseMessaging);
  await gh.lazySingletonAsync<_i13.FirebaseRemoteConfig>(
      () => nativeApiService.remoteConfig,
      preResolve: true);
  gh.lazySingleton<_i14.FirebaseStorage>(
      () => nativeApiService.firebaseStorage);
  gh.factory<_i15.GempaBumiProviderInterface>(
      () => _i16.GempaBumiProvider(get<_i3.Dio>()));
  gh.factory<_i17.GempaBumiRepositoryInterface>(
      () => _i18.GempaBumiRepository(get<_i15.GempaBumiProviderInterface>()));
  gh.factory<_i19.GeolocatorRepositoryInterface>(
      () => _i20.GeolocatorRepository());
  gh.factory<_i21.GoogleSignIn>(() => nativeApiService.googleSignIn);
  gh.factory<_i22.LoginProviderInterface>(() => _i23.LoginProvider(
      firebaseAuth: get<_i9.FirebaseAuth>(),
      googleSignIn: get<_i21.GoogleSignIn>(),
      firebaseFirestore: get<_i11.FirebaseFirestore>()));
  gh.factory<_i24.LoginRepositoryInterface>(
      () => _i25.LoginRepository(get<_i22.LoginProviderInterface>()));
  gh.factory<_i26.NewsProviderInterface>(
      () => _i27.NewsProvider(get<_i3.Dio>()));
  gh.factory<_i28.NewsRepositoryInterface>(
      () => _i29.NewsRepository(get<_i26.NewsProviderInterface>()));
  gh.factory<_i30.RegisterProviderInterface>(() => _i31.RegisterProvider(
      firebaseAuth: get<_i9.FirebaseAuth>(),
      firebaseFirestore: get<_i11.FirebaseFirestore>()));
  gh.factory<_i32.RegisterRepositoryInterface>(
      () => _i33.RegisterRepository(get<_i30.RegisterProviderInterface>()));
  gh.factory<_i34.ResetPasswordBloc>(() => _i34.ResetPasswordBloc(
      registerRepository: get<_i32.RegisterRepositoryInterface>(),
      firebaseCrashlytics: get<_i10.FirebaseCrashlytics>()));
  await gh.lazySingletonAsync<_i35.SharedPreferences>(
      () => nativeApiService.prefs,
      preResolve: true);
  gh.factory<_i36.AuthProviderInterface>(() =>
      _i37.AuthProvider(get<_i9.FirebaseAuth>(), get<_i21.GoogleSignIn>()));
  gh.factory<_i38.AuthRepositoryInterface>(
      () => _i39.AuthRepository(get<_i36.AuthProviderInterface>()));
  gh.factory<_i40.CallProviderInterface>(
      () => _i41.CallProvider(get<_i11.FirebaseFirestore>()));
  gh.factory<_i42.CallRepositoryInterface>(() =>
      _i43.CallRepository(callProvider: get<_i40.CallProviderInterface>()));
  gh.factory<_i44.EmergencyCallBloc>(() => _i44.EmergencyCallBloc(
      get<_i6.EmergencyCallRepositoryInterface>(),
      get<_i10.FirebaseCrashlytics>()));
  gh.factory<_i45.GempaBumiBloc>(() => _i45.GempaBumiBloc(
      get<_i17.GempaBumiRepositoryInterface>(),
      get<_i10.FirebaseCrashlytics>()));
  gh.factory<_i46.GempaBumiLastRecentlyBloc>(() =>
      _i46.GempaBumiLastRecentlyBloc(get<_i17.GempaBumiRepositoryInterface>(),
          get<_i10.FirebaseCrashlytics>()));
  gh.factory<_i47.GempaBumiMagnetudoBloc>(() => _i47.GempaBumiMagnetudoBloc(
      get<_i17.GempaBumiRepositoryInterface>(),
      get<_i10.FirebaseCrashlytics>()));
  gh.factory<_i48.GeolocationBloc>(() => _i48.GeolocationBloc(
      geolocatorRepository: get<_i19.GeolocatorRepositoryInterface>()));
  gh.factory<_i49.LoginBloc>(() => _i49.LoginBloc(
      loginRepository: get<_i24.LoginRepositoryInterface>(),
      authRepository: get<_i38.AuthRepositoryInterface>(),
      registerRepository: get<_i32.RegisterRepositoryInterface>(),
      firebaseCrashlytics: get<_i10.FirebaseCrashlytics>()));
  gh.factory<_i50.ProfileProviderInterface>(() => _i51.ProfileProvider(
      authRepository: get<_i38.AuthRepositoryInterface>(),
      firestore: get<_i11.FirebaseFirestore>()));
  gh.factory<_i52.ProfileRepositoryInterface>(() => _i53.ProfileRepository(
      profileProvider: get<_i50.ProfileProviderInterface>()));
  gh.factory<_i54.RegisterBloc>(() => _i54.RegisterBloc(
      registerRepository: get<_i32.RegisterRepositoryInterface>(),
      authRepository: get<_i38.AuthRepositoryInterface>(),
      firebaseCrashlytics: get<_i10.FirebaseCrashlytics>()));
  gh.factory<_i55.RemoteConfigServiceInterface>(() => _i56.RemoteConfigService(
      remoteConfig: get<_i13.FirebaseRemoteConfig>(),
      sharedPreferences: get<_i35.SharedPreferences>(),
      firebaseCrashlytics: get<_i10.FirebaseCrashlytics>()));
  gh.factory<_i57.ReportProviderInterface>(() => _i58.ReportProvider(
      authRepository: get<_i38.AuthRepositoryInterface>(),
      firestore: get<_i11.FirebaseFirestore>(),
      imageStorage: get<_i14.FirebaseStorage>()));
  gh.factory<_i59.ReportRepositoryInterface>(() => _i60.ReportRepository(
      reportProvider: get<_i57.ReportProviderInterface>()));
  gh.factory<_i61.UpdatePasswordBloc>(() => _i61.UpdatePasswordBloc(
      profileRepository: get<_i52.ProfileRepositoryInterface>(),
      firebaseCrashlytics: get<_i10.FirebaseCrashlytics>()));
  gh.factory<_i62.AuthBloc>(() => _i62.AuthBloc(
      authRepository: get<_i38.AuthRepositoryInterface>(),
      firebaseCrashlytics: get<_i10.FirebaseCrashlytics>()));
  gh.factory<_i63.CallBloc>(() => _i63.CallBloc(
      callRepository: get<_i42.CallRepositoryInterface>(),
      firebaseCrashlytics: get<_i10.FirebaseCrashlytics>()));
  gh.factory<_i64.EditProfileBloc>(() => _i64.EditProfileBloc(
      profileRepository: get<_i52.ProfileRepositoryInterface>(),
      firebaseCrashlytics: get<_i10.FirebaseCrashlytics>()));
  gh.factory<_i65.HomeProviderInterface>(() => _i66.HomeProvider(
      get<_i11.FirebaseFirestore>(), get<_i55.RemoteConfigServiceInterface>()));
  gh.factory<_i67.HomeReportBloc>(() => _i67.HomeReportBloc(
      get<_i59.ReportRepositoryInterface>(), get<_i10.FirebaseCrashlytics>()));
  gh.factory<_i68.HomeRepositoryInterface>(() =>
      _i69.HomeRepository(homeProvider: get<_i65.HomeProviderInterface>()));
  gh.factory<_i70.MyReportBloc>(() => _i70.MyReportBloc(
      get<_i59.ReportRepositoryInterface>(), get<_i10.FirebaseCrashlytics>()));
  gh.factory<_i71.NewsListNewBloc>(() => _i71.NewsListNewBloc(
      get<_i28.NewsRepositoryInterface>(),
      get<_i55.RemoteConfigServiceInterface>()));
  gh.factory<_i72.ProfileBloc>(() => _i72.ProfileBloc(
      profileRepository: get<_i52.ProfileRepositoryInterface>(),
      firebaseCrashlytics: get<_i10.FirebaseCrashlytics>()));
  gh.factory<_i73.ReportFormBloc>(() => _i73.ReportFormBloc(
      reportRepository: get<_i59.ReportRepositoryInterface>(),
      authRepository: get<_i38.AuthRepositoryInterface>(),
      firebaseCrashlytics: get<_i10.FirebaseCrashlytics>()));
  gh.factory<_i74.ReportListBloc>(() => _i74.ReportListBloc(
      get<_i59.ReportRepositoryInterface>(), get<_i10.FirebaseCrashlytics>()));
  gh.factory<_i75.BannerBloc>(() => _i75.BannerBloc(
      get<_i68.HomeRepositoryInterface>(), get<_i10.FirebaseCrashlytics>()));
  gh.factory<_i76.FeatureBloc>(() =>
      _i76.FeatureBloc(homeRepository: get<_i65.HomeProviderInterface>()));
  gh.factory<_i77.HomeCovidBloc>(() => _i77.HomeCovidBloc(
      get<_i68.HomeRepositoryInterface>(), get<_i10.FirebaseCrashlytics>()));
  return get;
}

class _$NativeApiService extends _i78.NativeApiService {}
