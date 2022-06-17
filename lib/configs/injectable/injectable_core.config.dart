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
import 'package:shared_preferences/shared_preferences.dart' as _i32;

import '../../core/bloc/auth_bloc.dart' as _i71;
import '../../core/providers/auth_provider.dart' as _i34;
import '../../core/providers/auth_provider_interface.dart' as _i33;
import '../../core/repositories/auth_repository.dart' as _i36;
import '../../core/repositories/auth_repository_interface.dart' as _i35;
import '../../modules/auth/blocs/login/login_bloc.dart' as _i55;
import '../../modules/auth/blocs/register/register_bloc.dart' as _i60;
import '../../modules/auth/blocs/reset_password/reset_password_bloc.dart'
    as _i31;
import '../../modules/auth/providers/login_provider.dart' as _i20;
import '../../modules/auth/providers/login_provider_interface.dart' as _i19;
import '../../modules/auth/providers/register_provider.dart' as _i28;
import '../../modules/auth/providers/register_provider_interface.dart' as _i27;
import '../../modules/auth/repositories/login_repository.dart' as _i22;
import '../../modules/auth/repositories/login_repository_interface.dart'
    as _i21;
import '../../modules/auth/repositories/register_repository.dart' as _i30;
import '../../modules/auth/repositories/register_repository_interface.dart'
    as _i29;
import '../../modules/call/blocs/calls/call_bloc.dart' as _i72;
import '../../modules/call/providers/call_provider.dart' as _i38;
import '../../modules/call/providers/call_provider_interface.dart' as _i37;
import '../../modules/call/repositories/call_repository.dart' as _i40;
import '../../modules/call/repositories/call_repository_interface.dart' as _i39;
import '../../modules/covid/blocs/hospital_cities/hospital_cities_bloc.dart'
    as _i18;
import '../../modules/covid/blocs/hospital_province/hospital_province_bloc.dart'
    as _i54;
import '../../modules/covid/blocs/vaccination/vaccination_bloc.dart' as _i70;
import '../../modules/covid/providers/covid_provider.dart' as _i42;
import '../../modules/covid/providers/covid_provider_interface.dart' as _i41;
import '../../modules/covid/repositories/covid_repository.dart' as _i44;
import '../../modules/covid/repositories/covid_repository_interface.dart'
    as _i43;
import '../../modules/emergency/blocs/emergency_call/emergency_call_bloc.dart'
    as _i73;
import '../../modules/emergency/blocs/emergency_call_list/emergency_call_list_bloc.dart'
    as _i74;
import '../../modules/emergency/blocs/emergency_call_stream/emergency_call_stream_bloc.dart'
    as _i49;
import '../../modules/emergency/blocs/emergency_validate_phone_number/emergency_validate_phone_number_bloc.dart'
    as _i75;
import '../../modules/emergency/providers/emergency_call_provider.dart' as _i46;
import '../../modules/emergency/providers/emergency_call_provider_interface.dart'
    as _i45;
import '../../modules/emergency/repositories/emergency_call_repository.dart'
    as _i48;
import '../../modules/emergency/repositories/emergency_call_repository_interface.dart'
    as _i47;
import '../../modules/gempa_bumi/blocs/gempa_bumi_bloc/gempa_bumi_bloc.dart'
    as _i50;
import '../../modules/gempa_bumi/blocs/gempa_bumi_last_recently_bloc/gempa_bumi_last_recently_bloc.dart'
    as _i51;
import '../../modules/gempa_bumi/blocs/gempa_bumi_magnetudo_bloc/gempa_bumi_magnetudo_bloc.dart'
    as _i52;
import '../../modules/gempa_bumi/providers/gempa_bumi_provider.dart' as _i12;
import '../../modules/gempa_bumi/providers/gempa_bumi_provider_interface.dart'
    as _i11;
import '../../modules/gempa_bumi/repositories/gempa_bumi_repository.dart'
    as _i14;
import '../../modules/gempa_bumi/repositories/gempa_bumi_repository_interface.dart'
    as _i13;
