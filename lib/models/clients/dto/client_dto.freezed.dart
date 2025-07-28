// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'client_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
ClientDTO _$ClientDTOFromJson(
  Map<String, dynamic> json
) {
        switch (json['runtimeType']) {
                  case 'default':
          return CreateClientDTO.fromJson(
            json
          );
                case 'update':
          return UpdateClientDTO.fromJson(
            json
          );
                case 'paginated':
          return PaginatedClientDTO.fromJson(
            json
          );
        
          default:
            throw CheckedFromJsonException(
  json,
  'runtimeType',
  'ClientDTO',
  'Invalid union type "${json['runtimeType']}"!'
);
        }
      
}

/// @nodoc
mixin _$ClientDTO {

 String? get presentationName; String? get CNPJ; String? get corporateReason; Object? get address; bool? get conectaPlus; List<String>? get tags;
/// Create a copy of ClientDTO
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ClientDTOCopyWith<ClientDTO> get copyWith => _$ClientDTOCopyWithImpl<ClientDTO>(this as ClientDTO, _$identity);

  /// Serializes this ClientDTO to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ClientDTO&&(identical(other.presentationName, presentationName) || other.presentationName == presentationName)&&(identical(other.CNPJ, CNPJ) || other.CNPJ == CNPJ)&&(identical(other.corporateReason, corporateReason) || other.corporateReason == corporateReason)&&const DeepCollectionEquality().equals(other.address, address)&&(identical(other.conectaPlus, conectaPlus) || other.conectaPlus == conectaPlus)&&const DeepCollectionEquality().equals(other.tags, tags));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,presentationName,CNPJ,corporateReason,const DeepCollectionEquality().hash(address),conectaPlus,const DeepCollectionEquality().hash(tags));

@override
String toString() {
  return 'ClientDTO(presentationName: $presentationName, CNPJ: $CNPJ, corporateReason: $corporateReason, address: $address, conectaPlus: $conectaPlus, tags: $tags)';
}


}

/// @nodoc
abstract mixin class $ClientDTOCopyWith<$Res>  {
  factory $ClientDTOCopyWith(ClientDTO value, $Res Function(ClientDTO) _then) = _$ClientDTOCopyWithImpl;
@useResult
$Res call({
 String presentationName, String CNPJ, String corporateReason, bool conectaPlus, List<String> tags
});




}
/// @nodoc
class _$ClientDTOCopyWithImpl<$Res>
    implements $ClientDTOCopyWith<$Res> {
  _$ClientDTOCopyWithImpl(this._self, this._then);

  final ClientDTO _self;
  final $Res Function(ClientDTO) _then;

/// Create a copy of ClientDTO
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? presentationName = null,Object? CNPJ = null,Object? corporateReason = null,Object? conectaPlus = null,Object? tags = null,}) {
  return _then(_self.copyWith(
presentationName: null == presentationName ? _self.presentationName! : presentationName // ignore: cast_nullable_to_non_nullable
as String,CNPJ: null == CNPJ ? _self.CNPJ! : CNPJ // ignore: cast_nullable_to_non_nullable
as String,corporateReason: null == corporateReason ? _self.corporateReason! : corporateReason // ignore: cast_nullable_to_non_nullable
as String,conectaPlus: null == conectaPlus ? _self.conectaPlus! : conectaPlus // ignore: cast_nullable_to_non_nullable
as bool,tags: null == tags ? _self.tags! : tags // ignore: cast_nullable_to_non_nullable
as List<String>,
  ));
}

}


