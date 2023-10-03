import 'package:capstone_project/core/errors/failure.dart';
import 'package:capstone_project/features/homepage/domain/repositories/home_page_repository.dart';
import 'package:either_dart/either.dart';
import 'package:injectable/injectable.dart';

@injectable
class DeletePostUseCase {
  final HomePageRepository _repository;

  DeletePostUseCase(this._repository);

  Future<Either<Failure, bool>> execute(String postId) {

    return _repository.deletePost(postId);
  }
}
