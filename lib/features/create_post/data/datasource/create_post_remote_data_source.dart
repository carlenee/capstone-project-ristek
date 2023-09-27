import 'package:capstone_project/core/environments/endpoints.dart';
import 'package:capstone_project/features/create_post/data/models/upload_post_model.dart';
import 'package:dio/dio.dart';
import 'package:dio/dio.dart';
import 'package:http_parser/http_parser.dart';
import 'package:injectable/injectable.dart';

abstract class CreatePostRemoteDataSource {
  Future<bool> uploadPost(UploadPostModel uploadPostModel);
}

@Injectable(as: CreatePostRemoteDataSource)
class CreatePostRemoteDataSourceImpl implements CreatePostRemoteDataSource {
  @override
  Future<bool> uploadPost(UploadPostModel uploadPostModel) async {
    final url = Endpoints.post;
    final model = uploadPostModel.toJson();

    var dio = Dio();
    dio.options.headers['content-Type'] = 'multipart/form-data';
    dio.options.headers["Authorization"] =
        "Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOjEsImlhdCI6MTY5NTc5OTEzNCwiZXhwIjoxNjk1ODcxMTM0fQ.X--ktfBwlC62zp3XocxZ212dAnFrqR-9d1PKUmfbBjQ";

    print("BEfore multipart");
    model['picture'] = await MultipartFile.fromFile(
      uploadPostModel.picture,
      filename: uploadPostModel.picture.split('/').last,
      contentType: MediaType("image", "jpeg"),
    );

    print(model);
    var formData = FormData.fromMap(model);

    final resp = await dio.post(url, data: formData);
    print(resp);
    return resp.data['status'];
  }
}
