import 'package:capstone_project/features/create_post/data/models/upload_post_model.dart';
import 'package:capstone_project/features/create_post/domain/repositories/create_post_repository.dart';
import 'package:injectable/injectable.dart';

@injectable
class EditPostUseCase {
  final CreatePostRepository _repository;

  EditPostUseCase(this._repository);

  Future<bool> execute(UploadPostModel? arg) {
    if (arg == null) throw Exception('Arguments required');
    return _repository.editPost(arg);
  }
}