/// Adds pattern-matching-related methods to [ClientDTO].
extension ClientDTOPatterns on ClientDTO {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( CreateClientDTO value)?  $default,{TResult Function( UpdateClientDTO value)?  update,TResult Function( PaginatedClientDTO value)?  paginated,required TResult orElse(),}){
final _that = this;
switch (_that) {
case CreateClientDTO() when $default != null:
return $default(_that);case UpdateClientDTO() when update != null:
return update(_that);case PaginatedClientDTO() when paginated != null:
return paginated(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( CreateClientDTO value)  $default,{required TResult Function( UpdateClientDTO value)  update,required TResult Function( PaginatedClientDTO value)  paginated,}){
final _that = this;
switch (_that) {
case CreateClientDTO():
return $default(_that);case UpdateClientDTO():
return update(_that);case PaginatedClientDTO():
return paginated(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( CreateClientDTO value)?  $default,{TResult? Function( UpdateClientDTO value)?  update,TResult? Function( PaginatedClientDTO value)?  paginated,}){
final _that = this;
switch (_that) {
case CreateClientDTO() when $default != null:
return $default(_that);case UpdateClientDTO() when update != null:
return update(_that);case PaginatedClientDTO() when paginated != null:
return paginated(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String presentationName,  String CNPJ,  String corporateReason,  Map<String, dynamic> address,  bool conectaPlus,  List<String> tags)?  $default,{TResult Function( String? presentationName,  String? CNPJ,  String? corporateReason,  Map<String, dynamic>? address,  bool? conectaPlus,  List<String>? tags)?  update,TResult Function( int? id,  String? presentationName,  String? corporateReason,  String? CNPJ,  bool? public,  String? clientStatus,  bool? conectaPlus,  List<String>? tags,  AddressDTO? address)?  paginated,required TResult orElse(),}) {final _that = this;
switch (_that) {
case CreateClientDTO() when $default != null:
return $default(_that.presentationName,_that.CNPJ,_that.corporateReason,_that.address,_that.conectaPlus,_that.tags);case UpdateClientDTO() when update != null:
return update(_that.presentationName,_that.CNPJ,_that.corporateReason,_that.address,_that.conectaPlus,_that.tags);case PaginatedClientDTO() when paginated != null:
return paginated(_that.id,_that.presentationName,_that.corporateReason,_that.CNPJ,_that.public,_that.clientStatus,_that.conectaPlus,_that.tags,_that.address);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String presentationName,  String CNPJ,  String corporateReason,  Map<String, dynamic> address,  bool conectaPlus,  List<String> tags)  $default,{required TResult Function( String? presentationName,  String? CNPJ,  String? corporateReason,  Map<String, dynamic>? address,  bool? conectaPlus,  List<String>? tags)  update,required TResult Function( int? id,  String? presentationName,  String? corporateReason,  String? CNPJ,  bool? public,  String? clientStatus,  bool? conectaPlus,  List<String>? tags,  AddressDTO? address)  paginated,}) {final _that = this;
switch (_that) {
case CreateClientDTO():
return $default(_that.presentationName,_that.CNPJ,_that.corporateReason,_that.address,_that.conectaPlus,_that.tags);case UpdateClientDTO():
return update(_that.presentationName,_that.CNPJ,_that.corporateReason,_that.address,_that.conectaPlus,_that.tags);case PaginatedClientDTO():
return paginated(_that.id,_that.presentationName,_that.corporateReason,_that.CNPJ,_that.public,_that.clientStatus,_that.conectaPlus,_that.tags,_that.address);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String presentationName,  String CNPJ,  String corporateReason,  Map<String, dynamic> address,  bool conectaPlus,  List<String> tags)?  $default,{TResult? Function( String? presentationName,  String? CNPJ,  String? corporateReason,  Map<String, dynamic>? address,  bool? conectaPlus,  List<String>? tags)?  update,TResult? Function( int? id,  String? presentationName,  String? corporateReason,  String? CNPJ,  bool? public,  String? clientStatus,  bool? conectaPlus,  List<String>? tags,  AddressDTO? address)?  paginated,}) {final _that = this;
switch (_that) {
case CreateClientDTO() when $default != null:
return $default(_that.presentationName,_that.CNPJ,_that.corporateReason,_that.address,_that.conectaPlus,_that.tags);case UpdateClientDTO() when update != null:
return update(_that.presentationName,_that.CNPJ,_that.corporateReason,_that.address,_that.conectaPlus,_that.tags);case PaginatedClientDTO() when paginated != null:
return paginated(_that.id,_that.presentationName,_that.corporateReason,_that.CNPJ,_that.public,_that.clientStatus,_that.conectaPlus,_that.tags,_that.address);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class CreateClientDTO implements ClientDTO {
  const CreateClientDTO({required this.presentationName, required this.CNPJ, required this.corporateReason, required final  Map<String, dynamic> address, required this.conectaPlus, required final  List<String> tags, final  String? $type}): _address = address,_tags = tags,$type = $type ?? 'default';
  factory CreateClientDTO.fromJson(Map<String, dynamic> json) => _$CreateClientDTOFromJson(json);

@override final  String presentationName;
@override final  String CNPJ;
@override final  String corporateReason;
 final  Map<String, dynamic> _address;
@override Map<String, dynamic> get address {
  if (_address is EqualUnmodifiableMapView) return _address;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_address);
}

@override final  bool conectaPlus;
 final  List<String> _tags;
@override List<String> get tags {
  if (_tags is EqualUnmodifiableListView) return _tags;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_tags);
}


@JsonKey(name: 'runtimeType')
final String $type;


/// Create a copy of ClientDTO
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CreateClientDTOCopyWith<CreateClientDTO> get copyWith => _$CreateClientDTOCopyWithImpl<CreateClientDTO>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CreateClientDTOToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CreateClientDTO&&(identical(other.presentationName, presentationName) || other.presentationName == presentationName)&&(identical(other.CNPJ, CNPJ) || other.CNPJ == CNPJ)&&(identical(other.corporateReason, corporateReason) || other.corporateReason == corporateReason)&&const DeepCollectionEquality().equals(other._address, _address)&&(identical(other.conectaPlus, conectaPlus) || other.conectaPlus == conectaPlus)&&const DeepCollectionEquality().equals(other._tags, _tags));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,presentationName,CNPJ,corporateReason,const DeepCollectionEquality().hash(_address),conectaPlus,const DeepCollectionEquality().hash(_tags));

@override
String toString() {
  return 'ClientDTO(presentationName: $presentationName, CNPJ: $CNPJ, corporateReason: $corporateReason, address: $address, conectaPlus: $conectaPlus, tags: $tags)';
}


}

/// @nodoc
abstract mixin class $CreateClientDTOCopyWith<$Res> implements $ClientDTOCopyWith<$Res> {
  factory $CreateClientDTOCopyWith(CreateClientDTO value, $Res Function(CreateClientDTO) _then) = _$CreateClientDTOCopyWithImpl;
@override @useResult
$Res call({
 String presentationName, String CNPJ, String corporateReason, Map<String, dynamic> address, bool conectaPlus, List<String> tags
});




}
/// @nodoc
class _$CreateClientDTOCopyWithImpl<$Res>
    implements $CreateClientDTOCopyWith<$Res> {
  _$CreateClientDTOCopyWithImpl(this._self, this._then);

  final CreateClientDTO _self;
  final $Res Function(CreateClientDTO) _then;

/// Create a copy of ClientDTO
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? presentationName = null,Object? CNPJ = null,Object? corporateReason = null,Object? address = null,Object? conectaPlus = null,Object? tags = null,}) {
  return _then(CreateClientDTO(
presentationName: null == presentationName ? _self.presentationName : presentationName // ignore: cast_nullable_to_non_nullable
as String,CNPJ: null == CNPJ ? _self.CNPJ : CNPJ // ignore: cast_nullable_to_non_nullable
as String,corporateReason: null == corporateReason ? _self.corporateReason : corporateReason // ignore: cast_nullable_to_non_nullable
as String,address: null == address ? _self._address : address // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>,conectaPlus: null == conectaPlus ? _self.conectaPlus : conectaPlus // ignore: cast_nullable_to_non_nullable
as bool,tags: null == tags ? _self._tags : tags // ignore: cast_nullable_to_non_nullable
as List<String>,
  ));
}


}

/// @nodoc
@JsonSerializable()

class UpdateClientDTO implements ClientDTO {
  const UpdateClientDTO({this.presentationName, this.CNPJ, this.corporateReason, final  Map<String, dynamic>? address, this.conectaPlus, final  List<String>? tags, final  String? $type}): _address = address,_tags = tags,$type = $type ?? 'update';
  factory UpdateClientDTO.fromJson(Map<String, dynamic> json) => _$UpdateClientDTOFromJson(json);

@override final  String? presentationName;
@override final  String? CNPJ;
@override final  String? corporateReason;
 final  Map<String, dynamic>? _address;
@override Map<String, dynamic>? get address {
  final value = _address;
  if (value == null) return null;
  if (_address is EqualUnmodifiableMapView) return _address;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(value);
}

@override final  bool? conectaPlus;
 final  List<String>? _tags;
@override List<String>? get tags {
  final value = _tags;
  if (value == null) return null;
  if (_tags is EqualUnmodifiableListView) return _tags;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}


@JsonKey(name: 'runtimeType')
final String $type;


/// Create a copy of ClientDTO
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UpdateClientDTOCopyWith<UpdateClientDTO> get copyWith => _$UpdateClientDTOCopyWithImpl<UpdateClientDTO>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$UpdateClientDTOToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UpdateClientDTO&&(identical(other.presentationName, presentationName) || other.presentationName == presentationName)&&(identical(other.CNPJ, CNPJ) || other.CNPJ == CNPJ)&&(identical(other.corporateReason, corporateReason) || other.corporateReason == corporateReason)&&const DeepCollectionEquality().equals(other._address, _address)&&(identical(other.conectaPlus, conectaPlus) || other.conectaPlus == conectaPlus)&&const DeepCollectionEquality().equals(other._tags, _tags));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,presentationName,CNPJ,corporateReason,const DeepCollectionEquality().hash(_address),conectaPlus,const DeepCollectionEquality().hash(_tags));

