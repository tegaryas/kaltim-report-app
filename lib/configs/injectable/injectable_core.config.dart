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
import 'package:shared_preferences/shared_preferences.dart' as _i36;

import '../../core/bloc/auth_bloc.dart' as _i70;
import '../../core/core.dart' as _i21;
import '../../core/providers/auth_provider.dart' as _i38;
import '../../core/providers/auth_provider_interface.dart' as _i37;
import '../../core/repositories/auth_repository.dart' as _i40;
import '../../core/repositories/auth_repository_interface.dart' as _i39;
import '../../modules/auth/blocs/login/login_bloc.dart' as _i19;
import '../../modules/auth/blocs/register/register_bloc.dart' as _i30;
import '../../modules/auth/blocs/reset_password/reset_password_bloc.dart'
    as _i35;
import '../../modules/auth/providers/login_provider.dart' as _i23;
import '../../modules/auth/providers/login_provider_interface.dart' as _i22;
import '../../modules/auth/providers/register_provider.dart' as _i32;
import '../../modules/auth/providers/register_provider_interface.dart' as _i31;
import '../../modules/auth/repositories/login_repository.dart' as _i25;
import '../../modules/auth/repositories/login_repository_interface.dart'
    as _i24;
import '../../modules/auth/repositories/register_repository.dart' as _i34;
import '../../modules/auth/repositories/register_repository_interface.dart'
    as _i33;
import '../../modules/auth/repositories/repositories.dart' as _i20;
import '../../modules/call/blocs/calls/call_bloc.dart' as _i71;
import '../../modules/call/providers/call_provider.dart' as _i42;
import '../../modules/call/providers/call_provider_interface.dart' as _i41;
import '../../modules/call/repositories/call_repository.dart' as _i44;
import '../../modules/call/repositories/call_repository_interface.dart' as _i43;
import '../../modules/covid/blocs/hospital_cities/hospital_cities_bloc.dart'
    as _i18;
import '../../modules/covid/blocs/hospital_province/hospital_province_bloc.dart'
    as _i57;
import '../../modules/covid/blocs/vaccination/vaccination_bloc.dart' as _i69;
import '../../modules/covid/providers/covid_provider.dart' as _i46;
import '../../modules/covid/providers/covid_provider_interface.dart' as _i45;
import '../../modules/covid/repositories/covid_repository.dart' as _i48;
import '../../modules/covid/repositories/covid_repository_interface.dart'
    as _i47;
import '../../modules/emergency/blocs/emergency_call/emergency_call_bloc.dart'
    as _i73;
import '../../modules/emergency/providers/emergency_call_provider.dart' as _i50;
import '../../modules/emergency/providers/emergency_call_provider_interface.dart'
    as _i49;
import '../../modules/emergency/repositories/emergency_call_repository.dart'
    as _i52;
import '../../modules/emergency/repositories/emergency_call_repository_interface.dart'
    as _i51;
import '../../modules/gempa_bumi/blocs/gempa_bumi_bloc/gempa_bumi_bloc.dart'
    as _i53;
import '../../modules/gempa_bumi/blocs/gempa_bumi_last_recently_bloc/gempa_bumi_last_recently_bloc.dart'
    as _i54;
import '../../modules/gempa_bumi/blocs/gempa_bumi_magnetudo_bloc/gempa_bumi_magnetudo_bloc.dart'
    as _i55;
import '../../modules/gempa_bumi/providers/gempa_bumi_provider.dart' as _i12;
import '../../modules/gempa_bumi/providers/gempa_bumi_provider_interface.dart'
    as _i11;
import '../../modules/gempa_bumi/repositories/gempa_bumi_repository.dart'
    as _i14;
import '../../modules/gempa_bumi/repositories/gempa_bumi_repository_interface.dart'
    as _i13;
