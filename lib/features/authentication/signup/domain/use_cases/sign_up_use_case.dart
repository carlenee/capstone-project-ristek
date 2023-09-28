import 'package:injectable/injectable.dart';

import '../../../core/domain/repositories/authentication_repositories.dart';
import 'sign_up_params.dart';

@injectable
class SignUpUseCase {
  final AuthenticationRepository _repository;
  SignUpUseCase(this._repository);

  Future<bool> execute([SignUpParams? args]) {
    if (args == null) throw Exception('Arguments required');
    return _repository.signUp(args);
  }
}