@override
String toString() {
  return 'ClientDTO.update(presentationName: $presentationName, CNPJ: $CNPJ, corporateReason: $corporateReason, address: $address, conectaPlus: $conectaPlus, tags: $tags)';
}


}

/// @nodoc
abstract mixin class $UpdateClientDTOCopyWith<$Res> implements $ClientDTOCopyWith<$Res> {
  factory $UpdateClientDTOCopyWith(UpdateClientDTO value, $Res Function(UpdateClientDTO) _then) = _$UpdateClientDTOCopyWithImpl;
@override @useResult
$Res call({
 String? presentationName, String? CNPJ, String? corporateReason, Map<String, dynamic>? address, bool? conectaPlus, List<String>? tags
});




}
/// @nodoc
class _$UpdateClientDTOCopyWithImpl<$Res>
    implements $UpdateClientDTOCopyWith<$Res> {
  _$UpdateClientDTOCopyWithImpl(this._self, this._then);

  final UpdateClientDTO _self;
  final $Res Function(UpdateClientDTO) _then;

/// Create a copy of ClientDTO
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? presentationName = freezed,Object? CNPJ = freezed,Object? corporateReason = freezed,Object? address = freezed,Object? conectaPlus = freezed,Object? tags = freezed,}) {
  return _then(UpdateClientDTO(
presentationName: freezed == presentationName ? _self.presentationName : presentationName // ignore: cast_nullable_to_non_nullable
as String?,CNPJ: freezed == CNPJ ? _self.CNPJ : CNPJ // ignore: cast_nullable_to_non_nullable
as String?,corporateReason: freezed == corporateReason ? _self.corporateReason : corporateReason // ignore: cast_nullable_to_non_nullable
as String?,address: freezed == address ? _self._address : address // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>?,conectaPlus: freezed == conectaPlus ? _self.conectaPlus : conectaPlus // ignore: cast_nullable_to_non_nullable
as bool?,tags: freezed == tags ? _self._tags : tags // ignore: cast_nullable_to_non_nullable
as List<String>?,
  ));
}


}

