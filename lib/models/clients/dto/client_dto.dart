// ignore_for_file: non_constant_identifier_names

import 'package:freezed_annotation/freezed_annotation.dart';

part 'client_dto.freezed.dart';
part 'client_dto.g.dart';

@freezed
abstract class ClientDTO with _$ClientDTO {
  const factory ClientDTO({
    required String presentationName,
    required String CNPJ,
    required String corporateReason,
    required AddressDTO address,
    required bool conectaPlus,
    required List<String> tags,
  }) = CreateClientDTO;

  const factory ClientDTO.update({
    String? presentationName,
    String? CNPJ,
    String? corporateReason,
    AddressDTO? address,
    bool? conectaPlus,
    List<String>? tags,
  }) = UpdateClientDTO;

  const factory ClientDTO.paginated({
    int? id,
    String? presentationName,
    String? corporateReason,
    String? CNPJ,
    bool? public,
    String? clientStatus,
    bool? conectaPlus,
    List<String>? tags,
    AddressDTO? address,
  }) = PaginatedClientDTO;
  factory ClientDTO.fromJson(Map<String, dynamic> json) =>
      _$ClientDTOFromJson(json);
}

@freezed
abstract class AddressDTO with _$AddressDTO {
  const factory AddressDTO({
    required String street,
    required String number,
    String? complement,
    required String district,
    required String city,
    required String state,
    required String zipCode,
    required String country,
  }) = _AddressDTO;

  factory AddressDTO.fromJson(Map<String, dynamic> json) =>
      _$AddressDTOFromJson(json);
}
