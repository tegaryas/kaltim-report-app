// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../../core/bloc/auth_bloc.dart' as _i18;
import '../../core/repositories/auth_repositories.dart' as _i4;
import '../../core/repositories/auth_repositories_interface.dart' as _i3;
import '../../modules/auth/blocs/login/login_bloc.dart' as _i20;
import '../../modules/auth/blocs/register/register_bloc.dart' as _i21;
import '../../modules/auth/repositories/login_repository.dart' as _i14;
import '../../modules/auth/repositories/login_repository_interface.dart'
    as _i13;
import '../../modules/auth/repositories/register_repository.dart' as _i16;
import '../../modules/auth/repositories/register_repository_interface.dart'
    as _i15;
import '../../modules/call/blocs/calls/call_bloc.dart' as _i19;
import '../../modules/call/providers/call_provider.dart' as _i6;
import '../../modules/call/providers/call_provider_interface.dart' as _i5;
import '../../modules/call/repositories/call_repository.dart' as _i8;
import '../../modules/call/repositories/call_repository_interface.dart' as _i7;
import '../../modules/home/blocs/report/report_bloc.dart' as _i17;
import '../../modules/home/providers/home_provider.dart' as _i10;
import '../../modules/home/providers/home_provider_interface.dart' as _i9;
import '../../modules/home/repositories/home_repository.dart' as _i12;
import '../../modules/home/repositories/home_repository_interface.dart'
    as _i11; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  gh.singleton<_i3.AuthRepositoryInterface>(_i4.AuthRepository());
  gh.factory<_i5.CallProviderInterface>(() => _i6.CallProvider());
  gh.factory<_i7.CallRepositoryInterface>(
      () => _i8.CallRepository(callProvider: get<_i5.CallProviderInterface>()));
  gh.factory<_i9.HomeProviderInterface>(() => _i10.HomeProvider());
  gh.factory<_i11.HomeRepositoryInterface>(() =>
      _i12.HomeRepository(homeProvider: get<_i9.HomeProviderInterface>()));
  gh.factory<_i13.LoginRepositoryInterface>(() => _i14.LoginRepository());
  gh.factory<_i15.RegisterRepositoryInterface>(() => _i16.RegisterRepository());
  gh.factory<_i17.ReportBloc>(() =>
      _i17.ReportBloc(homeRepository: get<_i11.HomeRepositoryInterface>()));
  gh.singleton<_i18.AuthBloc>(
      _i18.AuthBloc(authRepository: get<_i3.AuthRepositoryInterface>()));
  gh.factory<_i19.CallBloc>(
      () => _i19.CallBloc(callRepository: get<_i7.CallRepositoryInterface>()));
  gh.factory<_i20.LoginBloc>(() => _i20.LoginBloc(
      loginRepository: get<_i13.LoginRepositoryInterface>(),
      authRepository: get<_i3.AuthRepositoryInterface>(),
      registerRepository: get<_i15.RegisterRepositoryInterface>()));
  gh.factory<_i21.RegisterBloc>(() => _i21.RegisterBloc(
      registerRepository: get<_i15.RegisterRepositoryInterface>(),
      authRepository: get<_i3.AuthRepositoryInterface>()));
  return get;
}
