// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_pagination_result.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_UserPaginationResult _$UserPaginationResultFromJson(
  Map<String, dynamic> json,
) => _UserPaginationResult(
  data: (json['data'] as List<dynamic>)
      .map((e) => PaginatedUserDTO.fromJson(e as Map<String, dynamic>))
      .toList(),
  meta: PaginationMetaData.fromJson(json['meta'] as Map<String, dynamic>),
);

Map<String, dynamic> _$UserPaginationResultToJson(
  _UserPaginationResult instance,
) => <String, dynamic>{'data': instance.data, 'meta': instance.meta};
