// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:cloud_firestore/cloud_firestore.dart' as _i6;
import 'package:firebase_auth/firebase_auth.dart' as _i4;
import 'package:firebase_crashlytics/firebase_crashlytics.dart' as _i5;
import 'package:firebase_messaging/firebase_messaging.dart' as _i7;
import 'package:firebase_storage/firebase_storage.dart' as _i8;
import 'package:get_it/get_it.dart' as _i1;
import 'package:google_sign_in/google_sign_in.dart' as _i11;
import 'package:injectable/injectable.dart' as _i2;

import '../../core/bloc/auth_bloc.dart' as _i47;
import '../../core/providers/auth_provider.dart' as _i27;
import '../../core/providers/auth_provider_interface.dart' as _i26;
import '../../core/repositories/auth_repository.dart' as _i29;
import '../../core/repositories/auth_repository_interface.dart' as _i28;
import '../../modules/auth/blocs/login/login_bloc.dart' as _i36;
import '../../modules/auth/blocs/register/register_bloc.dart' as _i41;
import '../../modules/auth/blocs/reset_password/reset_password_bloc.dart'
    as _i25;
import '../../modules/auth/providers/login_provider.dart' as _i17;
import '../../modules/auth/providers/login_provider_interface.dart' as _i16;
import '../../modules/auth/providers/register_provider.dart' as _i21;
import '../../modules/auth/providers/register_provider_interface.dart' as _i20;
import '../../modules/auth/repositories/login_repository.dart' as _i19;
import '../../modules/auth/repositories/login_repository_interface.dart'
    as _i18;
import '../../modules/auth/repositories/register_repository.dart' as _i23;
import '../../modules/auth/repositories/register_repository_interface.dart'
    as _i22;
import '../../modules/call/blocs/calls/call_bloc.dart' as _i48;
import '../../modules/call/providers/call_provider.dart' as _i31;
import '../../modules/call/providers/call_provider_interface.dart' as _i30;
import '../../modules/call/repositories/call_repository.dart' as _i33;
import '../../modules/call/repositories/call_repository_interface.dart' as _i32;
import '../../modules/home/blocs/feature/feature_bloc.dart' as _i34;
import '../../modules/home/providers/home_provider.dart' as _i13;
import '../../modules/home/providers/home_provider_interface.dart' as _i12;
import '../../modules/home/repositories/home_repository.dart' as _i15;
import '../../modules/home/repositories/home_repository_interface.dart' as _i14;
import '../../modules/profile/blocs/edit_profile/edit_profile_bloc.dart'
    as _i49;
import '../../modules/profile/blocs/profile/profile_bloc.dart' as _i51;
import '../../modules/profile/blocs/update_password/update_password_bloc.dart'
    as _i46;
import '../../modules/profile/models/environment_model.dart' as _i3;
import '../../modules/profile/providers/profile_provider.dart' as _i38;
import '../../modules/profile/providers/profile_provider_interface.dart'
    as _i37;
import '../../modules/profile/repositories/profile_repository.dart' as _i40;
import '../../modules/profile/repositories/profile_repository_interface.dart'
    as _i39;
import '../../modules/report/blocs/geolocation/geolocation_bloc.dart' as _i35;
import '../../modules/report/blocs/my_report/my_report_bloc.dart' as _i50;
import '../../modules/report/blocs/report/report_bloc.dart' as _i24;
import '../../modules/report/blocs/report_form/report_form_bloc.dart' as _i52;
import '../../modules/report/blocs/report_list_bloc/report_list_bloc.dart'
    as _i53;
import '../../modules/report/providers/report_provider.dart' as _i43;
import '../../modules/report/providers/report_provider_interface.dart' as _i42;
import '../../modules/report/repositories/report_repository.dart' as _i45;
import '../../modules/report/repositories/report_repository_interface.dart'
    as _i44;
import '../../services/geolocator/geolocator_repository.dart' as _i10;
import '../../services/geolocator/geolocator_repository_interface.dart' as _i9;
import '../../services/native_api_service.dart'
    as _i54; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
