// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: unnecessary_lambdas
// ignore_for_file: lines_longer_than_80_chars
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../features/authentication/core/data/data_source/authentication_remote_data_source.dart'
    as _i3;
import '../features/authentication/core/data/repositories/authentication_repositories_impl.dart'
    as _i5;
import '../features/authentication/core/domain/repositories/authentication_repositories.dart'
    as _i4;
import '../features/authentication/signin/domain/use_cases/sign_in_use_case.dart'
    as _i6;
import '../features/authentication/signin/presentation/bloc/sign_in_cubit.dart'
    as _i8;
import '../features/authentication/signup/domain/use_cases/sign_up_use_case.dart'
    as _i7;
import '../features/authentication/signup/presentation/bloc/sign_up_cubit.dart'
    as _i9;

extension GetItInjectableX on _i1.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i1.GetIt init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    gh.factory<_i3.AuthenticationRemoteDataSource>(
        () => _i3.AuthenticationRemoteDataSourceImpl());
    gh.factory<_i4.AuthenticationRepository>(() =>
        _i5.AutenticationRepositoryImpl(
            gh<_i3.AuthenticationRemoteDataSource>()));
    gh.factory<_i6.SignInUseCase>(
        () => _i6.SignInUseCase(gh<_i4.AuthenticationRepository>()));
    gh.factory<_i7.SignUpUseCase>(
        () => _i7.SignUpUseCase(gh<_i4.AuthenticationRepository>()));
    gh.factory<_i8.SignInCubit>(() => _i8.SignInCubit(gh<_i6.SignInUseCase>()));
    gh.factory<_i9.SignUpCubit>(() => _i9.SignUpCubit(gh<_i7.SignUpUseCase>()));
    return this;
  }
}
