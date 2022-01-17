// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../../core/bloc/auth_bloc.dart' as _i7;
import '../../core/repositories/auth_repositories.dart' as _i4;
import '../../core/repositories/auth_repositories_interface.dart' as _i3;
import '../../modules/auth/blocs/login/login_bloc.dart' as _i8;
import '../../modules/auth/repositories/login_repository.dart' as _i6;
import '../../modules/auth/repositories/login_repository_interface.dart'
    as _i5; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  gh.singleton<_i3.AuthRepositoryInterface>(_i4.AuthRepository());
  gh.factory<_i5.LoginRepositoryInterface>(() => _i6.LoginRepository());
  gh.singleton<_i7.AuthBloc>(
      _i7.AuthBloc(authRepository: get<_i3.AuthRepositoryInterface>()));
  gh.factory<_i8.LoginBloc>(() => _i8.LoginBloc(
      loginRepository: get<_i5.LoginRepositoryInterface>(),
      authRepository: get<_i3.AuthRepositoryInterface>()));
  return get;
}
