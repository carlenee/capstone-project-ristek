import 'package:capstone_project/core/environments/endpoints.dart';
import 'package:capstone_project/features/homepage/data/models/post_model.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

abstract class HomePageRemoteDataSource {
  Future<List<PostModel>?> getListOfPost({int size = 5, required int page});
}

@Injectable(as: HomePageRemoteDataSource)
class HomePageRemoteDataSourceImpl implements HomePageRemoteDataSource {
  @override
  Future<List<PostModel>?> getListOfPost(
      {int size = 5, required int page}) async {
    List<PostModel> listOfPost = [];
    final url = '${Endpoints.post}?page=$page&take=$size';

    var dio = Dio();
    dio.options.headers['content-Type'] = 'application/json';
    dio.options.headers["Authorization"] =
        "Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOjEsImlhdCI6MTY5NTc5OTEzNCwiZXhwIjoxNjk1ODcxMTM0fQ.X--ktfBwlC62zp3XocxZ212dAnFrqR-9d1PKUmfbBjQ";

    final resp = await dio.get(url, queryParameters: {
      "email": "zuhal23@gmail.com",
      "password": "abcdefghi",
    });

    if (resp.statusCode == 200) {
      for (var post in resp.data['data']) {
        listOfPost.add(
          PostModel.fromJson(post),
        );
      }
      return listOfPost;
    }
    return null;
  }
}
