import 'package:capstone_project/features/authentication/core/data/models/acces_token_model.dart';
import 'package:capstone_project/features/authentication/signin/domain/use_cases/sign_in_params.dart';
import 'package:either_dart/either.dart';
import 'package:injectable/injectable.dart';

import '../../../../../core/errors/failure.dart';
import '../../../signup/domain/use_cases/sign_up_params.dart';
import '../../domain/repositories/authentication_repositories.dart';
import '../data_source/authentication_remote_data_source.dart';

@Injectable(as: AuthenticationRepository)
class AutenticationRepositoryImpl implements AuthenticationRepository {
  final AuthenticationRemoteDataSource _remoteDataSource;
  AutenticationRepositoryImpl(this._remoteDataSource);
  @override
  Future<bool> signUp(
    SignUpParams signUpParams,
  ) async {
    bool result = await _remoteDataSource.signUp(signUpParams);
    return result;
  }

  @override
  Future<Either<Failure, AccessTokenModel>> signIn(
      SignInParams signInParams) async {
    return _remoteDataSource.signIn(signInParams);
  }
}
