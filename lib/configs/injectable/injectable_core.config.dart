// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:cloud_firestore/cloud_firestore.dart' as _i7;
import 'package:dio/dio.dart' as _i3;
import 'package:firebase_auth/firebase_auth.dart' as _i5;
import 'package:firebase_crashlytics/firebase_crashlytics.dart' as _i6;
import 'package:firebase_messaging/firebase_messaging.dart' as _i8;
import 'package:firebase_storage/firebase_storage.dart' as _i9;
import 'package:get_it/get_it.dart' as _i1;
import 'package:google_sign_in/google_sign_in.dart' as _i16;
import 'package:injectable/injectable.dart' as _i2;

import '../../core/bloc/auth_bloc.dart' as _i60;
import '../../core/providers/auth_provider.dart' as _i35;
import '../../core/providers/auth_provider_interface.dart' as _i34;
import '../../core/repositories/auth_repository.dart' as _i37;
import '../../core/repositories/auth_repository_interface.dart' as _i36;
import '../../modules/auth/blocs/login/login_bloc.dart' as _i48;
import '../../modules/auth/blocs/register/register_bloc.dart' as _i54;
import '../../modules/auth/blocs/reset_password/reset_password_bloc.dart'
    as _i33;
import '../../modules/auth/providers/login_provider.dart' as _i22;
import '../../modules/auth/providers/login_provider_interface.dart' as _i21;
import '../../modules/auth/providers/register_provider.dart' as _i30;
import '../../modules/auth/providers/register_provider_interface.dart' as _i29;
import '../../modules/auth/repositories/login_repository.dart' as _i24;
import '../../modules/auth/repositories/login_repository_interface.dart'
    as _i23;
import '../../modules/auth/repositories/register_repository.dart' as _i32;
import '../../modules/auth/repositories/register_repository_interface.dart'
    as _i31;
import '../../modules/call/blocs/calls/call_bloc.dart' as _i61;
import '../../modules/call/providers/call_provider.dart' as _i40;
import '../../modules/call/providers/call_provider_interface.dart' as _i39;
import '../../modules/call/repositories/call_repository.dart' as _i42;
import '../../modules/call/repositories/call_repository_interface.dart' as _i41;
import '../../modules/gempa_bumi/blocs/gempa_bumi_bloc/gempa_bumi_bloc.dart'
    as _i44;
import '../../modules/gempa_bumi/blocs/gempa_bumi_last_recently_bloc/gempa_bumi_last_recently_bloc.dart'
    as _i45;
import '../../modules/gempa_bumi/blocs/gempa_bumi_magnetudo_bloc/gempa_bumi_magnetudo_bloc.dart'
    as _i46;
import '../../modules/gempa_bumi/providers/gempa_bumi_provider.dart' as _i11;
import '../../modules/gempa_bumi/providers/gempa_bumi_provider_interface.dart'
    as _i10;
import '../../modules/gempa_bumi/repositories/gempa_bumi_repository.dart'
    as _i13;
import '../../modules/gempa_bumi/repositories/gempa_bumi_repository_interface.dart'
    as _i12;
import '../../modules/home/blocs/banner/banner_bloc.dart' as _i38;
import '../../modules/home/blocs/feature/feature_bloc.dart' as _i43;
import '../../modules/home/blocs/home_report/home_report_bloc.dart' as _i63;
import '../../modules/home/providers/home_provider.dart' as _i18;
import '../../modules/home/providers/home_provider_interface.dart' as _i17;
import '../../modules/home/repositories/home_repository.dart' as _i20;
import '../../modules/home/repositories/home_repository_interface.dart' as _i19;
import '../../modules/news/blocs/news_list_new/news_list_new_bloc.dart' as _i49;
import '../../modules/news/providers/news_provider.dart' as _i26;
import '../../modules/news/providers/news_provider_interface.dart' as _i25;
import '../../modules/news/repositories/news_repository.dart' as _i28;
import '../../modules/news/repositories/news_repository_interface.dart' as _i27;
import '../../modules/profile/blocs/edit_profile/edit_profile_bloc.dart'
    as _i62;
import '../../modules/profile/blocs/profile/profile_bloc.dart' as _i65;
import '../../modules/profile/blocs/update_password/update_password_bloc.dart'
    as _i59;
import '../../modules/profile/models/environment_model.dart' as _i4;
import '../../modules/profile/providers/profile_provider.dart' as _i51;
import '../../modules/profile/providers/profile_provider_interface.dart'
    as _i50;
