import 'package:capstone_project/core/environments/endpoints.dart';
import 'package:capstone_project/core/errors/failure.dart';
import 'package:capstone_project/features/homepage/data/models/post_model.dart';
import 'package:capstone_project/services/http.dart';
import 'package:either_dart/either.dart';
import 'package:injectable/injectable.dart';

abstract class HomePageRemoteDataSource {
  Future<Either<Failure, List<PostModel>?>> getListOfPost({int size = 5, required int page});
}

@Injectable(as: HomePageRemoteDataSource)
class HomePageRemoteDataSourceImpl implements HomePageRemoteDataSource {
  @override
  Future<Either<Failure, List<PostModel>?>> getListOfPost(
      {int size = 5, required int page}) async {
    List<PostModel> listOfPost = [];
    final url = '${Endpoints.post}?page=$page&take=$size';

    final resp = await HttpService.get(url);

  

    if (resp.statusCode != 200 || !resp.data["status"]) {
      return Left(GeneralFailure(message: resp.data['message'].toString()));
    } else {
      for (var post in resp.data['data']) {
        listOfPost.add(
          PostModel.fromJson(post),
        );
      }
      return Right(listOfPost);
    }
  }
}
