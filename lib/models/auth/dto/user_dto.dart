import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_dto.freezed.dart';
part 'user_dto.g.dart';

@freezed
abstract class UserDTO with _$UserDTO {
  const factory UserDTO({
    required String name,
    required String email,
    required String password,
  }) = CreateUserDTO;

  const factory UserDTO.update({
    required String? name,
    required String? email,
    required String? password,
  }) = UpdateUserDTO;

  factory UserDTO.fromJson(Map<String, dynamic> json) =>
      _$UserDTOFromJson(json);
}
