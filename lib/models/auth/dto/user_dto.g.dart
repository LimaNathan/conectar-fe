// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CreateUserDTO _$CreateUserDTOFromJson(Map<String, dynamic> json) =>
    CreateUserDTO(
      name: json['name'] as String,
      email: json['email'] as String,
      password: json['password'] as String,
      role: json['role'] as String?,
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$CreateUserDTOToJson(CreateUserDTO instance) =>
    <String, dynamic>{
      'name': instance.name,
      'email': instance.email,
      'password': instance.password,
      'role': instance.role,
      'runtimeType': instance.$type,
    };

UpdateUserDTO _$UpdateUserDTOFromJson(Map<String, dynamic> json) =>
    UpdateUserDTO(
      name: json['name'] as String?,
      email: json['email'] as String?,
      role: json['role'] as String?,
      password: json['password'] as String?,
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$UpdateUserDTOToJson(UpdateUserDTO instance) =>
    <String, dynamic>{
      'name': instance.name,
      'email': instance.email,
      'role': instance.role,
      'password': instance.password,
      'runtimeType': instance.$type,
    };

PaginatedUserDTO _$PaginatedUserDTOFromJson(Map<String, dynamic> json) =>
    PaginatedUserDTO(
      id: (json['id'] as num?)?.toInt(),
      name: json['name'] as String?,
      email: json['email'] as String?,
      password: json['password'] as String?,
      role: json['role'] as String?,
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$PaginatedUserDTOToJson(PaginatedUserDTO instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'email': instance.email,
      'password': instance.password,
      'role': instance.role,
      'runtimeType': instance.$type,
    };
