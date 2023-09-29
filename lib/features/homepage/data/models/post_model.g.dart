// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'post_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PostModelImpl _$$PostModelImplFromJson(Map<String, dynamic> json) =>
    _$PostModelImpl(
      id: json['id'] as String,
      title: json['title'] as String,
      content: json['content'] as String,
      photoUrl: json['photoUrl'] as String,
      photoPublicId: json['photoPublicId'] as String,
      createdAt: json['createdAt'] as String,
      updatedAt: json['updatedAt'] as String,
      userId: json['userId'] as int,
      likeCount: json['likeCount'] as int,
      dislikeCount: json['dislikeCount'] as int,
    );

Map<String, dynamic> _$$PostModelImplToJson(_$PostModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'content': instance.content,
      'photoUrl': instance.photoUrl,
      'photoPublicId': instance.photoPublicId,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
      'userId': instance.userId,
      'likeCount': instance.likeCount,
      'dislikeCount': instance.dislikeCount,
    };
