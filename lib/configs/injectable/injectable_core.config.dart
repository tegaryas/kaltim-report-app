// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:cloud_firestore/cloud_firestore.dart' as _i5;
import 'package:firebase_auth/firebase_auth.dart' as _i4;
import 'package:firebase_storage/firebase_storage.dart' as _i6;
import 'package:get_it/get_it.dart' as _i1;
import 'package:google_sign_in/google_sign_in.dart' as _i9;
import 'package:injectable/injectable.dart' as _i2;

import '../../core/bloc/auth_bloc.dart' as _i45;
import '../../core/providers/auth_provider.dart' as _i25;
import '../../core/providers/auth_provider_interface.dart' as _i24;
import '../../core/repositories/auth_repository.dart' as _i27;
import '../../core/repositories/auth_repository_interface.dart' as _i26;
import '../../modules/auth/blocs/login/login_bloc.dart' as _i34;
import '../../modules/auth/blocs/register/register_bloc.dart' as _i39;
import '../../modules/auth/blocs/reset_password/reset_password_bloc.dart'
    as _i23;
import '../../modules/auth/providers/login_provider.dart' as _i15;
import '../../modules/auth/providers/login_provider_interface.dart' as _i14;
import '../../modules/auth/providers/register_provider.dart' as _i19;
import '../../modules/auth/providers/register_provider_interface.dart' as _i18;
import '../../modules/auth/repositories/login_repository.dart' as _i17;
import '../../modules/auth/repositories/login_repository_interface.dart'
    as _i16;
import '../../modules/auth/repositories/register_repository.dart' as _i21;
import '../../modules/auth/repositories/register_repository_interface.dart'
    as _i20;
import '../../modules/call/blocs/calls/call_bloc.dart' as _i46;
import '../../modules/call/providers/call_provider.dart' as _i29;
import '../../modules/call/providers/call_provider_interface.dart' as _i28;
import '../../modules/call/repositories/call_repository.dart' as _i31;
import '../../modules/call/repositories/call_repository_interface.dart' as _i30;
import '../../modules/home/blocs/feature/feature_bloc.dart' as _i32;
import '../../modules/home/providers/home_provider.dart' as _i11;
import '../../modules/home/providers/home_provider_interface.dart' as _i10;
import '../../modules/home/repositories/home_repository.dart' as _i13;
import '../../modules/home/repositories/home_repository_interface.dart' as _i12;
import '../../modules/profile/blocs/edit_profile/edit_profile_bloc.dart'
    as _i47;
import '../../modules/profile/blocs/profile/profile_bloc.dart' as _i49;
import '../../modules/profile/blocs/update_password/update_password_bloc.dart'
    as _i44;
import '../../modules/profile/models/environment_model.dart' as _i3;
import '../../modules/profile/providers/profile_provider.dart' as _i36;
import '../../modules/profile/providers/profile_provider_interface.dart'
    as _i35;
import '../../modules/profile/repositories/profile_repository.dart' as _i38;
import '../../modules/profile/repositories/profile_repository_interface.dart'
    as _i37;
import '../../modules/report/blocs/geolocation/geolocation_bloc.dart' as _i33;
import '../../modules/report/blocs/my_report/my_report_bloc.dart' as _i48;
import '../../modules/report/blocs/report/report_bloc.dart' as _i22;
import '../../modules/report/blocs/report_form/report_form_bloc.dart' as _i50;
import '../../modules/report/providers/report_provider.dart' as _i41;
import '../../modules/report/providers/report_provider_interface.dart' as _i40;
import '../../modules/report/repositories/report_repository.dart' as _i43;
import '../../modules/report/repositories/report_repository_interface.dart'
    as _i42;