import '../../modules/home/blocs/banner/banner_bloc.dart' as _i84;
import '../../modules/home/blocs/feature/feature_bloc.dart' as _i85;
import '../../modules/home/blocs/home_covid/home_covid_bloc.dart' as _i86;
import '../../modules/home/blocs/home_report/home_report_bloc.dart' as _i76;
import '../../modules/home/providers/home_provider.dart' as _i75;
import '../../modules/home/providers/home_provider_interface.dart' as _i74;
import '../../modules/home/repositories/home_repository.dart' as _i78;
import '../../modules/home/repositories/home_repository_interface.dart' as _i77;
import '../../modules/news/blocs/news_list_new/news_list_new_bloc.dart' as _i80;
import '../../modules/news/providers/news_provider.dart' as _i27;
import '../../modules/news/providers/news_provider_interface.dart' as _i26;
import '../../modules/news/repositories/news_repository.dart' as _i29;
import '../../modules/news/repositories/news_repository_interface.dart' as _i28;
import '../../modules/profile/blocs/edit_profile/edit_profile_bloc.dart'
    as _i72;
import '../../modules/profile/blocs/profile/profile_bloc.dart' as _i81;
import '../../modules/profile/blocs/update_password/update_password_bloc.dart'
    as _i68;
import '../../modules/profile/models/environment_model.dart' as _i4;
import '../../modules/profile/providers/profile_provider.dart' as _i59;
import '../../modules/profile/providers/profile_provider_interface.dart'
    as _i58;
import '../../modules/profile/repositories/profile_repository.dart' as _i61;
import '../../modules/profile/repositories/profile_repository_interface.dart'
    as _i60;
import '../../modules/report/blocs/geolocation/geolocation_bloc.dart' as _i56;
import '../../modules/report/blocs/my_report/my_report_bloc.dart' as _i79;
import '../../modules/report/blocs/report_form/report_form_bloc.dart' as _i82;
import '../../modules/report/blocs/report_list_bloc/report_list_bloc.dart'
    as _i83;
import '../../modules/report/providers/report_provider.dart' as _i65;
import '../../modules/report/providers/report_provider_interface.dart' as _i64;
import '../../modules/report/repositories/report_repository.dart' as _i67;
import '../../modules/report/repositories/report_repository_interface.dart'
    as _i66;
import '../../services/geolocator/geolocator_repository.dart' as _i16;
import '../../services/geolocator/geolocator_repository_interface.dart' as _i15;
import '../../services/native_api_service.dart' as _i87;
import '../../services/remote_config_service/remote_config_service.dart'
    as _i63;
