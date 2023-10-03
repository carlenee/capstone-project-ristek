import 'package:capstone_project/services/http.dart';
import 'package:dio/dio.dart';
import 'package:http_parser/http_parser.dart';
import 'package:path/path.dart';

import 'package:capstone_project/core/environments/endpoints.dart';
import 'package:capstone_project/features/main/profile/data/model/profile_model.dart';

class ProfileDataSource {
  static Future<String> editProfile({
    required ProfileModel params,
  }) async {
    const url = Endpoints.editProfile;
    final fileExtension = extension(params.picture).toLowerCase();
    String contentType = '';

    if (fileExtension == '.jpeg' || fileExtension == '.jpg') {
      contentType = 'jpeg';
    } else if (fileExtension == '.png') {
      contentType = 'png';
    } else {
      throw UnsupportedError('Unsupported image format');
    }

    late dynamic data;

    if (params.picture.startsWith('http')) {
      data = params.toJson();
    } else {
      data = FormData.fromMap({
        "firstName": params.firstName,
        "lastName": params.lastName,
        "picture": MultipartFile.fromFile(
          params.picture,
          contentType: MediaType(
              "image", contentType), // Replace with the correct content type
        ),
        "bio": params.bio,
      });
    }

    final response = await HttpService.patch(
      url,
      body: data,
    );
    if (response.statusCode != 200) {
      throw response.data['message'];
    }

    return response.data['message'];
  }
}