/// @nodoc
@JsonSerializable()

class PaginatedClientDTO implements ClientDTO {
  const PaginatedClientDTO({this.id, this.presentationName, this.corporateReason, this.CNPJ, this.public, this.clientStatus, this.conectaPlus, final  List<String>? tags, this.address, final  String? $type}): _tags = tags,$type = $type ?? 'paginated';
  factory PaginatedClientDTO.fromJson(Map<String, dynamic> json) => _$PaginatedClientDTOFromJson(json);

 final  int? id;
@override final  String? presentationName;
@override final  String? corporateReason;
@override final  String? CNPJ;
 final  bool? public;
 final  String? clientStatus;
@override final  bool? conectaPlus;
 final  List<String>? _tags;
@override List<String>? get tags {
  final value = _tags;
  if (value == null) return null;
  if (_tags is EqualUnmodifiableListView) return _tags;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

@override final  AddressDTO? address;

@JsonKey(name: 'runtimeType')
final String $type;


/// Create a copy of ClientDTO
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PaginatedClientDTOCopyWith<PaginatedClientDTO> get copyWith => _$PaginatedClientDTOCopyWithImpl<PaginatedClientDTO>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PaginatedClientDTOToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PaginatedClientDTO&&(identical(other.id, id) || other.id == id)&&(identical(other.presentationName, presentationName) || other.presentationName == presentationName)&&(identical(other.corporateReason, corporateReason) || other.corporateReason == corporateReason)&&(identical(other.CNPJ, CNPJ) || other.CNPJ == CNPJ)&&(identical(other.public, public) || other.public == public)&&(identical(other.clientStatus, clientStatus) || other.clientStatus == clientStatus)&&(identical(other.conectaPlus, conectaPlus) || other.conectaPlus == conectaPlus)&&const DeepCollectionEquality().equals(other._tags, _tags)&&(identical(other.address, address) || other.address == address));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,presentationName,corporateReason,CNPJ,public,clientStatus,conectaPlus,const DeepCollectionEquality().hash(_tags),address);

