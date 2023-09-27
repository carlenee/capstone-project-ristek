// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'upload_post_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

UploadPostModel _$UploadPostModelFromJson(Map<String, dynamic> json) {
  return _UploadPostModel.fromJson(json);
}

/// @nodoc
mixin _$UploadPostModel {
  String get title => throw _privateConstructorUsedError;
  String get content => throw _privateConstructorUsedError;
  String get picture => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UploadPostModelCopyWith<UploadPostModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UploadPostModelCopyWith<$Res> {
  factory $UploadPostModelCopyWith(
          UploadPostModel value, $Res Function(UploadPostModel) then) =
      _$UploadPostModelCopyWithImpl<$Res, UploadPostModel>;
  @useResult
  $Res call({String title, String content, String picture});
}

/// @nodoc
class _$UploadPostModelCopyWithImpl<$Res, $Val extends UploadPostModel>
    implements $UploadPostModelCopyWith<$Res> {
  _$UploadPostModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
    Object? content = null,
    Object? picture = null,
  }) {
    return _then(_value.copyWith(
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      content: null == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String,
      picture: null == picture
          ? _value.picture
          : picture // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_UploadPostModelCopyWith<$Res>
    implements $UploadPostModelCopyWith<$Res> {
  factory _$$_UploadPostModelCopyWith(
          _$_UploadPostModel value, $Res Function(_$_UploadPostModel) then) =
      __$$_UploadPostModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String title, String content, String picture});
}

/// @nodoc
class __$$_UploadPostModelCopyWithImpl<$Res>
    extends _$UploadPostModelCopyWithImpl<$Res, _$_UploadPostModel>
    implements _$$_UploadPostModelCopyWith<$Res> {
  __$$_UploadPostModelCopyWithImpl(
      _$_UploadPostModel _value, $Res Function(_$_UploadPostModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
    Object? content = null,
    Object? picture = null,
  }) {
    return _then(_$_UploadPostModel(
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      content: null == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String,
      picture: null == picture
          ? _value.picture
          : picture // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_UploadPostModel implements _UploadPostModel {
  const _$_UploadPostModel(
      {required this.title, required this.content, required this.picture});

  factory _$_UploadPostModel.fromJson(Map<String, dynamic> json) =>
      _$$_UploadPostModelFromJson(json);

  @override
  final String title;
  @override
  final String content;
  @override
  final String picture;

  @override
  String toString() {
    return 'UploadPostModel(title: $title, content: $content, picture: $picture)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_UploadPostModel &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.content, content) || other.content == content) &&
            (identical(other.picture, picture) || other.picture == picture));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, title, content, picture);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_UploadPostModelCopyWith<_$_UploadPostModel> get copyWith =>
      __$$_UploadPostModelCopyWithImpl<_$_UploadPostModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_UploadPostModelToJson(
      this,
    );
  }
}

abstract class _UploadPostModel implements UploadPostModel {
  const factory _UploadPostModel(
      {required final String title,
      required final String content,
      required final String picture}) = _$_UploadPostModel;

  factory _UploadPostModel.fromJson(Map<String, dynamic> json) =
      _$_UploadPostModel.fromJson;

  @override
  String get title;
  @override
  String get content;
  @override
  String get picture;
  @override
  @JsonKey(ignore: true)
  _$$_UploadPostModelCopyWith<_$_UploadPostModel> get copyWith =>
      throw _privateConstructorUsedError;
}
