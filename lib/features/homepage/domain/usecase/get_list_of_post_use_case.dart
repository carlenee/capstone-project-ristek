import 'package:capstone_project/core/errors/failure.dart';
import 'package:capstone_project/features/homepage/data/models/post_model.dart';
import 'package:capstone_project/features/homepage/domain/repositories/home_page_repository.dart';
import 'package:either_dart/either.dart';
import 'package:injectable/injectable.dart';

@injectable
class GetListOfPostUseCase {
  final HomePageRepository _repository;

  GetListOfPostUseCase(this._repository);

  Future<Either<Failure, List<PostModel>?>> execute({int size = 5, required int page}) {
    return _repository.getListOfPost(page: page, size: size);
  }
}
