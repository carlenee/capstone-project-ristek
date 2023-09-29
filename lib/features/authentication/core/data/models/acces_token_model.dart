import 'package:freezed_annotation/freezed_annotation.dart';

part 'acces_token_model.freezed.dart';
part 'acces_token_model.g.dart';

@freezed
class AccessTokenModel with _$AccessTokenModel {
  factory AccessTokenModel({
    required String token,
  }) = _AccessTokenModel;

  factory AccessTokenModel.fromJson(Map<String, dynamic> json) =>
      _$AccessTokenModelFromJson(json);
}
