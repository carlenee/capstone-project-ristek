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

import '../features/create_post/data/datasource/create_post_remote_data_source.dart'
    as _i3;
import '../features/create_post/data/repositories/create_post_repository_impl.dart'
    as _i5;
import '../features/create_post/domain/repositories/create_post_repository.dart'
    as _i4;
import '../features/create_post/domain/usecase/upload_post_use_case.dart'
    as _i9;
import '../features/create_post/presentation/bloc/bloc/create_post_bloc.dart'
    as _i10;
import '../features/homepage/data/datasource/home_page_remote_data_source.dart'
    as _i6;
import '../features/homepage/data/repositories/home_page_repository_impl.dart'
    as _i8;
import '../features/homepage/domain/repositories/home_page_repository.dart'
    as _i7;
import '../features/homepage/domain/usecase/get_list_of_post_use_case.dart'
    as _i11;
import '../features/homepage/presentation/bloc/home_page_bloc.dart' as _i12;

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
    gh.factory<_i3.CreatePostRemoteDataSource>(
        () => _i3.CreatePostRemoteDataSourceImpl());
    gh.factory<_i4.CreatePostRepository>(() =>
        _i5.CreatePostRepositoryImpl(gh<_i3.CreatePostRemoteDataSource>()));
    gh.factory<_i6.HomePageRemoteDataSource>(
        () => _i6.HomePageRemoteDataSourceImpl());
    gh.factory<_i7.HomePageRepository>(
        () => _i8.HomePageRepositoryImpl(gh<_i6.HomePageRemoteDataSource>()));
    gh.factory<_i9.UploadPostUseCase>(
        () => _i9.UploadPostUseCase(gh<_i4.CreatePostRepository>()));
    gh.factory<_i10.CreatePostBloc>(
        () => _i10.CreatePostBloc(gh<_i9.UploadPostUseCase>()));
    gh.factory<_i11.GetListOfPostUseCase>(
        () => _i11.GetListOfPostUseCase(gh<_i7.HomePageRepository>()));
    gh.factory<_i12.HomePageBloc>(
        () => _i12.HomePageBloc(gh<_i11.GetListOfPostUseCase>()));
    return this;
  }
}
