import 'package:freezed_annotation/freezed_annotation.dart';

part 'upload_post_model.freezed.dart';

part 'upload_post_model.g.dart';

@freezed
class UploadPostModel with _$UploadPostModel {
  const factory UploadPostModel({
    required String title,
    required String content,
    required String picture,
    String? id,
  }) = _UploadPostModel;

  factory UploadPostModel.fromJson(Map<String, Object?> json) =>
      _$UploadPostModelFromJson(json);
}
