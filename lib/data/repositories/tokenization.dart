// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

part 'tokenization.freezed.dart';
part 'tokenization.g.dart';

@freezed
abstract class Tokenization with _$Tokenization {
  factory Tokenization({
    @JsonKey(name: 'access_token') required String accessToken,
  }) = _Tokenization;
  factory Tokenization.fromJson(Map<String, dynamic> json) =>
      _$TokenizationFromJson(json);
}
