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

import '../../core/bloc/auth_bloc.dart' as _i58;
import '../../core/providers/auth_provider.dart' as _i35;
import '../../core/providers/auth_provider_interface.dart' as _i34;
import '../../core/repositories/auth_repository.dart' as _i37;
import '../../core/repositories/auth_repository_interface.dart' as _i36;
import '../../modules/auth/blocs/login/login_bloc.dart' as _i46;
import '../../modules/auth/blocs/register/register_bloc.dart' as _i52;
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
import '../../modules/call/blocs/calls/call_bloc.dart' as _i59;
import '../../modules/call/providers/call_provider.dart' as _i39;
import '../../modules/call/providers/call_provider_interface.dart' as _i38;
import '../../modules/call/repositories/call_repository.dart' as _i41;
import '../../modules/call/repositories/call_repository_interface.dart' as _i40;
import '../../modules/gempa_bumi/blocs/gempa_bumi_bloc/gempa_bumi_bloc.dart'
    as _i43;
import '../../modules/gempa_bumi/blocs/gempa_bumi_last_recently_bloc/gempa_bumi_last_recently_bloc.dart'
    as _i44;
import '../../modules/gempa_bumi/providers/gempa_bumi_provider.dart' as _i11;
import '../../modules/gempa_bumi/providers/gempa_bumi_provider_interface.dart'
    as _i10;
import '../../modules/gempa_bumi/repositories/gempa_bumi_repository.dart'
    as _i13;
import '../../modules/gempa_bumi/repositories/gempa_bumi_repository_interface.dart'
    as _i12;
import '../../modules/home/blocs/feature/feature_bloc.dart' as _i42;
import '../../modules/home/providers/home_provider.dart' as _i18;
import '../../modules/home/providers/home_provider_interface.dart' as _i17;
import '../../modules/home/repositories/home_repository.dart' as _i20;
import '../../modules/home/repositories/home_repository_interface.dart' as _i19;
import '../../modules/news/blocs/news_list_new/news_list_new_bloc.dart' as _i47;
import '../../modules/news/providers/news_provider.dart' as _i26;
import '../../modules/news/providers/news_provider_interface.dart' as _i25;
import '../../modules/news/repositories/news_repository.dart' as _i28;
import '../../modules/news/repositories/news_repository_interface.dart' as _i27;
import '../../modules/profile/blocs/edit_profile/edit_profile_bloc.dart'
    as _i60;
import '../../modules/profile/blocs/profile/profile_bloc.dart' as _i62;
import '../../modules/profile/blocs/update_password/update_password_bloc.dart'
    as _i57;
import '../../modules/profile/models/environment_model.dart' as _i4;
import '../../modules/profile/providers/profile_provider.dart' as _i49;
import '../../modules/profile/providers/profile_provider_interface.dart'
    as _i48;
import '../../modules/profile/repositories/profile_repository.dart' as _i51;
import '../../modules/profile/repositories/profile_repository_interface.dart'
    as _i50;
import '../../modules/report/blocs/geolocation/geolocation_bloc.dart' as _i45;
import '../../modules/report/blocs/my_report/my_report_bloc.dart' as _i61;
import '../../modules/report/blocs/report_form/report_form_bloc.dart' as _i63;
import '../../modules/report/blocs/report_list_bloc/report_list_bloc.dart'
    as _i64;
import '../../modules/report/providers/report_provider.dart' as _i54;
import '../../modules/report/providers/report_provider_interface.dart' as _i53;
import '../../modules/report/repositories/report_repository.dart' as _i56;
import '../../modules/report/repositories/report_repository_interface.dart'
    as _i55;
