import 'package:conectar_users_fe/models/clients/dto/client_dto.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'pagination_result.freezed.dart';
part 'pagination_result.g.dart';

@freezed
abstract class ClientPaginationResult with _$ClientPaginationResult {
  factory ClientPaginationResult({
    required List<PaginatedClientDTO> data,
    required PaginationMetaData meta,
  }) = _PaginationResult;
  factory ClientPaginationResult.fromJson(Map<String, dynamic> json) =>
      _$ClientPaginationResultFromJson(json);
}

@freezed
abstract class PaginationMetaData with _$PaginationMetaData {
  factory PaginationMetaData({
    required int total,
    required String page,
    required int lastPage,
    required String perPage,
  }) = _PaginationMetaData;
  factory PaginationMetaData.fromJson(Map<String, dynamic> json) =>
      _$PaginationMetaDataFromJson(json);
}
