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
abstract class _$$UploadPostModelImplCopyWith<$Res>
    implements $UploadPostModelCopyWith<$Res> {
  factory _$$UploadPostModelImplCopyWith(_$UploadPostModelImpl value,
          $Res Function(_$UploadPostModelImpl) then) =
      __$$UploadPostModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String title, String content, String picture});
}

/// @nodoc
class __$$UploadPostModelImplCopyWithImpl<$Res>
    extends _$UploadPostModelCopyWithImpl<$Res, _$UploadPostModelImpl>
    implements _$$UploadPostModelImplCopyWith<$Res> {
  __$$UploadPostModelImplCopyWithImpl(
      _$UploadPostModelImpl _value, $Res Function(_$UploadPostModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
    Object? content = null,
    Object? picture = null,
  }) {
    return _then(_$UploadPostModelImpl(
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
class _$UploadPostModelImpl implements _UploadPostModel {
  const _$UploadPostModelImpl(
      {required this.title, required this.content, required this.picture});

  factory _$UploadPostModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$UploadPostModelImplFromJson(json);

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
            other is _$UploadPostModelImpl &&
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
  _$$UploadPostModelImplCopyWith<_$UploadPostModelImpl> get copyWith =>
      __$$UploadPostModelImplCopyWithImpl<_$UploadPostModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UploadPostModelImplToJson(
      this,
    );
  }
}

abstract class _UploadPostModel implements UploadPostModel {
  const factory _UploadPostModel(
      {required final String title,
      required final String content,
      required final String picture}) = _$UploadPostModelImpl;

  factory _UploadPostModel.fromJson(Map<String, dynamic> json) =
      _$UploadPostModelImpl.fromJson;

  @override
  String get title;
  @override
  String get content;
  @override
  String get picture;
  @override
  @JsonKey(ignore: true)
  _$$UploadPostModelImplCopyWith<_$UploadPostModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
