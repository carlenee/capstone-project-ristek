import 'package:capstone_project/features/create_post/data/datasource/create_post_remote_data_source.dart';
import 'package:capstone_project/features/create_post/data/models/upload_post_model.dart';
import 'package:capstone_project/features/create_post/domain/repositories/create_post_repository.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: CreatePostRepository)
class CreatePostRepositoryImpl implements CreatePostRepository {
  final CreatePostRemoteDataSource _remoteDataSource;

  CreatePostRepositoryImpl(this._remoteDataSource);

  @override
  Future<bool> uploadPost(UploadPostModel uploadPostModel) {
    return _remoteDataSource.uploadPost(uploadPostModel);
  }
}
