// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../../core/bloc/auth_bloc.dart' as _i30;
import '../../core/repositories/auth_repositories.dart' as _i4;
import '../../core/repositories/auth_repositories_interface.dart' as _i3;
import '../../modules/auth/blocs/login/login_bloc.dart' as _i35;
import '../../modules/auth/blocs/register/register_bloc.dart' as _i38;
import '../../modules/auth/blocs/reset_password/reset_password_bloc.dart'
    as _i29;
import '../../modules/auth/repositories/login_repository.dart' as _i17;
import '../../modules/auth/repositories/login_repository_interface.dart'
    as _i16;
import '../../modules/auth/repositories/register_repository.dart' as _i23;
import '../../modules/auth/repositories/register_repository_interface.dart'
    as _i22;
import '../../modules/call/blocs/calls/call_bloc.dart' as _i31;
import '../../modules/call/providers/call_provider.dart' as _i6;
import '../../modules/call/providers/call_provider_interface.dart' as _i5;
import '../../modules/call/repositories/call_repository.dart' as _i8;
import '../../modules/call/repositories/call_repository_interface.dart' as _i7;
import '../../modules/home/blocs/feature/feature_bloc.dart' as _i33;
import '../../modules/home/providers/home_provider.dart' as _i13;
import '../../modules/home/providers/home_provider_interface.dart' as _i12;
import '../../modules/home/repositories/home_repository.dart' as _i15;
import '../../modules/home/repositories/home_repository_interface.dart' as _i14;
import '../../modules/profile/blocs/edit_profile/edit_profile_bloc.dart'
    as _i32;
import '../../modules/profile/blocs/profile/profile_bloc.dart' as _i37;
import '../../modules/profile/models/environment_model.dart' as _i9;
import '../../modules/profile/providers/profile_provider.dart' as _i19;
import '../../modules/profile/providers/profile_provider_interface.dart'
    as _i18;
import '../../modules/profile/repositories/profile_repository.dart' as _i21;
import '../../modules/profile/repositories/profile_repository_interface.dart'
    as _i20;
import '../../modules/report/blocs/geolocation/geolocation_bloc.dart' as _i34;
import '../../modules/report/blocs/my_report/my_report_bloc.dart' as _i36;
import '../../modules/report/blocs/report/report_bloc.dart' as _i24;
import '../../modules/report/blocs/report_form/report_form_bloc.dart' as _i39;
import '../../modules/report/providers/report_provider.dart' as _i26;
import '../../modules/report/providers/report_provider_interface.dart' as _i25;
import '../../modules/report/repositories/report_repository.dart' as _i28;
import '../../modules/report/repositories/report_repository_interface.dart'
    as _i27;
import '../../services/geolocator/geolocator_repository.dart' as _i11;
import '../../services/geolocator/geolocator_repository_interface.dart' as _i10;
import '../../services/native_api_service.dart'
    as _i40; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
Future<_i1.GetIt> $initGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) async {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  final nativeApiService = _$NativeApiService();
  gh.singleton<_i3.AuthRepositoryInterface>(_i4.AuthRepository());
  gh.factory<_i5.CallProviderInterface>(() => _i6.CallProvider());
  gh.factory<_i7.CallRepositoryInterface>(
      () => _i8.CallRepository(callProvider: get<_i5.CallProviderInterface>()));
  await gh.lazySingletonAsync<_i9.EnvironmentModel>(
      () => nativeApiService.getPlatformInfo(),
      preResolve: true);
  gh.factory<_i10.GeolocatorRepositoryInterface>(
      () => _i11.GeolocatorRepository());
  gh.factory<_i12.HomeProviderInterface>(() => _i13.HomeProvider());
  gh.factory<_i14.HomeRepositoryInterface>(() =>
      _i15.HomeRepository(homeProvider: get<_i12.HomeProviderInterface>()));
  gh.factory<_i16.LoginRepositoryInterface>(() => _i17.LoginRepository());
  gh.factory<_i18.ProfileProviderInterface>(() =>
      _i19.ProfileProvider(authRepository: get<_i3.AuthRepositoryInterface>()));
  gh.factory<_i20.ProfileRepositoryInterface>(() => _i21.ProfileRepository(
      profileProvider: get<_i18.ProfileProviderInterface>()));
  gh.factory<_i22.RegisterRepositoryInterface>(() => _i23.RegisterRepository());
  gh.factory<_i24.ReportBloc>(
      () => _i24.ReportBloc(get<_i14.HomeRepositoryInterface>()));
  gh.factory<_i25.ReportProviderInterface>(() =>
      _i26.ReportProvider(authRepository: get<_i3.AuthRepositoryInterface>()));
  gh.factory<_i27.ReportRepositoryInterface>(() => _i28.ReportRepository(
      reportProvider: get<_i25.ReportProviderInterface>()));
  gh.factory<_i29.ResetPasswordBloc>(() => _i29.ResetPasswordBloc(
      registerRepository: get<_i22.RegisterRepositoryInterface>()));
  gh.singleton<_i30.AuthBloc>(
      _i30.AuthBloc(authRepository: get<_i3.AuthRepositoryInterface>()));
  gh.factory<_i31.CallBloc>(
      () => _i31.CallBloc(callRepository: get<_i7.CallRepositoryInterface>()));
  gh.factory<_i32.EditProfileBloc>(() => _i32.EditProfileBloc(
      profileRepository: get<_i20.ProfileRepositoryInterface>()));
  gh.factory<_i33.FeatureBloc>(() =>
      _i33.FeatureBloc(homeRepository: get<_i12.HomeProviderInterface>()));
  gh.factory<_i34.GeolocationBloc>(() => _i34.GeolocationBloc(
      geolocatorRepository: get<_i10.GeolocatorRepositoryInterface>()));
  gh.factory<_i35.LoginBloc>(() => _i35.LoginBloc(
      loginRepository: get<_i16.LoginRepositoryInterface>(),
      authRepository: get<_i3.AuthRepositoryInterface>(),
      registerRepository: get<_i22.RegisterRepositoryInterface>()));
  gh.factory<_i36.MyReportBloc>(
      () => _i36.MyReportBloc(get<_i27.ReportRepositoryInterface>()));
  gh.factory<_i37.ProfileBloc>(() => _i37.ProfileBloc(
      profileRepository: get<_i20.ProfileRepositoryInterface>()));
  gh.factory<_i38.RegisterBloc>(() => _i38.RegisterBloc(
      registerRepository: get<_i22.RegisterRepositoryInterface>(),
      authRepository: get<_i3.AuthRepositoryInterface>()));
  gh.factory<_i39.ReportFormBloc>(() => _i39.ReportFormBloc(
      reportRepository: get<_i27.ReportRepositoryInterface>(),
      authRepository: get<_i3.AuthRepositoryInterface>()));
  return get;
}

class _$NativeApiService extends _i40.NativeApiService {}