import '../../modules/home/blocs/banner/banner_bloc.dart' as _i94;
import '../../modules/home/blocs/feature/feature_bloc.dart' as _i95;
import '../../modules/home/blocs/home_covid/home_covid_bloc.dart' as _i96;
import '../../modules/home/blocs/home_report/home_report_bloc.dart' as _i78;
import '../../modules/home/blocs/home_statistic_chart/home_statistic_chart_bloc.dart'
    as _i81;
import '../../modules/home/blocs/home_statistic_data/home_statistic_data_bloc.dart'
    as _i82;
import '../../modules/home/providers/home_provider.dart' as _i77;
import '../../modules/home/providers/home_provider_interface.dart' as _i76;
import '../../modules/home/repositories/home_repository.dart' as _i80;
import '../../modules/home/repositories/home_repository_interface.dart' as _i79;
import '../../modules/news/blocs/news_list_new/news_list_new_bloc.dart' as _i83;
import '../../modules/news/providers/news_provider.dart' as _i24;
import '../../modules/news/providers/news_provider_interface.dart' as _i23;
import '../../modules/news/repositories/news_repository.dart' as _i26;
import '../../modules/news/repositories/news_repository_interface.dart' as _i25;
import '../../modules/profile/blocs/profile/profile_bloc.dart' as _i84;
import '../../modules/profile/blocs/profile_edit/profile_edit_bloc.dart'
    as _i85;
import '../../modules/profile/blocs/profile_picture_update/profile_picture_update_bloc.dart'
    as _i86;
import '../../modules/profile/blocs/update_password/update_password_bloc.dart'
    as _i69;
import '../../modules/profile/models/environment_model.dart' as _i4;
import '../../modules/profile/providers/profile_provider.dart' as _i57;
import '../../modules/profile/providers/profile_provider_interface.dart'
    as _i56;
import '../../modules/profile/repositories/profile_repository.dart' as _i59;
import '../../modules/profile/repositories/profile_repository_interface.dart'
    as _i58;
import '../../modules/report/blocs/geolocation/geolocation_bloc.dart' as _i53;
import '../../modules/report/blocs/report_bookmark/report_bookmark_bloc.dart'
    as _i87;
import '../../modules/report/blocs/report_bookmark_user/report_bookmark_user_bloc.dart'
    as _i88;
import '../../modules/report/blocs/report_category/report_category_bloc.dart'
    as _i89;
import '../../modules/report/blocs/report_detail/report_detail_bloc.dart'
    as _i90;
import '../../modules/report/blocs/report_export/report_export_bloc.dart'
    as _i91;
import '../../modules/report/blocs/report_form/report_form_bloc.dart' as _i92;
import '../../modules/report/blocs/report_list_bloc/report_list_bloc.dart'
    as _i93;
import '../../modules/report/blocs/report_update_form/report_update_form_bloc.dart'
    as _i67;
import '../../modules/report/blocs/report_user/report_user_bloc.dart' as _i68;
import '../../modules/report/providers/report_provider.dart' as _i64;
import '../../modules/report/providers/report_provider_interface.dart' as _i63;
import '../../modules/report/repositories/report_repository.dart' as _i66;
import '../../modules/report/repositories/report_repository_interface.dart'
    as _i65;
import '../../services/geolocator/geolocator_repository.dart' as _i16;
import '../../services/geolocator/geolocator_repository_interface.dart' as _i15;
import '../../services/native_api_service.dart' as _i97;
import '../../services/remote_config_service/remote_config_service.dart'
    as _i62;
