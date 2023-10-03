import 'dart:convert';

import 'package:capstone_project/core/environments/endpoints.dart';
import 'package:capstone_project/features/post_detail/data/models/comment_model.dart';
import 'package:capstone_project/services/http.dart';

class CommentDataSource {
  static Future<CommentListModel> getComments(String postId) async {
    final url = '${Endpoints.getComments}$postId';
    final response = await HttpService.get(url);
    if (response.statusCode == 200) {
      return CommentListModel.fromJson(response.data);
    } else {
      throw Exception('Error fetching comments');
    }
  }

  static Future<void> postComment(String postId, String value) async {
    const url = Endpoints.postComment;
    final Map<String, dynamic> requestData = {
      'value': value,
      'postId': postId,
    };
    final response =
        await HttpService.post(url, body: json.encode(requestData));
    if (response.statusCode == 200) {
      return response.data["message"];
    } else {
      final errorMessage = response.data['message'] ?? 'Error posting comment';
      throw Exception(errorMessage);
    }
  }

  static Future<void> editComment(
      int commentId, String value, String postId) async {
    final url = '${Endpoints.editComments}$commentId';
    final Map<String, dynamic> requestData = {
      'value': value,
      'postId': postId,
    };
    final response =
        await HttpService.patch(url, body: json.encode(requestData));

    if (response.statusCode == 200) {
      return response.data["message"];
    } else {
      final errorMessage = response.data['message'] ?? 'Error edit comment';
      throw Exception(errorMessage);
    }
  }

  static Future<void> deleteComment(int commentId) async {
    final url = '${Endpoints.editComments}$commentId';

    // ignore: unused_local_variable
    final response = await HttpService.delete(url);

  }
}