import '../../services/geolocator/geolocator_repository.dart' as _i8;
import '../../services/geolocator/geolocator_repository_interface.dart' as _i7;
import '../../services/native_api_service.dart'
    as _i51; // ignore_for_file: unnecessary_lambdas

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
  gh.singleton<_i5.FirebaseFirestore>(nativeApiService.firebaseFirestore);
  gh.lazySingleton<_i6.FirebaseStorage>(() => nativeApiService.firebaseStorage);
  gh.factory<_i7.GeolocatorRepositoryInterface>(
      () => _i8.GeolocatorRepository());
  gh.factory<_i9.GoogleSignIn>(() => nativeApiService.googleSignIn);
  gh.factory<_i10.HomeProviderInterface>(
      () => _i11.HomeProvider(get<_i5.FirebaseFirestore>()));
  gh.factory<_i12.HomeRepositoryInterface>(() =>
      _i13.HomeRepository(homeProvider: get<_i10.HomeProviderInterface>()));
  gh.factory<_i14.LoginProviderInterface>(() => _i15.LoginProvider(
      firebaseAuth: get<_i4.FirebaseAuth>(),
      googleSignIn: get<_i9.GoogleSignIn>(),
      firebaseFirestore: get<_i5.FirebaseFirestore>()));
  gh.factory<_i16.LoginRepositoryInterface>(
      () => _i17.LoginRepository(get<_i14.LoginProviderInterface>()));
  gh.factory<_i18.RegisterProviderInterface>(() => _i19.RegisterProvider(
      firebaseAuth: get<_i4.FirebaseAuth>(),
      firebaseFirestore: get<_i5.FirebaseFirestore>()));
  gh.factory<_i20.RegisterRepositoryInterface>(
      () => _i21.RegisterRepository(get<_i18.RegisterProviderInterface>()));
  gh.factory<_i22.ReportBloc>(
      () => _i22.ReportBloc(get<_i12.HomeRepositoryInterface>()));
  gh.factory<_i23.ResetPasswordBloc>(() => _i23.ResetPasswordBloc(
      registerRepository: get<_i20.RegisterRepositoryInterface>()));
  gh.factory<_i24.AuthProviderInterface>(() =>
      _i25.AuthProvider(get<_i4.FirebaseAuth>(), get<_i9.GoogleSignIn>()));
  gh.factory<_i26.AuthRepositoryInterface>(
      () => _i27.AuthRepository(get<_i24.AuthProviderInterface>()));
  gh.factory<_i28.CallProviderInterface>(
      () => _i29.CallProvider(get<_i5.FirebaseFirestore>()));
  gh.factory<_i30.CallRepositoryInterface>(() =>
      _i31.CallRepository(callProvider: get<_i28.CallProviderInterface>()));
  gh.factory<_i32.FeatureBloc>(() =>
      _i32.FeatureBloc(homeRepository: get<_i10.HomeProviderInterface>()));
  gh.factory<_i33.GeolocationBloc>(() => _i33.GeolocationBloc(
      geolocatorRepository: get<_i7.GeolocatorRepositoryInterface>()));
  gh.factory<_i34.LoginBloc>(() => _i34.LoginBloc(
      loginRepository: get<_i16.LoginRepositoryInterface>(),
      authRepository: get<_i26.AuthRepositoryInterface>(),
      registerRepository: get<_i20.RegisterRepositoryInterface>()));
  gh.factory<_i35.ProfileProviderInterface>(() => _i36.ProfileProvider(
      authRepository: get<_i26.AuthRepositoryInterface>(),
      firestore: get<_i5.FirebaseFirestore>()));
  gh.factory<_i37.ProfileRepositoryInterface>(() => _i38.ProfileRepository(
      profileProvider: get<_i35.ProfileProviderInterface>()));
  gh.factory<_i39.RegisterBloc>(() => _i39.RegisterBloc(
      registerRepository: get<_i20.RegisterRepositoryInterface>(),
      authRepository: get<_i26.AuthRepositoryInterface>()));
  gh.factory<_i40.ReportProviderInterface>(() => _i41.ReportProvider(
      authRepository: get<_i26.AuthRepositoryInterface>(),
      firestore: get<_i5.FirebaseFirestore>(),
      imageStorage: get<_i6.FirebaseStorage>()));
  gh.factory<_i42.ReportRepositoryInterface>(() => _i43.ReportRepository(
      reportProvider: get<_i40.ReportProviderInterface>()));
  gh.factory<_i44.UpdatePasswordBloc>(() => _i44.UpdatePasswordBloc(
      profileRepository: get<_i37.ProfileRepositoryInterface>()));
  gh.factory<_i45.AuthBloc>(
      () => _i45.AuthBloc(authRepository: get<_i26.AuthRepositoryInterface>()));
  gh.factory<_i46.CallBloc>(
      () => _i46.CallBloc(callRepository: get<_i30.CallRepositoryInterface>()));
  gh.factory<_i47.EditProfileBloc>(() => _i47.EditProfileBloc(
      profileRepository: get<_i37.ProfileRepositoryInterface>()));
  gh.factory<_i48.MyReportBloc>(
      () => _i48.MyReportBloc(get<_i42.ReportRepositoryInterface>()));
  gh.factory<_i49.ProfileBloc>(() => _i49.ProfileBloc(
      profileRepository: get<_i37.ProfileRepositoryInterface>()));
  gh.factory<_i50.ReportFormBloc>(() => _i50.ReportFormBloc(
      reportRepository: get<_i42.ReportRepositoryInterface>(),
      authRepository: get<_i26.AuthRepositoryInterface>()));
  return get;
}

class _$NativeApiService extends _i51.NativeApiService {}