@override
String toString() {
  return 'ClientDTO.paginated(id: $id, presentationName: $presentationName, corporateReason: $corporateReason, CNPJ: $CNPJ, public: $public, clientStatus: $clientStatus, conectaPlus: $conectaPlus, tags: $tags, address: $address)';
}


}

/// @nodoc
abstract mixin class $PaginatedClientDTOCopyWith<$Res> implements $ClientDTOCopyWith<$Res> {
  factory $PaginatedClientDTOCopyWith(PaginatedClientDTO value, $Res Function(PaginatedClientDTO) _then) = _$PaginatedClientDTOCopyWithImpl;
@override @useResult
$Res call({
 int? id, String? presentationName, String? corporateReason, String? CNPJ, bool? public, String? clientStatus, bool? conectaPlus, List<String>? tags, AddressDTO? address
});


$AddressDTOCopyWith<$Res>? get address;

}
/// @nodoc
class _$PaginatedClientDTOCopyWithImpl<$Res>
    implements $PaginatedClientDTOCopyWith<$Res> {
  _$PaginatedClientDTOCopyWithImpl(this._self, this._then);

  final PaginatedClientDTO _self;
  final $Res Function(PaginatedClientDTO) _then;

/// Create a copy of ClientDTO
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? presentationName = freezed,Object? corporateReason = freezed,Object? CNPJ = freezed,Object? public = freezed,Object? clientStatus = freezed,Object? conectaPlus = freezed,Object? tags = freezed,Object? address = freezed,}) {
  return _then(PaginatedClientDTO(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,presentationName: freezed == presentationName ? _self.presentationName : presentationName // ignore: cast_nullable_to_non_nullable
as String?,corporateReason: freezed == corporateReason ? _self.corporateReason : corporateReason // ignore: cast_nullable_to_non_nullable
as String?,CNPJ: freezed == CNPJ ? _self.CNPJ : CNPJ // ignore: cast_nullable_to_non_nullable
as String?,public: freezed == public ? _self.public : public // ignore: cast_nullable_to_non_nullable
as bool?,clientStatus: freezed == clientStatus ? _self.clientStatus : clientStatus // ignore: cast_nullable_to_non_nullable
as String?,conectaPlus: freezed == conectaPlus ? _self.conectaPlus : conectaPlus // ignore: cast_nullable_to_non_nullable
as bool?,tags: freezed == tags ? _self._tags : tags // ignore: cast_nullable_to_non_nullable
as List<String>?,address: freezed == address ? _self.address : address // ignore: cast_nullable_to_non_nullable
as AddressDTO?,
  ));
}