import '../../services/remote_config_service/remote_config_service_interface.dart'
    as _i62; // ignore_for_file: unnecessary_lambdas

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
  gh.factory<_i18.HospitalCitiesBloc>(() => _i18.HospitalCitiesBloc());
  gh.factory<_i19.LoginBloc>(() => _i19.LoginBloc(
      loginRepository: get<_i20.LoginRepositoryInterface>(),
      authRepository: get<_i21.AuthRepositoryInterface>(),
      registerRepository: get<_i20.RegisterRepositoryInterface>(),
      firebaseCrashlytics: get<_i6.FirebaseCrashlytics>()));
  gh.factory<_i22.LoginProviderInterface>(() => _i23.LoginProvider(
      firebaseAuth: get<_i5.FirebaseAuth>(),
      googleSignIn: get<_i17.GoogleSignIn>(),
      firebaseFirestore: get<_i7.FirebaseFirestore>()));
  gh.factory<_i24.LoginRepositoryInterface>(
      () => _i25.LoginRepository(get<_i22.LoginProviderInterface>()));
  gh.factory<_i26.NewsProviderInterface>(
      () => _i27.NewsProvider(get<_i3.Dio>()));
  gh.factory<_i28.NewsRepositoryInterface>(
      () => _i29.NewsRepository(get<_i26.NewsProviderInterface>()));
  gh.factory<_i30.RegisterBloc>(() => _i30.RegisterBloc(
      registerRepository: get<_i20.RegisterRepositoryInterface>(),
      authRepository: get<_i21.AuthRepositoryInterface>(),
      firebaseCrashlytics: get<_i6.FirebaseCrashlytics>()));
  gh.factory<_i31.RegisterProviderInterface>(() => _i32.RegisterProvider(
      firebaseAuth: get<_i5.FirebaseAuth>(),
      firebaseFirestore: get<_i7.FirebaseFirestore>()));
  gh.factory<_i33.RegisterRepositoryInterface>(
      () => _i34.RegisterRepository(get<_i31.RegisterProviderInterface>()));
  gh.factory<_i35.ResetPasswordBloc>(() => _i35.ResetPasswordBloc(
      registerRepository: get<_i20.RegisterRepositoryInterface>(),
      firebaseCrashlytics: get<_i6.FirebaseCrashlytics>()));
  await gh.lazySingletonAsync<_i36.SharedPreferences>(
      () => nativeApiService.prefs,
      preResolve: true);
  gh.factory<_i37.AuthProviderInterface>(() => _i38.AuthProvider(
      get<_i5.FirebaseAuth>(),
      get<_i17.GoogleSignIn>(),
      get<_i7.FirebaseFirestore>()));
  gh.factory<_i39.AuthRepositoryInterface>(
      () => _i40.AuthRepository(get<_i37.AuthProviderInterface>()));
  gh.factory<_i41.CallProviderInterface>(
      () => _i42.CallProvider(get<_i7.FirebaseFirestore>()));
  gh.factory<_i43.CallRepositoryInterface>(() =>
      _i44.CallRepository(callProvider: get<_i41.CallProviderInterface>()));
  gh.factory<_i45.CovidProviderInterface>(
      () => _i46.CovidProvider(get<_i3.Dio>()));
  gh.factory<_i47.CovidRepositoryInterface>(
      () => _i48.CovidRepository(get<_i45.CovidProviderInterface>()));
  gh.factory<_i49.EmergencyCallProviderInterface>(
      () => _i50.EmergencyCallProvider(get<_i7.FirebaseFirestore>()));
  gh.factory<_i51.EmergencyCallRepositoryInterface>(() =>
      _i52.EmergencyCallRepository(get<_i49.EmergencyCallProviderInterface>()));
  gh.factory<_i53.GempaBumiBloc>(() => _i53.GempaBumiBloc(
      get<_i13.GempaBumiRepositoryInterface>(),
      get<_i6.FirebaseCrashlytics>()));
  gh.factory<_i54.GempaBumiLastRecentlyBloc>(() =>
      _i54.GempaBumiLastRecentlyBloc(get<_i13.GempaBumiRepositoryInterface>(),
          get<_i6.FirebaseCrashlytics>()));
  gh.factory<_i55.GempaBumiMagnetudoBloc>(() => _i55.GempaBumiMagnetudoBloc(
      get<_i13.GempaBumiRepositoryInterface>(),
      get<_i6.FirebaseCrashlytics>()));
  gh.factory<_i56.GeolocationBloc>(() => _i56.GeolocationBloc(
      geolocatorRepository: get<_i15.GeolocatorRepositoryInterface>()));
  gh.factory<_i57.HospitalProvinceBloc>(() => _i57.HospitalProvinceBloc(
      get<_i47.CovidRepositoryInterface>(), get<_i6.FirebaseCrashlytics>()));
  gh.factory<_i58.ProfileProviderInterface>(() => _i59.ProfileProvider(
      authRepository: get<_i39.AuthRepositoryInterface>(),
      firestore: get<_i7.FirebaseFirestore>()));
  gh.factory<_i60.ProfileRepositoryInterface>(() => _i61.ProfileRepository(
      profileProvider: get<_i58.ProfileProviderInterface>()));
  gh.factory<_i62.RemoteConfigServiceInterface>(() => _i63.RemoteConfigService(
      remoteConfig: get<_i9.FirebaseRemoteConfig>(),
      sharedPreferences: get<_i36.SharedPreferences>(),
      firebaseCrashlytics: get<_i6.FirebaseCrashlytics>()));
  gh.factory<_i64.ReportProviderInterface>(() => _i65.ReportProvider(
      authRepository: get<_i39.AuthRepositoryInterface>(),
      firestore: get<_i7.FirebaseFirestore>(),
      imageStorage: get<_i10.FirebaseStorage>()));
  gh.factory<_i66.ReportRepositoryInterface>(() => _i67.ReportRepository(
      reportProvider: get<_i64.ReportProviderInterface>()));
  gh.factory<_i68.UpdatePasswordBloc>(() => _i68.UpdatePasswordBloc(
      profileRepository: get<_i60.ProfileRepositoryInterface>(),
      firebaseCrashlytics: get<_i6.FirebaseCrashlytics>()));
  gh.factory<_i69.VaccinationBloc>(() => _i69.VaccinationBloc(
      get<_i47.CovidRepositoryInterface>(), get<_i6.FirebaseCrashlytics>()));
  gh.factory<_i70.AuthBloc>(() => _i70.AuthBloc(
      authRepository: get<_i39.AuthRepositoryInterface>(),
      firebaseCrashlytics: get<_i6.FirebaseCrashlytics>()));
  gh.factory<_i71.CallBloc>(() => _i71.CallBloc(
      callRepository: get<_i43.CallRepositoryInterface>(),
      firebaseCrashlytics: get<_i6.FirebaseCrashlytics>()));
  gh.factory<_i72.EditProfileBloc>(() => _i72.EditProfileBloc(
      profileRepository: get<_i60.ProfileRepositoryInterface>(),
      firebaseCrashlytics: get<_i6.FirebaseCrashlytics>()));
  gh.factory<_i73.EmergencyCallBloc>(() => _i73.EmergencyCallBloc(
      get<_i51.EmergencyCallRepositoryInterface>(),
      get<_i6.FirebaseCrashlytics>()));
  gh.factory<_i74.HomeProviderInterface>(() => _i75.HomeProvider(
      get<_i7.FirebaseFirestore>(), get<_i62.RemoteConfigServiceInterface>()));
  gh.factory<_i76.HomeReportBloc>(() => _i76.HomeReportBloc(
      get<_i66.ReportRepositoryInterface>(), get<_i6.FirebaseCrashlytics>()));
  gh.factory<_i77.HomeRepositoryInterface>(() =>
      _i78.HomeRepository(homeProvider: get<_i74.HomeProviderInterface>()));
  gh.factory<_i79.MyReportBloc>(() => _i79.MyReportBloc(
      get<_i66.ReportRepositoryInterface>(), get<_i6.FirebaseCrashlytics>()));
  gh.factory<_i80.NewsListNewBloc>(() => _i80.NewsListNewBloc(
      get<_i28.NewsRepositoryInterface>(),
      get<_i62.RemoteConfigServiceInterface>()));
  gh.factory<_i81.ProfileBloc>(() => _i81.ProfileBloc(
      profileRepository: get<_i60.ProfileRepositoryInterface>(),
      firebaseCrashlytics: get<_i6.FirebaseCrashlytics>()));
  gh.factory<_i82.ReportFormBloc>(() => _i82.ReportFormBloc(
      reportRepository: get<_i66.ReportRepositoryInterface>(),
      authRepository: get<_i39.AuthRepositoryInterface>(),
      firebaseCrashlytics: get<_i6.FirebaseCrashlytics>()));
  gh.factory<_i83.ReportListBloc>(() => _i83.ReportListBloc(
      get<_i66.ReportRepositoryInterface>(), get<_i6.FirebaseCrashlytics>()));
  gh.factory<_i84.BannerBloc>(() => _i84.BannerBloc(
      get<_i77.HomeRepositoryInterface>(), get<_i6.FirebaseCrashlytics>()));
  gh.factory<_i85.FeatureBloc>(() =>
      _i85.FeatureBloc(homeRepository: get<_i74.HomeProviderInterface>()));
  gh.factory<_i86.HomeCovidBloc>(() => _i86.HomeCovidBloc(
      get<_i77.HomeRepositoryInterface>(), get<_i6.FirebaseCrashlytics>()));
  return get;
}

class _$NativeApiService extends _i87.NativeApiService {}
