import 'package:capstone_project/core/client/api_call.dart';
import 'package:capstone_project/core/errors/failure.dart';
import 'package:capstone_project/features/main/profile/data/datasource/profile_datasource.dart';
import 'package:capstone_project/features/main/profile/data/model/profile_model.dart';
import 'package:either_dart/either.dart';

class ProfileRepository {
 static Future<Either<Fail, String>> editProfile(
      ProfileModel params) async {
    return await apiCall(ProfileDataSource.editProfile(params: params));
  }}