/// Create a copy of ClientDTO
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AddressDTOCopyWith<$Res>? get address {
    if (_self.address == null) {
    return null;
  }

  return $AddressDTOCopyWith<$Res>(_self.address!, (value) {
    return _then(_self.copyWith(address: value));
  });
}
}


/// @nodoc
mixin _$AddressDTO {

 String get street; String get number; String? get complement; String get district; String get city; String get state; String get zipCode; String get country;
/// Create a copy of AddressDTO
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AddressDTOCopyWith<AddressDTO> get copyWith => _$AddressDTOCopyWithImpl<AddressDTO>(this as AddressDTO, _$identity);

  /// Serializes this AddressDTO to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AddressDTO&&(identical(other.street, street) || other.street == street)&&(identical(other.number, number) || other.number == number)&&(identical(other.complement, complement) || other.complement == complement)&&(identical(other.district, district) || other.district == district)&&(identical(other.city, city) || other.city == city)&&(identical(other.state, state) || other.state == state)&&(identical(other.zipCode, zipCode) || other.zipCode == zipCode)&&(identical(other.country, country) || other.country == country));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,street,number,complement,district,city,state,zipCode,country);

@override
String toString() {
  return 'AddressDTO(street: $street, number: $number, complement: $complement, district: $district, city: $city, state: $state, zipCode: $zipCode, country: $country)';
}


}

