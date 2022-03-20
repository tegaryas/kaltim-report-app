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
import 'package:google_sign_in/google_sign_in.dart' as _i12;
import 'package:injectable/injectable.dart' as _i2;

import '../../core/bloc/auth_bloc.dart' as _i53;
import '../../core/providers/auth_provider.dart' as _i32;
import '../../core/providers/auth_provider_interface.dart' as _i31;
import '../../core/repositories/auth_repository.dart' as _i34;
import '../../core/repositories/auth_repository_interface.dart' as _i33;
import '../../modules/auth/blocs/login/login_bloc.dart' as _i41;
import '../../modules/auth/blocs/register/register_bloc.dart' as _i47;
import '../../modules/auth/blocs/reset_password/reset_password_bloc.dart'
    as _i30;
import '../../modules/auth/providers/login_provider.dart' as _i18;
import '../../modules/auth/providers/login_provider_interface.dart' as _i17;
import '../../modules/auth/providers/register_provider.dart' as _i26;
import '../../modules/auth/providers/register_provider_interface.dart' as _i25;
import '../../modules/auth/repositories/login_repository.dart' as _i20;
import '../../modules/auth/repositories/login_repository_interface.dart'
    as _i19;
import '../../modules/auth/repositories/register_repository.dart' as _i28;
import '../../modules/auth/repositories/register_repository_interface.dart'
    as _i27;
import '../../modules/call/blocs/calls/call_bloc.dart' as _i54;
import '../../modules/call/providers/call_provider.dart' as _i36;
import '../../modules/call/providers/call_provider_interface.dart' as _i35;
import '../../modules/call/repositories/call_repository.dart' as _i38;
import '../../modules/call/repositories/call_repository_interface.dart' as _i37;
import '../../modules/home/blocs/feature/feature_bloc.dart' as _i39;
import '../../modules/home/providers/home_provider.dart' as _i14;
import '../../modules/home/providers/home_provider_interface.dart' as _i13;
import '../../modules/home/repositories/home_repository.dart' as _i16;
import '../../modules/home/repositories/home_repository_interface.dart' as _i15;
import '../../modules/news/blocs/news_list_new/news_list_new_bloc.dart' as _i42;
import '../../modules/news/providers/news_provider.dart' as _i22;
import '../../modules/news/providers/news_provider_interface.dart' as _i21;
import '../../modules/news/repositories/news_repository.dart' as _i24;
import '../../modules/news/repositories/news_repository_interface.dart' as _i23;
import '../../modules/profile/blocs/edit_profile/edit_profile_bloc.dart'
    as _i55;
import '../../modules/profile/blocs/profile/profile_bloc.dart' as _i57;
import '../../modules/profile/blocs/update_password/update_password_bloc.dart'
    as _i52;
import '../../modules/profile/models/environment_model.dart' as _i4;
import '../../modules/profile/providers/profile_provider.dart' as _i44;
import '../../modules/profile/providers/profile_provider_interface.dart'
    as _i43;
import '../../modules/profile/repositories/profile_repository.dart' as _i46;
import '../../modules/profile/repositories/profile_repository_interface.dart'
    as _i45;
import '../../modules/report/blocs/geolocation/geolocation_bloc.dart' as _i40;
import '../../modules/report/blocs/my_report/my_report_bloc.dart' as _i56;
import '../../modules/report/blocs/report/report_bloc.dart' as _i29;
import '../../modules/report/blocs/report_form/report_form_bloc.dart' as _i58;
import '../../modules/report/blocs/report_list_bloc/report_list_bloc.dart'
    as _i59;
import '../../modules/report/providers/report_provider.dart' as _i49;
import '../../modules/report/providers/report_provider_interface.dart' as _i48;
import '../../modules/report/repositories/report_repository.dart' as _i51;
import '../../modules/report/repositories/report_repository_interface.dart'
    as _i50;
