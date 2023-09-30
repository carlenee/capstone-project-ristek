import 'package:capstone_project/features/authentication/core/data/models/acces_token_model.dart';
import 'package:either_dart/either.dart';
import 'package:injectable/injectable.dart';

import '../../../../../core/environments/endpoints.dart';
import '../../../../../core/errors/failure.dart';
import '../../../../../services/http.dart';
import '../../../signin/domain/use_cases/sign_in_params.dart';
import '../../../signup/domain/use_cases/sign_up_params.dart';

abstract class AuthenticationRemoteDataSource {
  Future<bool> signUp(SignUpParams signUpParams);
  Future<Either<Failure, AccessTokenModel>> signIn(SignInParams signInParams);
}

@Injectable(as: AuthenticationRemoteDataSource)
class AuthenticationRemoteDataSourceImpl
    implements AuthenticationRemoteDataSource {
  @override
  Future<bool> signUp(SignUpParams signUpParams) async {
    const url = Endpoints.registerUrl;

    final resp = await HttpService.post(url, body: signUpParams.toJson());
    return resp.data["status"];
  }

  @override
  Future<Either<Failure, AccessTokenModel>> signIn(
      SignInParams signInParams) async {
    const url = Endpoints.loginUrl;

    final resp = await HttpService.post(url, body: signInParams.toJson());

    if (resp.statusCode != 200 || !resp.data["status"]) {
      return Left(GeneralFailure(message: resp.data['message'].toString()));
    } else {
      return Right(AccessTokenModel(
        token: resp.data["data"]["token"],
        id: resp.data["data"]["data"]["id"],
        firstName: resp.data["data"]["data"]["firstName"] ?? "",
        lastName: resp.data["data"]["data"]["lastName"] ?? "",
        bio: resp.data["data"]["data"]["bio"] ?? "",
        email: resp.data["data"]["data"]["email"] ?? "",
        photoUrl: resp.data["data"]["data"]["photoUrl"] ?? "",
        photoPublicId: resp.data["data"]["data"]["photoPublicId"] ?? "",
      ));
    }
  }
}