Future<_i1.GetIt> $initGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) async {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  final nativeApiService = _$NativeApiService();
  await gh.lazySingletonAsync<_i3.EnvironmentModel>(
      () => nativeApiService.getPlatformInfo(),
      preResolve: true);
  gh.singleton<_i4.FirebaseAuth>(nativeApiService.firebaseAuth);
  gh.singleton<_i5.FirebaseCrashlytics>(nativeApiService.firebaseCrashlytics);
  gh.singleton<_i6.FirebaseFirestore>(nativeApiService.firebaseFirestore);
  gh.singleton<_i7.FirebaseMessaging>(nativeApiService.firebaseMessaging);
  gh.lazySingleton<_i8.FirebaseStorage>(() => nativeApiService.firebaseStorage);
  gh.factory<_i9.GeolocatorRepositoryInterface>(
      () => _i10.GeolocatorRepository());
  gh.factory<_i11.GoogleSignIn>(() => nativeApiService.googleSignIn);
  gh.factory<_i12.HomeProviderInterface>(
      () => _i13.HomeProvider(get<_i6.FirebaseFirestore>()));
  gh.factory<_i14.HomeRepositoryInterface>(() =>
      _i15.HomeRepository(homeProvider: get<_i12.HomeProviderInterface>()));
  gh.factory<_i16.LoginProviderInterface>(() => _i17.LoginProvider(
      firebaseAuth: get<_i4.FirebaseAuth>(),
      googleSignIn: get<_i11.GoogleSignIn>(),
      firebaseFirestore: get<_i6.FirebaseFirestore>()));
  gh.factory<_i18.LoginRepositoryInterface>(
      () => _i19.LoginRepository(get<_i16.LoginProviderInterface>()));
  gh.factory<_i20.RegisterProviderInterface>(() => _i21.RegisterProvider(
      firebaseAuth: get<_i4.FirebaseAuth>(),
      firebaseFirestore: get<_i6.FirebaseFirestore>()));
  gh.factory<_i22.RegisterRepositoryInterface>(
      () => _i23.RegisterRepository(get<_i20.RegisterProviderInterface>()));
  gh.factory<_i24.ReportBloc>(
      () => _i24.ReportBloc(get<_i14.HomeRepositoryInterface>()));
  gh.factory<_i25.ResetPasswordBloc>(() => _i25.ResetPasswordBloc(
      registerRepository: get<_i22.RegisterRepositoryInterface>(),
      firebaseCrashlytics: get<_i5.FirebaseCrashlytics>()));
  gh.factory<_i26.AuthProviderInterface>(() =>
      _i27.AuthProvider(get<_i4.FirebaseAuth>(), get<_i11.GoogleSignIn>()));
  gh.factory<_i28.AuthRepositoryInterface>(
      () => _i29.AuthRepository(get<_i26.AuthProviderInterface>()));
  gh.factory<_i30.CallProviderInterface>(
      () => _i31.CallProvider(get<_i6.FirebaseFirestore>()));
  gh.factory<_i32.CallRepositoryInterface>(() =>
      _i33.CallRepository(callProvider: get<_i30.CallProviderInterface>()));
  gh.factory<_i34.FeatureBloc>(() =>
      _i34.FeatureBloc(homeRepository: get<_i12.HomeProviderInterface>()));
  gh.factory<_i35.GeolocationBloc>(() => _i35.GeolocationBloc(
      geolocatorRepository: get<_i9.GeolocatorRepositoryInterface>()));
  gh.factory<_i36.LoginBloc>(() => _i36.LoginBloc(
      loginRepository: get<_i18.LoginRepositoryInterface>(),
      authRepository: get<_i28.AuthRepositoryInterface>(),
      registerRepository: get<_i22.RegisterRepositoryInterface>(),
      firebaseCrashlytics: get<_i5.FirebaseCrashlytics>()));
  gh.factory<_i37.ProfileProviderInterface>(() => _i38.ProfileProvider(
      authRepository: get<_i28.AuthRepositoryInterface>(),
      firestore: get<_i6.FirebaseFirestore>()));
  gh.factory<_i39.ProfileRepositoryInterface>(() => _i40.ProfileRepository(
      profileProvider: get<_i37.ProfileProviderInterface>()));
  gh.factory<_i41.RegisterBloc>(() => _i41.RegisterBloc(
      registerRepository: get<_i22.RegisterRepositoryInterface>(),
      authRepository: get<_i28.AuthRepositoryInterface>(),
      firebaseCrashlytics: get<_i5.FirebaseCrashlytics>()));
  gh.factory<_i42.ReportProviderInterface>(() => _i43.ReportProvider(
      authRepository: get<_i28.AuthRepositoryInterface>(),
      firestore: get<_i6.FirebaseFirestore>(),
      imageStorage: get<_i8.FirebaseStorage>()));
  gh.factory<_i44.ReportRepositoryInterface>(() => _i45.ReportRepository(
      reportProvider: get<_i42.ReportProviderInterface>()));
  gh.factory<_i46.UpdatePasswordBloc>(() => _i46.UpdatePasswordBloc(
      profileRepository: get<_i39.ProfileRepositoryInterface>()));
  gh.factory<_i47.AuthBloc>(() => _i47.AuthBloc(
      authRepository: get<_i28.AuthRepositoryInterface>(),
      firebaseCrashlytics: get<_i5.FirebaseCrashlytics>()));
  gh.factory<_i48.CallBloc>(
      () => _i48.CallBloc(callRepository: get<_i32.CallRepositoryInterface>()));
  gh.factory<_i49.EditProfileBloc>(() => _i49.EditProfileBloc(
      profileRepository: get<_i39.ProfileRepositoryInterface>()));
  gh.factory<_i50.MyReportBloc>(
      () => _i50.MyReportBloc(get<_i44.ReportRepositoryInterface>()));
  gh.factory<_i51.ProfileBloc>(() => _i51.ProfileBloc(
      profileRepository: get<_i39.ProfileRepositoryInterface>()));
  gh.factory<_i52.ReportFormBloc>(() => _i52.ReportFormBloc(
      reportRepository: get<_i44.ReportRepositoryInterface>(),
      authRepository: get<_i28.AuthRepositoryInterface>()));
  gh.factory<_i53.ReportListBloc>(
      () => _i53.ReportListBloc(get<_i44.ReportRepositoryInterface>()));
  return get;
}

class _$NativeApiService extends _i54.NativeApiService {}
