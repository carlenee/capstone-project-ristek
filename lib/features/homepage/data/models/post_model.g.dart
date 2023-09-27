// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: non_constant_identifier_names

part of 'post_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_PostModel _$$_PostModelFromJson(Map<String, dynamic> json) => _$_PostModel(
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

Map<String, dynamic> _$$_PostModelToJson(_$_PostModel instance) =>
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
