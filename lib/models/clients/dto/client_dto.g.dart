// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'client_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CreateClientDTO _$CreateClientDTOFromJson(Map<String, dynamic> json) =>
    CreateClientDTO(
      presentationName: json['presentationName'] as String,
      CNPJ: json['CNPJ'] as String,
      corporateReason: json['corporateReason'] as String,
      address: json['address'] as Map<String, dynamic>,
      conectaPlus: json['conectaPlus'] as bool,
      tags: (json['tags'] as List<dynamic>).map((e) => e as String).toList(),
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$CreateClientDTOToJson(CreateClientDTO instance) =>
    <String, dynamic>{
      'presentationName': instance.presentationName,
      'CNPJ': instance.CNPJ,
      'corporateReason': instance.corporateReason,
      'address': instance.address,
      'conectaPlus': instance.conectaPlus,
      'tags': instance.tags,
      'runtimeType': instance.$type,
    };

UpdateClientDTO _$UpdateClientDTOFromJson(Map<String, dynamic> json) =>
    UpdateClientDTO(
      presentationName: json['presentationName'] as String?,
      CNPJ: json['CNPJ'] as String?,
      corporateReason: json['corporateReason'] as String?,
      address: json['address'] as Map<String, dynamic>?,
      conectaPlus: json['conectaPlus'] as bool?,
      tags: (json['tags'] as List<dynamic>?)?.map((e) => e as String).toList(),
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$UpdateClientDTOToJson(UpdateClientDTO instance) =>
    <String, dynamic>{
      'presentationName': instance.presentationName,
      'CNPJ': instance.CNPJ,
      'corporateReason': instance.corporateReason,
      'address': instance.address,
      'conectaPlus': instance.conectaPlus,
      'tags': instance.tags,
      'runtimeType': instance.$type,
    };

PaginatedClientDTO _$PaginatedClientDTOFromJson(Map<String, dynamic> json) =>
    PaginatedClientDTO(
      id: (json['id'] as num?)?.toInt(),
      presentationName: json['presentationName'] as String?,
      corporateReason: json['corporateReason'] as String?,
      CNPJ: json['CNPJ'] as String?,
      public: json['public'] as bool?,
      clientStatus: json['clientStatus'] as String?,
      conectaPlus: json['conectaPlus'] as bool?,
      tags: (json['tags'] as List<dynamic>?)?.map((e) => e as String).toList(),
      address: json['address'] == null
          ? null
          : AddressDTO.fromJson(json['address'] as Map<String, dynamic>),
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$PaginatedClientDTOToJson(PaginatedClientDTO instance) =>
    <String, dynamic>{
      'id': instance.id,
      'presentationName': instance.presentationName,
      'corporateReason': instance.corporateReason,
      'CNPJ': instance.CNPJ,
      'public': instance.public,
      'clientStatus': instance.clientStatus,
      'conectaPlus': instance.conectaPlus,
      'tags': instance.tags,
      'address': instance.address,
      'runtimeType': instance.$type,
    };

_AddressDTO _$AddressDTOFromJson(Map<String, dynamic> json) => _AddressDTO(
  street: json['street'] as String,
  number: json['number'] as String,
  complement: json['complement'] as String?,
  district: json['district'] as String,
  city: json['city'] as String,
  state: json['state'] as String,
  zipCode: json['zipCode'] as String,
  country: json['country'] as String,
);

Map<String, dynamic> _$AddressDTOToJson(_AddressDTO instance) =>
    <String, dynamic>{
      'street': instance.street,
      'number': instance.number,
      'complement': instance.complement,
      'district': instance.district,
      'city': instance.city,
      'state': instance.state,
      'zipCode': instance.zipCode,
      'country': instance.country,
    };
