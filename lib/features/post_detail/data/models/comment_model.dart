import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'comment_model.freezed.dart';

part 'comment_model.g.dart';

@freezed
class CommentListModel with _$CommentListModel {
  const factory CommentListModel({
    required List<CommentModel> data,
    required String message,
    required bool status,
 

  }) = _CommentListModel;

  factory CommentListModel.fromJson(Map<String, Object?> json) =>
      _$CommentListModelFromJson(json);
}

@freezed
class CommentModel with _$CommentModel {
  const factory CommentModel({
    required int id,
    required String value,
    required String createdAt,
    required String updatedAt,
    required int userId,
    required String postId

  }) = _CommentModel;

  factory CommentModel.fromJson(Map<String, Object?> json) =>
      _$CommentModelFromJson(json);
}