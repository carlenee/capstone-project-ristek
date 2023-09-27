import 'package:capstone_project/features/homepage/data/datasource/home_page_remote_data_source.dart';
import 'package:capstone_project/features/homepage/data/models/post_model.dart';
import 'package:capstone_project/features/homepage/domain/repositories/home_page_repository.dart';
import 'package:injectable/injectable.dart';


@Injectable(as: HomePageRepository)
class HomePageRepositoryImpl implements HomePageRepository {
  final HomePageRemoteDataSource _remoteDataSource;

  HomePageRepositoryImpl(this._remoteDataSource);

  @override
  Future<List<PostModel>?> getListOfPost({int size = 5, required int page}) {
    // TODO: implement getListOfPost
    return _remoteDataSource.getListOfPost(size: size,page: page);
  }

  
}
