import 'package:conectar_users_fe/models/auth/dto/user_dto.dart';
import 'package:conectar_users_fe/models/clients/pagination_result.dart';
import 'package:freezed_annotation/freezed_annotation.dart';


part 'user_pagination_result.freezed.dart';
part 'user_pagination_result.g.dart';

@freezed
abstract class UserPaginationResult with _$UserPaginationResult {
   factory UserPaginationResult({
      required List<PaginatedUserDTO> data,
    required PaginationMetaData meta,
   }) = _UserPaginationResult;
   factory UserPaginationResult.fromJson(Map<String, dynamic> json) => _$UserPaginationResultFromJson(json);
}