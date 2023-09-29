// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'upload_post_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UploadPostModelImpl _$$UploadPostModelImplFromJson(
        Map<String, dynamic> json) =>
    _$UploadPostModelImpl(
      title: json['title'] as String,
      content: json['content'] as String,
      picture: json['picture'] as String,
    );

Map<String, dynamic> _$$UploadPostModelImplToJson(
        _$UploadPostModelImpl instance) =>
    <String, dynamic>{
      'title': instance.title,
      'content': instance.content,
      'picture': instance.picture,
    };