import '../../services/geolocator/geolocator_repository.dart' as _i11;
import '../../services/geolocator/geolocator_repository_interface.dart' as _i10;
import '../../services/native_api_service.dart'
    as _i60; // ignore_for_file: unnecessary_lambdas

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
  gh.factory<_i10.GeolocatorRepositoryInterface>(
      () => _i11.GeolocatorRepository());
  gh.factory<_i12.GoogleSignIn>(() => nativeApiService.googleSignIn);
  gh.factory<_i13.HomeProviderInterface>(
      () => _i14.HomeProvider(get<_i7.FirebaseFirestore>()));
  gh.factory<_i15.HomeRepositoryInterface>(() =>
      _i16.HomeRepository(homeProvider: get<_i13.HomeProviderInterface>()));
  gh.factory<_i17.LoginProviderInterface>(() => _i18.LoginProvider(
      firebaseAuth: get<_i5.FirebaseAuth>(),
      googleSignIn: get<_i12.GoogleSignIn>(),
      firebaseFirestore: get<_i7.FirebaseFirestore>()));
  gh.factory<_i19.LoginRepositoryInterface>(
      () => _i20.LoginRepository(get<_i17.LoginProviderInterface>()));
  gh.factory<_i21.NewsProviderInterface>(
      () => _i22.NewsProvider(get<_i3.Dio>()));
  gh.factory<_i23.NewsRepositoryInterface>(
      () => _i24.NewsRepository(get<_i21.NewsProviderInterface>()));
  gh.factory<_i25.RegisterProviderInterface>(() => _i26.RegisterProvider(
      firebaseAuth: get<_i5.FirebaseAuth>(),
      firebaseFirestore: get<_i7.FirebaseFirestore>()));
  gh.factory<_i27.RegisterRepositoryInterface>(
      () => _i28.RegisterRepository(get<_i25.RegisterProviderInterface>()));
  gh.factory<_i29.ReportBloc>(
      () => _i29.ReportBloc(get<_i15.HomeRepositoryInterface>()));
  gh.factory<_i30.ResetPasswordBloc>(() => _i30.ResetPasswordBloc(
      registerRepository: get<_i27.RegisterRepositoryInterface>(),
      firebaseCrashlytics: get<_i6.FirebaseCrashlytics>()));
  gh.factory<_i31.AuthProviderInterface>(() =>
      _i32.AuthProvider(get<_i5.FirebaseAuth>(), get<_i12.GoogleSignIn>()));
  gh.factory<_i33.AuthRepositoryInterface>(
      () => _i34.AuthRepository(get<_i31.AuthProviderInterface>()));
  gh.factory<_i35.CallProviderInterface>(
      () => _i36.CallProvider(get<_i7.FirebaseFirestore>()));
  gh.factory<_i37.CallRepositoryInterface>(() =>
      _i38.CallRepository(callProvider: get<_i35.CallProviderInterface>()));
  gh.factory<_i39.FeatureBloc>(() =>
      _i39.FeatureBloc(homeRepository: get<_i13.HomeProviderInterface>()));
  gh.factory<_i40.GeolocationBloc>(() => _i40.GeolocationBloc(
      geolocatorRepository: get<_i10.GeolocatorRepositoryInterface>()));
  gh.factory<_i41.LoginBloc>(() => _i41.LoginBloc(
      loginRepository: get<_i19.LoginRepositoryInterface>(),
      authRepository: get<_i33.AuthRepositoryInterface>(),
      registerRepository: get<_i27.RegisterRepositoryInterface>(),
      firebaseCrashlytics: get<_i6.FirebaseCrashlytics>()));
  gh.factory<_i42.NewsListNewBloc>(
      () => _i42.NewsListNewBloc(get<_i23.NewsRepositoryInterface>()));
  gh.factory<_i43.ProfileProviderInterface>(() => _i44.ProfileProvider(
      authRepository: get<_i33.AuthRepositoryInterface>(),
      firestore: get<_i7.FirebaseFirestore>()));
  gh.factory<_i45.ProfileRepositoryInterface>(() => _i46.ProfileRepository(
      profileProvider: get<_i43.ProfileProviderInterface>()));
  gh.factory<_i47.RegisterBloc>(() => _i47.RegisterBloc(
      registerRepository: get<_i27.RegisterRepositoryInterface>(),
      authRepository: get<_i33.AuthRepositoryInterface>(),
      firebaseCrashlytics: get<_i6.FirebaseCrashlytics>()));
  gh.factory<_i48.ReportProviderInterface>(() => _i49.ReportProvider(
      authRepository: get<_i33.AuthRepositoryInterface>(),
      firestore: get<_i7.FirebaseFirestore>(),
      imageStorage: get<_i9.FirebaseStorage>()));
  gh.factory<_i50.ReportRepositoryInterface>(() => _i51.ReportRepository(
      reportProvider: get<_i48.ReportProviderInterface>()));
  gh.factory<_i52.UpdatePasswordBloc>(() => _i52.UpdatePasswordBloc(
      profileRepository: get<_i45.ProfileRepositoryInterface>()));
  gh.factory<_i53.AuthBloc>(() => _i53.AuthBloc(
      authRepository: get<_i33.AuthRepositoryInterface>(),
      firebaseCrashlytics: get<_i6.FirebaseCrashlytics>()));
  gh.factory<_i54.CallBloc>(
      () => _i54.CallBloc(callRepository: get<_i37.CallRepositoryInterface>()));
  gh.factory<_i55.EditProfileBloc>(() => _i55.EditProfileBloc(
      profileRepository: get<_i45.ProfileRepositoryInterface>()));
  gh.factory<_i56.MyReportBloc>(
      () => _i56.MyReportBloc(get<_i50.ReportRepositoryInterface>()));
  gh.factory<_i57.ProfileBloc>(() => _i57.ProfileBloc(
      profileRepository: get<_i45.ProfileRepositoryInterface>()));
  gh.factory<_i58.ReportFormBloc>(() => _i58.ReportFormBloc(
      reportRepository: get<_i50.ReportRepositoryInterface>(),
      authRepository: get<_i33.AuthRepositoryInterface>()));
  gh.factory<_i59.ReportListBloc>(
      () => _i59.ReportListBloc(get<_i50.ReportRepositoryInterface>()));
  return get;
}

class _$NativeApiService extends _i60.NativeApiService {}