/// @nodoc
abstract mixin class $AddressDTOCopyWith<$Res>  {
  factory $AddressDTOCopyWith(AddressDTO value, $Res Function(AddressDTO) _then) = _$AddressDTOCopyWithImpl;
@useResult
$Res call({
 String street, String number, String? complement, String district, String city, String state, String zipCode, String country
});




}
/// @nodoc
class _$AddressDTOCopyWithImpl<$Res>
    implements $AddressDTOCopyWith<$Res> {
  _$AddressDTOCopyWithImpl(this._self, this._then);

  final AddressDTO _self;
  final $Res Function(AddressDTO) _then;

/// Create a copy of AddressDTO
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? street = null,Object? number = null,Object? complement = freezed,Object? district = null,Object? city = null,Object? state = null,Object? zipCode = null,Object? country = null,}) {
  return _then(_self.copyWith(
street: null == street ? _self.street : street // ignore: cast_nullable_to_non_nullable
as String,number: null == number ? _self.number : number // ignore: cast_nullable_to_non_nullable
as String,complement: freezed == complement ? _self.complement : complement // ignore: cast_nullable_to_non_nullable
as String?,district: null == district ? _self.district : district // ignore: cast_nullable_to_non_nullable
as String,city: null == city ? _self.city : city // ignore: cast_nullable_to_non_nullable
as String,state: null == state ? _self.state : state // ignore: cast_nullable_to_non_nullable
as String,zipCode: null == zipCode ? _self.zipCode : zipCode // ignore: cast_nullable_to_non_nullable
as String,country: null == country ? _self.country : country // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [AddressDTO].
extension AddressDTOPatterns on AddressDTO {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AddressDTO value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AddressDTO() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AddressDTO value)  $default,){
final _that = this;
switch (_that) {
case _AddressDTO():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AddressDTO value)?  $default,){
final _that = this;
switch (_that) {
case _AddressDTO() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String street,  String number,  String? complement,  String district,  String city,  String state,  String zipCode,  String country)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AddressDTO() when $default != null:
return $default(_that.street,_that.number,_that.complement,_that.district,_that.city,_that.state,_that.zipCode,_that.country);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String street,  String number,  String? complement,  String district,  String city,  String state,  String zipCode,  String country)  $default,) {final _that = this;
switch (_that) {
case _AddressDTO():
return $default(_that.street,_that.number,_that.complement,_that.district,_that.city,_that.state,_that.zipCode,_that.country);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String street,  String number,  String? complement,  String district,  String city,  String state,  String zipCode,  String country)?  $default,) {final _that = this;
switch (_that) {
case _AddressDTO() when $default != null:
return $default(_that.street,_that.number,_that.complement,_that.district,_that.city,_that.state,_that.zipCode,_that.country);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _AddressDTO implements AddressDTO {
   _AddressDTO({required this.street, required this.number, this.complement, required this.district, required this.city, required this.state, required this.zipCode, required this.country});
  factory _AddressDTO.fromJson(Map<String, dynamic> json) => _$AddressDTOFromJson(json);

@override final  String street;
@override final  String number;
@override final  String? complement;
@override final  String district;
@override final  String city;
@override final  String state;
@override final  String zipCode;
@override final  String country;

/// Create a copy of AddressDTO
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AddressDTOCopyWith<_AddressDTO> get copyWith => __$AddressDTOCopyWithImpl<_AddressDTO>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$AddressDTOToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AddressDTO&&(identical(other.street, street) || other.street == street)&&(identical(other.number, number) || other.number == number)&&(identical(other.complement, complement) || other.complement == complement)&&(identical(other.district, district) || other.district == district)&&(identical(other.city, city) || other.city == city)&&(identical(other.state, state) || other.state == state)&&(identical(other.zipCode, zipCode) || other.zipCode == zipCode)&&(identical(other.country, country) || other.country == country));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,street,number,complement,district,city,state,zipCode,country);

@override
String toString() {
  return 'AddressDTO(street: $street, number: $number, complement: $complement, district: $district, city: $city, state: $state, zipCode: $zipCode, country: $country)';
}


}

/// @nodoc
abstract mixin class _$AddressDTOCopyWith<$Res> implements $AddressDTOCopyWith<$Res> {
  factory _$AddressDTOCopyWith(_AddressDTO value, $Res Function(_AddressDTO) _then) = __$AddressDTOCopyWithImpl;
@override @useResult
$Res call({
 String street, String number, String? complement, String district, String city, String state, String zipCode, String country
});




}
/// @nodoc
class __$AddressDTOCopyWithImpl<$Res>
    implements _$AddressDTOCopyWith<$Res> {
  __$AddressDTOCopyWithImpl(this._self, this._then);

  final _AddressDTO _self;
  final $Res Function(_AddressDTO) _then;

/// Create a copy of AddressDTO
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? street = null,Object? number = null,Object? complement = freezed,Object? district = null,Object? city = null,Object? state = null,Object? zipCode = null,Object? country = null,}) {
  return _then(_AddressDTO(
street: null == street ? _self.street : street // ignore: cast_nullable_to_non_nullable
as String,number: null == number ? _self.number : number // ignore: cast_nullable_to_non_nullable
as String,complement: freezed == complement ? _self.complement : complement // ignore: cast_nullable_to_non_nullable
as String?,district: null == district ? _self.district : district // ignore: cast_nullable_to_non_nullable
as String,city: null == city ? _self.city : city // ignore: cast_nullable_to_non_nullable
as String,state: null == state ? _self.state : state // ignore: cast_nullable_to_non_nullable
as String,zipCode: null == zipCode ? _self.zipCode : zipCode // ignore: cast_nullable_to_non_nullable
as String,country: null == country ? _self.country : country // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
