import 'package:either_dart/either.dart';

import '../../../../../core/errors/failure.dart';
import '../../../signin/domain/use_cases/sign_in_params.dart';
import '../../../signup/domain/use_cases/sign_up_params.dart';
import '../../data/models/acces_token_model.dart';

abstract class AuthenticationRepository {
  Future<bool> signUp(
    SignUpParams signUpParams,
  );
  Future<Either<Failure, AccessTokenModel>> signIn(
    SignInParams signUpParams,
  );
}
