import 'package:freezed_annotation/freezed_annotation.dart';

part 'via_cep_result_dto.freezed.dart';
part 'via_cep_result_dto.g.dart';

@freezed
abstract class ViaCepResultDto with _$ViaCepResultDto {
   factory ViaCepResultDto({

     String? cep,     // "cep": "01001-000",
     String? logradouro,     // "logradouro": "Praça da Sé",
     String? complemento,     // "complemento": "lado ímpar",
     String? unidade,     // "unidade": "",
     String? bairro,     // "bairro": "Sé",
     String? localidade,     // "localidade": "São Paulo",
     String? uf,     // "uf": "SP",
     String? estado,     // "estado": "São Paulo",
     String? regiao,     // "regiao": "Sudeste",
     String? ibge,     // "ibge": "3550308",
     String? gia,     // "gia": "1004",
     String? ddd,     // "ddd": "11",
     String? siafi,     // "siafi": "7107"
   }) = _ViaCepResultDto;
   factory ViaCepResultDto.fromJson(Map<String, dynamic> json) => _$ViaCepResultDtoFromJson(json);
}