import '../../services/geolocator/geolocator_repository.dart' as _i15;
import '../../services/geolocator/geolocator_repository_interface.dart' as _i14;
import '../../services/native_api_service.dart'
    as _i65; // ignore_for_file: unnecessary_lambdas

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
  gh.factory<_i38.CallProviderInterface>(
      () => _i39.CallProvider(get<_i7.FirebaseFirestore>()));
  gh.factory<_i40.CallRepositoryInterface>(() =>
      _i41.CallRepository(callProvider: get<_i38.CallProviderInterface>()));
  gh.factory<_i42.FeatureBloc>(() =>
      _i42.FeatureBloc(homeRepository: get<_i17.HomeProviderInterface>()));
  gh.factory<_i43.GempaBumiBloc>(() => _i43.GempaBumiBloc(
      get<_i12.GempaBumiRepositoryInterface>(),
      get<_i6.FirebaseCrashlytics>()));
  gh.factory<_i44.GempaBumiLastRecentlyBloc>(() =>
      _i44.GempaBumiLastRecentlyBloc(get<_i12.GempaBumiRepositoryInterface>(),
          get<_i6.FirebaseCrashlytics>()));
  gh.factory<_i45.GeolocationBloc>(() => _i45.GeolocationBloc(
      geolocatorRepository: get<_i14.GeolocatorRepositoryInterface>()));
  gh.factory<_i46.LoginBloc>(() => _i46.LoginBloc(
      loginRepository: get<_i23.LoginRepositoryInterface>(),
      authRepository: get<_i36.AuthRepositoryInterface>(),
      registerRepository: get<_i31.RegisterRepositoryInterface>(),
      firebaseCrashlytics: get<_i6.FirebaseCrashlytics>()));
  gh.factory<_i47.NewsListNewBloc>(
      () => _i47.NewsListNewBloc(get<_i27.NewsRepositoryInterface>()));
  gh.factory<_i48.ProfileProviderInterface>(() => _i49.ProfileProvider(
      authRepository: get<_i36.AuthRepositoryInterface>(),
      firestore: get<_i7.FirebaseFirestore>()));
  gh.factory<_i50.ProfileRepositoryInterface>(() => _i51.ProfileRepository(
      profileProvider: get<_i48.ProfileProviderInterface>()));
  gh.factory<_i52.RegisterBloc>(() => _i52.RegisterBloc(
      registerRepository: get<_i31.RegisterRepositoryInterface>(),
      authRepository: get<_i36.AuthRepositoryInterface>(),
      firebaseCrashlytics: get<_i6.FirebaseCrashlytics>()));
  gh.factory<_i53.ReportProviderInterface>(() => _i54.ReportProvider(
      authRepository: get<_i36.AuthRepositoryInterface>(),
      firestore: get<_i7.FirebaseFirestore>(),
      imageStorage: get<_i9.FirebaseStorage>()));
  gh.factory<_i55.ReportRepositoryInterface>(() => _i56.ReportRepository(
      reportProvider: get<_i53.ReportProviderInterface>()));
  gh.factory<_i57.UpdatePasswordBloc>(() => _i57.UpdatePasswordBloc(
      profileRepository: get<_i50.ProfileRepositoryInterface>(),
      firebaseCrashlytics: get<_i6.FirebaseCrashlytics>()));
  gh.factory<_i58.AuthBloc>(() => _i58.AuthBloc(
      authRepository: get<_i36.AuthRepositoryInterface>(),
      firebaseCrashlytics: get<_i6.FirebaseCrashlytics>()));
  gh.factory<_i59.CallBloc>(() => _i59.CallBloc(
      callRepository: get<_i40.CallRepositoryInterface>(),
      firebaseCrashlytics: get<_i6.FirebaseCrashlytics>()));
  gh.factory<_i60.EditProfileBloc>(() => _i60.EditProfileBloc(
      profileRepository: get<_i50.ProfileRepositoryInterface>(),
      firebaseCrashlytics: get<_i6.FirebaseCrashlytics>()));
  gh.factory<_i61.MyReportBloc>(() => _i61.MyReportBloc(
      get<_i55.ReportRepositoryInterface>(), get<_i6.FirebaseCrashlytics>()));
  gh.factory<_i62.ProfileBloc>(() => _i62.ProfileBloc(
      profileRepository: get<_i50.ProfileRepositoryInterface>(),
      firebaseCrashlytics: get<_i6.FirebaseCrashlytics>()));
  gh.factory<_i63.ReportFormBloc>(() => _i63.ReportFormBloc(
      reportRepository: get<_i55.ReportRepositoryInterface>(),
      authRepository: get<_i36.AuthRepositoryInterface>(),
      firebaseCrashlytics: get<_i6.FirebaseCrashlytics>()));
  gh.factory<_i64.ReportListBloc>(() => _i64.ReportListBloc(
      get<_i55.ReportRepositoryInterface>(), get<_i6.FirebaseCrashlytics>()));
  return get;
}

class _$NativeApiService extends _i65.NativeApiService {}
