import 'package:capstone_project/features/create_post/data/models/upload_post_model.dart';

abstract class CreatePostRepository {
  Future<bool> uploadPost(
    UploadPostModel uploadPostModel,
  );

  Future<bool> editPost(UploadPostModel uploadPostModel);


}
