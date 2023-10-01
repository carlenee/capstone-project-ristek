import 'package:capstone_project/core/environments/endpoints.dart';
import 'package:capstone_project/features/create_post/data/models/upload_post_model.dart';
import 'package:capstone_project/services/http.dart';
import 'package:dio/dio.dart';
// ignore: duplicate_import
import 'package:dio/dio.dart';
import 'package:http_parser/http_parser.dart';
import 'package:injectable/injectable.dart';

abstract class CreatePostRemoteDataSource {
  Future<bool> uploadPost(UploadPostModel uploadPostModel);
  Future<bool> editPost(UploadPostModel uploadPostModel);
}

@Injectable(as: CreatePostRemoteDataSource)
class CreatePostRemoteDataSourceImpl implements CreatePostRemoteDataSource {
  @override
  Future<bool> uploadPost(UploadPostModel uploadPostModel) async {
    const url = Endpoints.post;
    final model = uploadPostModel.toJson();

    model['picture'] = await MultipartFile.fromFile(
      uploadPostModel.picture,
      filename: uploadPostModel.picture.split('/').last,
      contentType: MediaType("image", "jpeg"),
    );

    model.removeWhere((key, value) => key == 'id');

    var formData = FormData.fromMap(model);
    final resp = await HttpService.post(url, body: formData);

    return resp.data['status'];
  }

  @override
  Future<bool> editPost(UploadPostModel uploadPostModel) async {
    final model = uploadPostModel.toJson();
    final url = '${Endpoints.post}/${model['id']}';
    print(url);
    print(model);
    print(model['id']);

    model.removeWhere((key, value) => key == 'id');

    model['picture'] = await MultipartFile.fromFile(
      uploadPostModel.picture,
      filename: uploadPostModel.picture.split('/').last,
      contentType: MediaType("image", "jpeg"),
    );
    var formData = FormData.fromMap(model);

    final resp = await HttpService.patch(url, body: formData);
    print(resp);
    if (resp.data['status'].toString() == 'true') {
      return true;
    }
    return false;
  }
}
