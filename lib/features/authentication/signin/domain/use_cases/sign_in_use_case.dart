import 'package:capstone_project/features/authentication/core/data/models/acces_token_model.dart';
import 'package:either_dart/either.dart';
import 'package:injectable/injectable.dart';

import '../../../../../core/errors/failure.dart';
import '../../../core/domain/repositories/authentication_repositories.dart';
import 'sign_in_params.dart';

@injectable
class SignInUseCase {
  final AuthenticationRepository _repository;
  SignInUseCase(this._repository);

  Future<Either<Failure, AccessTokenModel>> execute([SignInParams? args]) {
    if (args == null) throw Exception('Arguments required');
    return _repository.signIn(args);
  }
}
