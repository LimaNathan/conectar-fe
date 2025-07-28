// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'via_cep_result_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ViaCepResultDto {

 String? get cep;// "cep": "01001-000",
 String? get logradouro;// "logradouro": "Praça da Sé",
 String? get complemento;// "complemento": "lado ímpar",
 String? get unidade;// "unidade": "",
 String? get bairro;// "bairro": "Sé",
 String? get localidade;// "localidade": "São Paulo",
 String? get uf;// "uf": "SP",
 String? get estado;// "estado": "São Paulo",
 String? get regiao;// "regiao": "Sudeste",
 String? get ibge;// "ibge": "3550308",
 String? get gia;// "gia": "1004",
 String? get ddd;// "ddd": "11",
 String? get siafi;
/// Create a copy of ViaCepResultDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ViaCepResultDtoCopyWith<ViaCepResultDto> get copyWith => _$ViaCepResultDtoCopyWithImpl<ViaCepResultDto>(this as ViaCepResultDto, _$identity);

  /// Serializes this ViaCepResultDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ViaCepResultDto&&(identical(other.cep, cep) || other.cep == cep)&&(identical(other.logradouro, logradouro) || other.logradouro == logradouro)&&(identical(other.complemento, complemento) || other.complemento == complemento)&&(identical(other.unidade, unidade) || other.unidade == unidade)&&(identical(other.bairro, bairro) || other.bairro == bairro)&&(identical(other.localidade, localidade) || other.localidade == localidade)&&(identical(other.uf, uf) || other.uf == uf)&&(identical(other.estado, estado) || other.estado == estado)&&(identical(other.regiao, regiao) || other.regiao == regiao)&&(identical(other.ibge, ibge) || other.ibge == ibge)&&(identical(other.gia, gia) || other.gia == gia)&&(identical(other.ddd, ddd) || other.ddd == ddd)&&(identical(other.siafi, siafi) || other.siafi == siafi));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,cep,logradouro,complemento,unidade,bairro,localidade,uf,estado,regiao,ibge,gia,ddd,siafi);

@override
String toString() {
  return 'ViaCepResultDto(cep: $cep, logradouro: $logradouro, complemento: $complemento, unidade: $unidade, bairro: $bairro, localidade: $localidade, uf: $uf, estado: $estado, regiao: $regiao, ibge: $ibge, gia: $gia, ddd: $ddd, siafi: $siafi)';
}


}

