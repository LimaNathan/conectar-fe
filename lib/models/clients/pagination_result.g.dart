// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pagination_result.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_PaginationResult _$PaginationResultFromJson(Map<String, dynamic> json) =>
    _PaginationResult(
      data: (json['data'] as List<dynamic>)
          .map((e) => PaginatedClientDTO.fromJson(e as Map<String, dynamic>))
          .toList(),
      meta: PaginationMetaData.fromJson(json['meta'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$PaginationResultToJson(_PaginationResult instance) =>
    <String, dynamic>{'data': instance.data, 'meta': instance.meta};

_PaginationMetaData _$PaginationMetaDataFromJson(Map<String, dynamic> json) =>
    _PaginationMetaData(
      total: (json['total'] as num).toInt(),
      page: json['page'] as String,
      lastPage: (json['lastPage'] as num).toInt(),
      perPage: json['perPage'] as String,
    );

Map<String, dynamic> _$PaginationMetaDataToJson(_PaginationMetaData instance) =>
    <String, dynamic>{
      'total': instance.total,
      'page': instance.page,
      'lastPage': instance.lastPage,
      'perPage': instance.perPage,
    };
