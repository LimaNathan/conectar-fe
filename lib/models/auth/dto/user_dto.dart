import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_dto.freezed.dart';
part 'user_dto.g.dart';

@freezed
abstract class UserDTO with _$UserDTO {
  const factory UserDTO({
    required String name,
    required String email,
    required String password,
    String? role,
  }) = CreateUserDTO;

  const factory UserDTO.update({
    required String? name,
    required String? email,
    String? role,
    required String? password,
  }) = UpdateUserDTO;
  
  const factory UserDTO.paginated({
    int? id,
    String? name,
    String? email,
    String? password,
    String? role,
  }) = PaginatedUserDTO;

  factory UserDTO.fromJson(Map<String, dynamic> json) =>
      _$UserDTOFromJson(json);
}