import '../../modules/profile/repositories/profile_repository.dart' as _i53;
import '../../modules/profile/repositories/profile_repository_interface.dart'
    as _i52;
import '../../modules/report/blocs/geolocation/geolocation_bloc.dart' as _i47;
import '../../modules/report/blocs/my_report/my_report_bloc.dart' as _i64;
import '../../modules/report/blocs/report_form/report_form_bloc.dart' as _i66;
import '../../modules/report/blocs/report_list_bloc/report_list_bloc.dart'
    as _i67;
import '../../modules/report/providers/report_provider.dart' as _i56;
import '../../modules/report/providers/report_provider_interface.dart' as _i55;
import '../../modules/report/repositories/report_repository.dart' as _i58;
import '../../modules/report/repositories/report_repository_interface.dart'
    as _i57;
import '../../services/geolocator/geolocator_repository.dart' as _i15;
import '../../services/geolocator/geolocator_repository_interface.dart' as _i14;
import '../../services/native_api_service.dart'
    as _i68; // ignore_for_file: unnecessary_lambdas

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
  gh.lazySingleton<_i9.FirebaseStorage>(() => nativeApiService.firebaseStorage);
  gh.factory<_i10.GempaBumiProviderInterface>(
      () => _i11.GempaBumiProvider(get<_i3.Dio>()));
  gh.factory<_i12.GempaBumiRepositoryInterface>(
      () => _i13.GempaBumiRepository(get<_i10.GempaBumiProviderInterface>()));
  gh.factory<_i14.GeolocatorRepositoryInterface>(
      () => _i15.GeolocatorRepository());
  gh.factory<_i16.GoogleSignIn>(() => nativeApiService.googleSignIn);
  gh.factory<_i17.HomeProviderInterface>(
      () => _i18.HomeProvider(get<_i7.FirebaseFirestore>()));
  gh.factory<_i19.HomeRepositoryInterface>(() =>
      _i20.HomeRepository(homeProvider: get<_i17.HomeProviderInterface>()));
  gh.factory<_i21.LoginProviderInterface>(() => _i22.LoginProvider(
      firebaseAuth: get<_i5.FirebaseAuth>(),
      googleSignIn: get<_i16.GoogleSignIn>(),
      firebaseFirestore: get<_i7.FirebaseFirestore>()));
  gh.factory<_i23.LoginRepositoryInterface>(
      () => _i24.LoginRepository(get<_i21.LoginProviderInterface>()));
  gh.factory<_i25.NewsProviderInterface>(
      () => _i26.NewsProvider(get<_i3.Dio>()));
  gh.factory<_i27.NewsRepositoryInterface>(
      () => _i28.NewsRepository(get<_i25.NewsProviderInterface>()));
  gh.factory<_i29.RegisterProviderInterface>(() => _i30.RegisterProvider(
      firebaseAuth: get<_i5.FirebaseAuth>(),
      firebaseFirestore: get<_i7.FirebaseFirestore>()));
  gh.factory<_i31.RegisterRepositoryInterface>(
      () => _i32.RegisterRepository(get<_i29.RegisterProviderInterface>()));
  gh.factory<_i33.ResetPasswordBloc>(() => _i33.ResetPasswordBloc(
      registerRepository: get<_i31.RegisterRepositoryInterface>(),
      firebaseCrashlytics: get<_i6.FirebaseCrashlytics>()));
  gh.factory<_i34.AuthProviderInterface>(() =>
      _i35.AuthProvider(get<_i5.FirebaseAuth>(), get<_i16.GoogleSignIn>()));
  gh.factory<_i36.AuthRepositoryInterface>(
      () => _i37.AuthRepository(get<_i34.AuthProviderInterface>()));
  gh.factory<_i38.BannerBloc>(() => _i38.BannerBloc(
      get<_i19.HomeRepositoryInterface>(), get<_i6.FirebaseCrashlytics>()));
  gh.factory<_i39.CallProviderInterface>(
      () => _i40.CallProvider(get<_i7.FirebaseFirestore>()));
  gh.factory<_i41.CallRepositoryInterface>(() =>
      _i42.CallRepository(callProvider: get<_i39.CallProviderInterface>()));
  gh.factory<_i43.FeatureBloc>(() =>
      _i43.FeatureBloc(homeRepository: get<_i17.HomeProviderInterface>()));
  gh.factory<_i44.GempaBumiBloc>(() => _i44.GempaBumiBloc(
      get<_i12.GempaBumiRepositoryInterface>(),
      get<_i6.FirebaseCrashlytics>()));
  gh.factory<_i45.GempaBumiLastRecentlyBloc>(() =>
      _i45.GempaBumiLastRecentlyBloc(get<_i12.GempaBumiRepositoryInterface>(),
          get<_i6.FirebaseCrashlytics>()));
  gh.factory<_i46.GempaBumiMagnetudoBloc>(() => _i46.GempaBumiMagnetudoBloc(
      get<_i12.GempaBumiRepositoryInterface>(),
      get<_i6.FirebaseCrashlytics>()));
  gh.factory<_i47.GeolocationBloc>(() => _i47.GeolocationBloc(
      geolocatorRepository: get<_i14.GeolocatorRepositoryInterface>()));
  gh.factory<_i48.LoginBloc>(() => _i48.LoginBloc(
      loginRepository: get<_i23.LoginRepositoryInterface>(),
      authRepository: get<_i36.AuthRepositoryInterface>(),
      registerRepository: get<_i31.RegisterRepositoryInterface>(),
      firebaseCrashlytics: get<_i6.FirebaseCrashlytics>()));
  gh.factory<_i49.NewsListNewBloc>(
      () => _i49.NewsListNewBloc(get<_i27.NewsRepositoryInterface>()));
  gh.factory<_i50.ProfileProviderInterface>(() => _i51.ProfileProvider(
      authRepository: get<_i36.AuthRepositoryInterface>(),
      firestore: get<_i7.FirebaseFirestore>()));
  gh.factory<_i52.ProfileRepositoryInterface>(() => _i53.ProfileRepository(
      profileProvider: get<_i50.ProfileProviderInterface>()));
  gh.factory<_i54.RegisterBloc>(() => _i54.RegisterBloc(
      registerRepository: get<_i31.RegisterRepositoryInterface>(),
      authRepository: get<_i36.AuthRepositoryInterface>(),
      firebaseCrashlytics: get<_i6.FirebaseCrashlytics>()));
  gh.factory<_i55.ReportProviderInterface>(() => _i56.ReportProvider(
      authRepository: get<_i36.AuthRepositoryInterface>(),
      firestore: get<_i7.FirebaseFirestore>(),
      imageStorage: get<_i9.FirebaseStorage>()));
  gh.factory<_i57.ReportRepositoryInterface>(() => _i58.ReportRepository(
      reportProvider: get<_i55.ReportProviderInterface>()));
  gh.factory<_i59.UpdatePasswordBloc>(() => _i59.UpdatePasswordBloc(
      profileRepository: get<_i52.ProfileRepositoryInterface>(),
      firebaseCrashlytics: get<_i6.FirebaseCrashlytics>()));
  gh.factory<_i60.AuthBloc>(() => _i60.AuthBloc(
      authRepository: get<_i36.AuthRepositoryInterface>(),
      firebaseCrashlytics: get<_i6.FirebaseCrashlytics>()));
  gh.factory<_i61.CallBloc>(() => _i61.CallBloc(
      callRepository: get<_i41.CallRepositoryInterface>(),
      firebaseCrashlytics: get<_i6.FirebaseCrashlytics>()));
  gh.factory<_i62.EditProfileBloc>(() => _i62.EditProfileBloc(
      profileRepository: get<_i52.ProfileRepositoryInterface>(),
      firebaseCrashlytics: get<_i6.FirebaseCrashlytics>()));
  gh.factory<_i63.HomeReportBloc>(() => _i63.HomeReportBloc(
      get<_i57.ReportRepositoryInterface>(), get<_i6.FirebaseCrashlytics>()));
  gh.factory<_i64.MyReportBloc>(() => _i64.MyReportBloc(
      get<_i57.ReportRepositoryInterface>(), get<_i6.FirebaseCrashlytics>()));
  gh.factory<_i65.ProfileBloc>(() => _i65.ProfileBloc(
      profileRepository: get<_i52.ProfileRepositoryInterface>(),
      firebaseCrashlytics: get<_i6.FirebaseCrashlytics>()));
  gh.factory<_i66.ReportFormBloc>(() => _i66.ReportFormBloc(
      reportRepository: get<_i57.ReportRepositoryInterface>(),
      authRepository: get<_i36.AuthRepositoryInterface>(),
      firebaseCrashlytics: get<_i6.FirebaseCrashlytics>()));
  gh.factory<_i67.ReportListBloc>(() => _i67.ReportListBloc(
      get<_i57.ReportRepositoryInterface>(), get<_i6.FirebaseCrashlytics>()));
  return get;
}

class _$NativeApiService extends _i68.NativeApiService {}