import '../../services/remote_config_service/remote_config_service_interface.dart'
    as _i61; // ignore_for_file: unnecessary_lambdas

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
  gh.factory<_i19.LoginProviderInterface>(() => _i20.LoginProvider(
      firebaseAuth: get<_i5.FirebaseAuth>(),
      googleSignIn: get<_i17.GoogleSignIn>(),
      firebaseFirestore: get<_i7.FirebaseFirestore>()));
  gh.factory<_i21.LoginRepositoryInterface>(
      () => _i22.LoginRepository(get<_i19.LoginProviderInterface>()));
  gh.factory<_i23.NewsProviderInterface>(
      () => _i24.NewsProvider(get<_i3.Dio>()));
  gh.factory<_i25.NewsRepositoryInterface>(
      () => _i26.NewsRepository(get<_i23.NewsProviderInterface>()));
  gh.factory<_i27.RegisterProviderInterface>(() => _i28.RegisterProvider(
      firebaseAuth: get<_i5.FirebaseAuth>(),
      firebaseFirestore: get<_i7.FirebaseFirestore>()));
  gh.factory<_i29.RegisterRepositoryInterface>(
      () => _i30.RegisterRepository(get<_i27.RegisterProviderInterface>()));
  gh.factory<_i31.ResetPasswordBloc>(() => _i31.ResetPasswordBloc(
      registerRepository: get<_i29.RegisterRepositoryInterface>(),
      firebaseCrashlytics: get<_i6.FirebaseCrashlytics>()));
  await gh.lazySingletonAsync<_i32.SharedPreferences>(
      () => nativeApiService.prefs,
      preResolve: true);
  gh.factory<_i33.AuthProviderInterface>(() => _i34.AuthProvider(
      get<_i5.FirebaseAuth>(),
      get<_i17.GoogleSignIn>(),
      get<_i7.FirebaseFirestore>()));
  gh.factory<_i35.AuthRepositoryInterface>(
      () => _i36.AuthRepository(get<_i33.AuthProviderInterface>()));
  gh.factory<_i37.CallProviderInterface>(
      () => _i38.CallProvider(get<_i7.FirebaseFirestore>()));
  gh.factory<_i39.CallRepositoryInterface>(() =>
      _i40.CallRepository(callProvider: get<_i37.CallProviderInterface>()));
  gh.factory<_i41.CovidProviderInterface>(
      () => _i42.CovidProvider(get<_i3.Dio>()));
  gh.factory<_i43.CovidRepositoryInterface>(
      () => _i44.CovidRepository(get<_i41.CovidProviderInterface>()));
  gh.factory<_i45.EmergencyCallProviderInterface>(() =>
      _i46.EmergencyCallProvider(
          get<_i7.FirebaseFirestore>(), get<_i35.AuthRepositoryInterface>()));
  gh.factory<_i47.EmergencyCallRepositoryInterface>(() =>
      _i48.EmergencyCallRepository(get<_i45.EmergencyCallProviderInterface>()));
  gh.factory<_i49.EmergencyCallStreamBloc>(() => _i49.EmergencyCallStreamBloc(
      get<_i47.EmergencyCallRepositoryInterface>(),
      get<_i6.FirebaseCrashlytics>()));
  gh.factory<_i50.GempaBumiBloc>(() => _i50.GempaBumiBloc(
      get<_i13.GempaBumiRepositoryInterface>(),
      get<_i6.FirebaseCrashlytics>()));
  gh.factory<_i51.GempaBumiLastRecentlyBloc>(() =>
      _i51.GempaBumiLastRecentlyBloc(get<_i13.GempaBumiRepositoryInterface>(),
          get<_i6.FirebaseCrashlytics>()));
  gh.factory<_i52.GempaBumiMagnetudoBloc>(() => _i52.GempaBumiMagnetudoBloc(
      get<_i13.GempaBumiRepositoryInterface>(),
      get<_i6.FirebaseCrashlytics>()));
  gh.factory<_i53.GeolocationBloc>(() => _i53.GeolocationBloc(
      geolocatorRepository: get<_i15.GeolocatorRepositoryInterface>()));
  gh.factory<_i54.HospitalProvinceBloc>(() => _i54.HospitalProvinceBloc(
      get<_i43.CovidRepositoryInterface>(), get<_i6.FirebaseCrashlytics>()));
  gh.factory<_i55.LoginBloc>(() => _i55.LoginBloc(
      loginRepository: get<_i21.LoginRepositoryInterface>(),
      authRepository: get<_i35.AuthRepositoryInterface>(),
      registerRepository: get<_i29.RegisterRepositoryInterface>(),
      firebaseCrashlytics: get<_i6.FirebaseCrashlytics>()));
  gh.factory<_i56.ProfileProviderInterface>(() => _i57.ProfileProvider(
      authRepository: get<_i35.AuthRepositoryInterface>(),
      firestore: get<_i7.FirebaseFirestore>(),
      imageStorage: get<_i10.FirebaseStorage>()));
  gh.factory<_i58.ProfileRepositoryInterface>(() => _i59.ProfileRepository(
      profileProvider: get<_i56.ProfileProviderInterface>()));
  gh.factory<_i60.RegisterBloc>(() => _i60.RegisterBloc(
      registerRepository: get<_i29.RegisterRepositoryInterface>(),
      authRepository: get<_i35.AuthRepositoryInterface>(),
      firebaseCrashlytics: get<_i6.FirebaseCrashlytics>()));
  gh.factory<_i61.RemoteConfigServiceInterface>(() => _i62.RemoteConfigService(
      remoteConfig: get<_i9.FirebaseRemoteConfig>(),
      sharedPreferences: get<_i32.SharedPreferences>(),
      firebaseCrashlytics: get<_i6.FirebaseCrashlytics>()));
  gh.factory<_i63.ReportProviderInterface>(() => _i64.ReportProvider(
      authRepository: get<_i35.AuthRepositoryInterface>(),
      firestore: get<_i7.FirebaseFirestore>(),
      imageStorage: get<_i10.FirebaseStorage>()));
  gh.factory<_i65.ReportRepositoryInterface>(() => _i66.ReportRepository(
      reportProvider: get<_i63.ReportProviderInterface>()));
  gh.factory<_i67.ReportUpdateFormBloc>(() => _i67.ReportUpdateFormBloc(
      get<_i65.ReportRepositoryInterface>(), get<_i6.FirebaseCrashlytics>()));
  gh.factory<_i68.ReportUserBloc>(() => _i68.ReportUserBloc(
      get<_i65.ReportRepositoryInterface>(), get<_i6.FirebaseCrashlytics>()));
  gh.factory<_i69.UpdatePasswordBloc>(() => _i69.UpdatePasswordBloc(
      profileRepository: get<_i58.ProfileRepositoryInterface>(),
      firebaseCrashlytics: get<_i6.FirebaseCrashlytics>()));
  gh.factory<_i70.VaccinationBloc>(() => _i70.VaccinationBloc(
      get<_i43.CovidRepositoryInterface>(), get<_i6.FirebaseCrashlytics>()));
  gh.factory<_i71.AuthBloc>(() => _i71.AuthBloc(
      authRepository: get<_i35.AuthRepositoryInterface>(),
      firebaseCrashlytics: get<_i6.FirebaseCrashlytics>()));
  gh.factory<_i72.CallBloc>(() => _i72.CallBloc(
      callRepository: get<_i39.CallRepositoryInterface>(),
      firebaseCrashlytics: get<_i6.FirebaseCrashlytics>()));
  gh.factory<_i73.EmergencyCallBloc>(() => _i73.EmergencyCallBloc(
      get<_i47.EmergencyCallRepositoryInterface>(),
      get<_i6.FirebaseCrashlytics>(),
      get<_i58.ProfileRepositoryInterface>()));
  gh.factory<_i74.EmergencyCallListBloc>(() => _i74.EmergencyCallListBloc(
      get<_i47.EmergencyCallRepositoryInterface>(),
      get<_i6.FirebaseCrashlytics>()));
  gh.factory<_i75.EmergencyValidatePhoneNumberBloc>(() =>
      _i75.EmergencyValidatePhoneNumberBloc(
          get<_i58.ProfileRepositoryInterface>(),
          get<_i6.FirebaseCrashlytics>()));
  gh.factory<_i76.HomeProviderInterface>(() => _i77.HomeProvider(
      get<_i7.FirebaseFirestore>(), get<_i61.RemoteConfigServiceInterface>()));
  gh.factory<_i78.HomeReportBloc>(() => _i78.HomeReportBloc(
      get<_i65.ReportRepositoryInterface>(), get<_i6.FirebaseCrashlytics>()));
  gh.factory<_i79.HomeRepositoryInterface>(() =>
      _i80.HomeRepository(homeProvider: get<_i76.HomeProviderInterface>()));
  gh.factory<_i81.HomeStatisticChartBloc>(() => _i81.HomeStatisticChartBloc(
      get<_i79.HomeRepositoryInterface>(), get<_i6.FirebaseCrashlytics>()));
  gh.factory<_i82.HomeStatisticDataBloc>(() => _i82.HomeStatisticDataBloc(
      get<_i79.HomeRepositoryInterface>(), get<_i6.FirebaseCrashlytics>()));
  gh.factory<_i83.NewsListNewBloc>(() => _i83.NewsListNewBloc(
      get<_i25.NewsRepositoryInterface>(),
      get<_i61.RemoteConfigServiceInterface>()));
  gh.factory<_i84.ProfileBloc>(() => _i84.ProfileBloc(
      profileRepository: get<_i58.ProfileRepositoryInterface>(),
      firebaseCrashlytics: get<_i6.FirebaseCrashlytics>()));
  gh.factory<_i85.ProfileEditBloc>(() => _i85.ProfileEditBloc(
      profileRepository: get<_i58.ProfileRepositoryInterface>(),
      firebaseCrashlytics: get<_i6.FirebaseCrashlytics>()));
  gh.factory<_i86.ProfilePictureUpdateBloc>(() => _i86.ProfilePictureUpdateBloc(
      get<_i58.ProfileRepositoryInterface>(), get<_i6.FirebaseCrashlytics>()));
  gh.factory<_i87.ReportBookmarkBloc>(() => _i87.ReportBookmarkBloc(
      get<_i65.ReportRepositoryInterface>(), get<_i6.FirebaseCrashlytics>()));
  gh.factory<_i88.ReportBookmarkUserBloc>(() => _i88.ReportBookmarkUserBloc(
      get<_i65.ReportRepositoryInterface>(), get<_i6.FirebaseCrashlytics>()));
  gh.factory<_i89.ReportCategoryBloc>(() => _i89.ReportCategoryBloc(
      get<_i65.ReportRepositoryInterface>(), get<_i6.FirebaseCrashlytics>()));
  gh.factory<_i90.ReportDetailBloc>(() => _i90.ReportDetailBloc(
      get<_i65.ReportRepositoryInterface>(), get<_i6.FirebaseCrashlytics>()));
  gh.factory<_i91.ReportExportBloc>(() => _i91.ReportExportBloc(
      get<_i65.ReportRepositoryInterface>(), get<_i6.FirebaseCrashlytics>()));
  gh.factory<_i92.ReportFormBloc>(() => _i92.ReportFormBloc(
      reportRepository: get<_i65.ReportRepositoryInterface>(),
      authRepository: get<_i35.AuthRepositoryInterface>(),
      firebaseCrashlytics: get<_i6.FirebaseCrashlytics>()));
  gh.factory<_i93.ReportListBloc>(() => _i93.ReportListBloc(
      get<_i65.ReportRepositoryInterface>(), get<_i6.FirebaseCrashlytics>()));
  gh.factory<_i94.BannerBloc>(() => _i94.BannerBloc(
      get<_i79.HomeRepositoryInterface>(), get<_i6.FirebaseCrashlytics>()));
  gh.factory<_i95.FeatureBloc>(() =>
      _i95.FeatureBloc(homeRepository: get<_i76.HomeProviderInterface>()));
  gh.factory<_i96.HomeCovidBloc>(() => _i96.HomeCovidBloc(
      get<_i79.HomeRepositoryInterface>(), get<_i6.FirebaseCrashlytics>()));
  return get;
}

class _$NativeApiService extends _i97.NativeApiService {}
