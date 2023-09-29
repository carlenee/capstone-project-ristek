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
    as _i12;
import '../features/authentication/signin/presentation/bloc/sign_in_cubit.dart'
    as _i18;
import '../features/authentication/signup/domain/use_cases/sign_up_use_case.dart'
    as _i13;
import '../features/authentication/signup/presentation/bloc/sign_up_cubit.dart'
    as _i19;
import '../features/create_post/data/datasource/create_post_remote_data_source.dart'
    as _i6;
import '../features/create_post/data/repositories/create_post_repository_impl.dart'
    as _i8;
import '../features/create_post/domain/repositories/create_post_repository.dart'
    as _i7;
import '../features/create_post/domain/usecase/upload_post_use_case.dart'
    as _i14;
import '../features/create_post/presentation/bloc/bloc/create_post_bloc.dart'
    as _i15;
import '../features/homepage/data/datasource/home_page_remote_data_source.dart'
    as _i9;
import '../features/homepage/data/repositories/home_page_repository_impl.dart'
    as _i11;
import '../features/homepage/domain/repositories/home_page_repository.dart'
    as _i10;
import '../features/homepage/domain/usecase/get_list_of_post_use_case.dart'
    as _i16;
import '../features/homepage/presentation/bloc/home_page_bloc.dart' as _i17;

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
    gh.factory<_i6.CreatePostRemoteDataSource>(
        () => _i6.CreatePostRemoteDataSourceImpl());
    gh.factory<_i7.CreatePostRepository>(() =>
        _i8.CreatePostRepositoryImpl(gh<_i6.CreatePostRemoteDataSource>()));
    gh.factory<_i9.HomePageRemoteDataSource>(
        () => _i9.HomePageRemoteDataSourceImpl());
    gh.factory<_i10.HomePageRepository>(
        () => _i11.HomePageRepositoryImpl(gh<_i9.HomePageRemoteDataSource>()));
    gh.factory<_i12.SignInUseCase>(
        () => _i12.SignInUseCase(gh<_i4.AuthenticationRepository>()));
    gh.factory<_i13.SignUpUseCase>(
        () => _i13.SignUpUseCase(gh<_i4.AuthenticationRepository>()));
    gh.factory<_i14.UploadPostUseCase>(
        () => _i14.UploadPostUseCase(gh<_i7.CreatePostRepository>()));
    gh.factory<_i15.CreatePostBloc>(
        () => _i15.CreatePostBloc(gh<_i14.UploadPostUseCase>()));
    gh.factory<_i16.GetListOfPostUseCase>(
        () => _i16.GetListOfPostUseCase(gh<_i10.HomePageRepository>()));
    gh.factory<_i17.HomePageBloc>(
        () => _i17.HomePageBloc(gh<_i16.GetListOfPostUseCase>()));
    gh.factory<_i18.SignInCubit>(
        () => _i18.SignInCubit(gh<_i12.SignInUseCase>()));
    gh.factory<_i19.SignUpCubit>(
        () => _i19.SignUpCubit(gh<_i13.SignUpUseCase>()));
    return this;
  }
}
