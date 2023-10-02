import 'package:capstone_project/core/client/api_call.dart';
import 'package:capstone_project/core/errors/failure.dart';
import 'package:capstone_project/features/post_detail/data/datasource/comment_datasource.dart';
import 'package:capstone_project/features/post_detail/data/models/comment_model.dart';
import 'package:either_dart/either.dart';

class CommentRepository {
  static Future<Either<Fail, CommentListModel>> getComments(
      String postId) async {
    return await apiCall(CommentDataSource.getComments(postId));
  }

  static Future<Either<Fail, void>> editComment(
      int commentId, String value, String postId) async {
    return await apiCall(
        CommentDataSource.editComment(commentId, value, postId));
  }

  static Future<void> deleteComment(int commentId) async {
    return await CommentDataSource.deleteComment(commentId);
  }

  static Future<Either<Fail, void>> postComment(
      String postId, String value) async {
    return await apiCall(CommentDataSource.postComment(postId, value));
  }
}
