import 'package:capstone_project/core/errors/failure.dart';
import 'package:capstone_project/features/homepage/data/models/post_model.dart';
import 'package:either_dart/either.dart';

abstract class HomePageRepository {
  Future<Either<Failure, List<PostModel>?>> getListOfPost(
      {int size = 5, required int page});

  Future<Either<Failure, bool>> deletePost(String postId);
}