/// @nodoc
abstract mixin class $ViaCepResultDtoCopyWith<$Res>  {
  factory $ViaCepResultDtoCopyWith(ViaCepResultDto value, $Res Function(ViaCepResultDto) _then) = _$ViaCepResultDtoCopyWithImpl;
@useResult
$Res call({
 String? cep, String? logradouro, String? complemento, String? unidade, String? bairro, String? localidade, String? uf, String? estado, String? regiao, String? ibge, String? gia, String? ddd, String? siafi
});




}
/// @nodoc
class _$ViaCepResultDtoCopyWithImpl<$Res>
    implements $ViaCepResultDtoCopyWith<$Res> {
  _$ViaCepResultDtoCopyWithImpl(this._self, this._then);

  final ViaCepResultDto _self;
  final $Res Function(ViaCepResultDto) _then;

/// Create a copy of ViaCepResultDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? cep = freezed,Object? logradouro = freezed,Object? complemento = freezed,Object? unidade = freezed,Object? bairro = freezed,Object? localidade = freezed,Object? uf = freezed,Object? estado = freezed,Object? regiao = freezed,Object? ibge = freezed,Object? gia = freezed,Object? ddd = freezed,Object? siafi = freezed,}) {
  return _then(_self.copyWith(
cep: freezed == cep ? _self.cep : cep // ignore: cast_nullable_to_non_nullable
as String?,logradouro: freezed == logradouro ? _self.logradouro : logradouro // ignore: cast_nullable_to_non_nullable
as String?,complemento: freezed == complemento ? _self.complemento : complemento // ignore: cast_nullable_to_non_nullable
as String?,unidade: freezed == unidade ? _self.unidade : unidade // ignore: cast_nullable_to_non_nullable
as String?,bairro: freezed == bairro ? _self.bairro : bairro // ignore: cast_nullable_to_non_nullable
as String?,localidade: freezed == localidade ? _self.localidade : localidade // ignore: cast_nullable_to_non_nullable
as String?,uf: freezed == uf ? _self.uf : uf // ignore: cast_nullable_to_non_nullable
as String?,estado: freezed == estado ? _self.estado : estado // ignore: cast_nullable_to_non_nullable
as String?,regiao: freezed == regiao ? _self.regiao : regiao // ignore: cast_nullable_to_non_nullable
as String?,ibge: freezed == ibge ? _self.ibge : ibge // ignore: cast_nullable_to_non_nullable
as String?,gia: freezed == gia ? _self.gia : gia // ignore: cast_nullable_to_non_nullable
as String?,ddd: freezed == ddd ? _self.ddd : ddd // ignore: cast_nullable_to_non_nullable
as String?,siafi: freezed == siafi ? _self.siafi : siafi // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [ViaCepResultDto].
extension ViaCepResultDtoPatterns on ViaCepResultDto {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ViaCepResultDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ViaCepResultDto() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ViaCepResultDto value)  $default,){
final _that = this;
switch (_that) {
case _ViaCepResultDto():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ViaCepResultDto value)?  $default,){
final _that = this;
switch (_that) {
case _ViaCepResultDto() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? cep,  String? logradouro,  String? complemento,  String? unidade,  String? bairro,  String? localidade,  String? uf,  String? estado,  String? regiao,  String? ibge,  String? gia,  String? ddd,  String? siafi)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ViaCepResultDto() when $default != null:
return $default(_that.cep,_that.logradouro,_that.complemento,_that.unidade,_that.bairro,_that.localidade,_that.uf,_that.estado,_that.regiao,_that.ibge,_that.gia,_that.ddd,_that.siafi);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? cep,  String? logradouro,  String? complemento,  String? unidade,  String? bairro,  String? localidade,  String? uf,  String? estado,  String? regiao,  String? ibge,  String? gia,  String? ddd,  String? siafi)  $default,) {final _that = this;
switch (_that) {
case _ViaCepResultDto():
return $default(_that.cep,_that.logradouro,_that.complemento,_that.unidade,_that.bairro,_that.localidade,_that.uf,_that.estado,_that.regiao,_that.ibge,_that.gia,_that.ddd,_that.siafi);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? cep,  String? logradouro,  String? complemento,  String? unidade,  String? bairro,  String? localidade,  String? uf,  String? estado,  String? regiao,  String? ibge,  String? gia,  String? ddd,  String? siafi)?  $default,) {final _that = this;
switch (_that) {
case _ViaCepResultDto() when $default != null:
return $default(_that.cep,_that.logradouro,_that.complemento,_that.unidade,_that.bairro,_that.localidade,_that.uf,_that.estado,_that.regiao,_that.ibge,_that.gia,_that.ddd,_that.siafi);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ViaCepResultDto implements ViaCepResultDto {
   _ViaCepResultDto({this.cep, this.logradouro, this.complemento, this.unidade, this.bairro, this.localidade, this.uf, this.estado, this.regiao, this.ibge, this.gia, this.ddd, this.siafi});
  factory _ViaCepResultDto.fromJson(Map<String, dynamic> json) => _$ViaCepResultDtoFromJson(json);

@override final  String? cep;
// "cep": "01001-000",
@override final  String? logradouro;
// "logradouro": "Praça da Sé",
@override final  String? complemento;
// "complemento": "lado ímpar",
@override final  String? unidade;
// "unidade": "",
@override final  String? bairro;
// "bairro": "Sé",
@override final  String? localidade;
// "localidade": "São Paulo",
@override final  String? uf;
// "uf": "SP",
@override final  String? estado;
// "estado": "São Paulo",
@override final  String? regiao;
// "regiao": "Sudeste",
@override final  String? ibge;
// "ibge": "3550308",
@override final  String? gia;
// "gia": "1004",
@override final  String? ddd;
// "ddd": "11",
@override final  String? siafi;

/// Create a copy of ViaCepResultDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ViaCepResultDtoCopyWith<_ViaCepResultDto> get copyWith => __$ViaCepResultDtoCopyWithImpl<_ViaCepResultDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ViaCepResultDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ViaCepResultDto&&(identical(other.cep, cep) || other.cep == cep)&&(identical(other.logradouro, logradouro) || other.logradouro == logradouro)&&(identical(other.complemento, complemento) || other.complemento == complemento)&&(identical(other.unidade, unidade) || other.unidade == unidade)&&(identical(other.bairro, bairro) || other.bairro == bairro)&&(identical(other.localidade, localidade) || other.localidade == localidade)&&(identical(other.uf, uf) || other.uf == uf)&&(identical(other.estado, estado) || other.estado == estado)&&(identical(other.regiao, regiao) || other.regiao == regiao)&&(identical(other.ibge, ibge) || other.ibge == ibge)&&(identical(other.gia, gia) || other.gia == gia)&&(identical(other.ddd, ddd) || other.ddd == ddd)&&(identical(other.siafi, siafi) || other.siafi == siafi));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,cep,logradouro,complemento,unidade,bairro,localidade,uf,estado,regiao,ibge,gia,ddd,siafi);

@override
String toString() {
  return 'ViaCepResultDto(cep: $cep, logradouro: $logradouro, complemento: $complemento, unidade: $unidade, bairro: $bairro, localidade: $localidade, uf: $uf, estado: $estado, regiao: $regiao, ibge: $ibge, gia: $gia, ddd: $ddd, siafi: $siafi)';
}


}

/// @nodoc
abstract mixin class _$ViaCepResultDtoCopyWith<$Res> implements $ViaCepResultDtoCopyWith<$Res> {
  factory _$ViaCepResultDtoCopyWith(_ViaCepResultDto value, $Res Function(_ViaCepResultDto) _then) = __$ViaCepResultDtoCopyWithImpl;
@override @useResult
$Res call({
 String? cep, String? logradouro, String? complemento, String? unidade, String? bairro, String? localidade, String? uf, String? estado, String? regiao, String? ibge, String? gia, String? ddd, String? siafi
});




}
/// @nodoc
class __$ViaCepResultDtoCopyWithImpl<$Res>
    implements _$ViaCepResultDtoCopyWith<$Res> {
  __$ViaCepResultDtoCopyWithImpl(this._self, this._then);

  final _ViaCepResultDto _self;
  final $Res Function(_ViaCepResultDto) _then;

/// Create a copy of ViaCepResultDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? cep = freezed,Object? logradouro = freezed,Object? complemento = freezed,Object? unidade = freezed,Object? bairro = freezed,Object? localidade = freezed,Object? uf = freezed,Object? estado = freezed,Object? regiao = freezed,Object? ibge = freezed,Object? gia = freezed,Object? ddd = freezed,Object? siafi = freezed,}) {
  return _then(_ViaCepResultDto(
cep: freezed == cep ? _self.cep : cep // ignore: cast_nullable_to_non_nullable
as String?,logradouro: freezed == logradouro ? _self.logradouro : logradouro // ignore: cast_nullable_to_non_nullable
as String?,complemento: freezed == complemento ? _self.complemento : complemento // ignore: cast_nullable_to_non_nullable
as String?,unidade: freezed == unidade ? _self.unidade : unidade // ignore: cast_nullable_to_non_nullable
as String?,bairro: freezed == bairro ? _self.bairro : bairro // ignore: cast_nullable_to_non_nullable
as String?,localidade: freezed == localidade ? _self.localidade : localidade // ignore: cast_nullable_to_non_nullable
as String?,uf: freezed == uf ? _self.uf : uf // ignore: cast_nullable_to_non_nullable
as String?,estado: freezed == estado ? _self.estado : estado // ignore: cast_nullable_to_non_nullable
as String?,regiao: freezed == regiao ? _self.regiao : regiao // ignore: cast_nullable_to_non_nullable
as String?,ibge: freezed == ibge ? _self.ibge : ibge // ignore: cast_nullable_to_non_nullable
as String?,gia: freezed == gia ? _self.gia : gia // ignore: cast_nullable_to_non_nullable
as String?,ddd: freezed == ddd ? _self.ddd : ddd // ignore: cast_nullable_to_non_nullable
as String?,siafi: freezed == siafi ? _self.siafi : siafi // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
