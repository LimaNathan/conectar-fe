// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
UserDTO _$UserDTOFromJson(
  Map<String, dynamic> json
) {
        switch (json['runtimeType']) {
                  case 'default':
          return CreateUserDTO.fromJson(
            json
          );
                case 'update':
          return UpdateUserDTO.fromJson(
            json
          );
                case 'paginated':
          return PaginatedUserDTO.fromJson(
            json
          );
        
          default:
            throw CheckedFromJsonException(
  json,
  'runtimeType',
  'UserDTO',
  'Invalid union type "${json['runtimeType']}"!'
);
        }
      
}

/// @nodoc
mixin _$UserDTO {

 String? get name; String? get email; String? get password; String? get role;
/// Create a copy of UserDTO
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UserDTOCopyWith<UserDTO> get copyWith => _$UserDTOCopyWithImpl<UserDTO>(this as UserDTO, _$identity);

  /// Serializes this UserDTO to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UserDTO&&(identical(other.name, name) || other.name == name)&&(identical(other.email, email) || other.email == email)&&(identical(other.password, password) || other.password == password)&&(identical(other.role, role) || other.role == role));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name,email,password,role);

@override
String toString() {
  return 'UserDTO(name: $name, email: $email, password: $password, role: $role)';
}


}

/// @nodoc
abstract mixin class $UserDTOCopyWith<$Res>  {
  factory $UserDTOCopyWith(UserDTO value, $Res Function(UserDTO) _then) = _$UserDTOCopyWithImpl;
@useResult
$Res call({
 String name, String email, String password, String? role
});




}
/// @nodoc
class _$UserDTOCopyWithImpl<$Res>
    implements $UserDTOCopyWith<$Res> {
  _$UserDTOCopyWithImpl(this._self, this._then);

  final UserDTO _self;
  final $Res Function(UserDTO) _then;

/// Create a copy of UserDTO
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? name = null,Object? email = null,Object? password = null,Object? role = freezed,}) {
  return _then(_self.copyWith(
name: null == name ? _self.name! : name // ignore: cast_nullable_to_non_nullable
as String,email: null == email ? _self.email! : email // ignore: cast_nullable_to_non_nullable
as String,password: null == password ? _self.password! : password // ignore: cast_nullable_to_non_nullable
as String,role: freezed == role ? _self.role : role // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [UserDTO].
extension UserDTOPatterns on UserDTO {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( CreateUserDTO value)?  $default,{TResult Function( UpdateUserDTO value)?  update,TResult Function( PaginatedUserDTO value)?  paginated,required TResult orElse(),}){
final _that = this;
switch (_that) {
case CreateUserDTO() when $default != null:
return $default(_that);case UpdateUserDTO() when update != null:
return update(_that);case PaginatedUserDTO() when paginated != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( CreateUserDTO value)  $default,{required TResult Function( UpdateUserDTO value)  update,required TResult Function( PaginatedUserDTO value)  paginated,}){
final _that = this;
switch (_that) {
case CreateUserDTO():
return $default(_that);case UpdateUserDTO():
return update(_that);case PaginatedUserDTO():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( CreateUserDTO value)?  $default,{TResult? Function( UpdateUserDTO value)?  update,TResult? Function( PaginatedUserDTO value)?  paginated,}){
final _that = this;
switch (_that) {
case CreateUserDTO() when $default != null:
return $default(_that);case UpdateUserDTO() when update != null:
return update(_that);case PaginatedUserDTO() when paginated != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String name,  String email,  String password,  String? role)?  $default,{TResult Function( String? name,  String? email,  String? role,  String? password)?  update,TResult Function( int? id,  String? name,  String? email,  String? password,  String? role)?  paginated,required TResult orElse(),}) {final _that = this;
switch (_that) {
case CreateUserDTO() when $default != null:
return $default(_that.name,_that.email,_that.password,_that.role);case UpdateUserDTO() when update != null:
return update(_that.name,_that.email,_that.role,_that.password);case PaginatedUserDTO() when paginated != null:
return paginated(_that.id,_that.name,_that.email,_that.password,_that.role);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String name,  String email,  String password,  String? role)  $default,{required TResult Function( String? name,  String? email,  String? role,  String? password)  update,required TResult Function( int? id,  String? name,  String? email,  String? password,  String? role)  paginated,}) {final _that = this;
switch (_that) {
case CreateUserDTO():
return $default(_that.name,_that.email,_that.password,_that.role);case UpdateUserDTO():
return update(_that.name,_that.email,_that.role,_that.password);case PaginatedUserDTO():
return paginated(_that.id,_that.name,_that.email,_that.password,_that.role);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String name,  String email,  String password,  String? role)?  $default,{TResult? Function( String? name,  String? email,  String? role,  String? password)?  update,TResult? Function( int? id,  String? name,  String? email,  String? password,  String? role)?  paginated,}) {final _that = this;
switch (_that) {
case CreateUserDTO() when $default != null:
return $default(_that.name,_that.email,_that.password,_that.role);case UpdateUserDTO() when update != null:
return update(_that.name,_that.email,_that.role,_that.password);case PaginatedUserDTO() when paginated != null:
return paginated(_that.id,_that.name,_that.email,_that.password,_that.role);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class CreateUserDTO implements UserDTO {
  const CreateUserDTO({required this.name, required this.email, required this.password, this.role, final  String? $type}): $type = $type ?? 'default';
  factory CreateUserDTO.fromJson(Map<String, dynamic> json) => _$CreateUserDTOFromJson(json);

@override final  String name;
@override final  String email;
@override final  String password;
@override final  String? role;

@JsonKey(name: 'runtimeType')
final String $type;


/// Create a copy of UserDTO
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CreateUserDTOCopyWith<CreateUserDTO> get copyWith => _$CreateUserDTOCopyWithImpl<CreateUserDTO>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CreateUserDTOToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CreateUserDTO&&(identical(other.name, name) || other.name == name)&&(identical(other.email, email) || other.email == email)&&(identical(other.password, password) || other.password == password)&&(identical(other.role, role) || other.role == role));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name,email,password,role);

@override
String toString() {
  return 'UserDTO(name: $name, email: $email, password: $password, role: $role)';
}


}

/// @nodoc
abstract mixin class $CreateUserDTOCopyWith<$Res> implements $UserDTOCopyWith<$Res> {
  factory $CreateUserDTOCopyWith(CreateUserDTO value, $Res Function(CreateUserDTO) _then) = _$CreateUserDTOCopyWithImpl;
@override @useResult
$Res call({
 String name, String email, String password, String? role
});




}
/// @nodoc
class _$CreateUserDTOCopyWithImpl<$Res>
    implements $CreateUserDTOCopyWith<$Res> {
  _$CreateUserDTOCopyWithImpl(this._self, this._then);

  final CreateUserDTO _self;
  final $Res Function(CreateUserDTO) _then;

/// Create a copy of UserDTO
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? name = null,Object? email = null,Object? password = null,Object? role = freezed,}) {
  return _then(CreateUserDTO(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,password: null == password ? _self.password : password // ignore: cast_nullable_to_non_nullable
as String,role: freezed == role ? _self.role : role // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

/// @nodoc
@JsonSerializable()

class UpdateUserDTO implements UserDTO {
  const UpdateUserDTO({required this.name, required this.email, this.role, required this.password, final  String? $type}): $type = $type ?? 'update';
  factory UpdateUserDTO.fromJson(Map<String, dynamic> json) => _$UpdateUserDTOFromJson(json);

@override final  String? name;
@override final  String? email;
@override final  String? role;
@override final  String? password;

@JsonKey(name: 'runtimeType')
final String $type;


/// Create a copy of UserDTO
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UpdateUserDTOCopyWith<UpdateUserDTO> get copyWith => _$UpdateUserDTOCopyWithImpl<UpdateUserDTO>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$UpdateUserDTOToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UpdateUserDTO&&(identical(other.name, name) || other.name == name)&&(identical(other.email, email) || other.email == email)&&(identical(other.role, role) || other.role == role)&&(identical(other.password, password) || other.password == password));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name,email,role,password);

@override
String toString() {
  return 'UserDTO.update(name: $name, email: $email, role: $role, password: $password)';
}


}

/// @nodoc
abstract mixin class $UpdateUserDTOCopyWith<$Res> implements $UserDTOCopyWith<$Res> {
  factory $UpdateUserDTOCopyWith(UpdateUserDTO value, $Res Function(UpdateUserDTO) _then) = _$UpdateUserDTOCopyWithImpl;
@override @useResult
$Res call({
 String? name, String? email, String? role, String? password
});




}
/// @nodoc
class _$UpdateUserDTOCopyWithImpl<$Res>
    implements $UpdateUserDTOCopyWith<$Res> {
  _$UpdateUserDTOCopyWithImpl(this._self, this._then);

  final UpdateUserDTO _self;
  final $Res Function(UpdateUserDTO) _then;

/// Create a copy of UserDTO
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? name = freezed,Object? email = freezed,Object? role = freezed,Object? password = freezed,}) {
  return _then(UpdateUserDTO(
name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,email: freezed == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String?,role: freezed == role ? _self.role : role // ignore: cast_nullable_to_non_nullable
as String?,password: freezed == password ? _self.password : password // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

/// @nodoc
@JsonSerializable()

class PaginatedUserDTO implements UserDTO {
  const PaginatedUserDTO({this.id, this.name, this.email, this.password, this.role, final  String? $type}): $type = $type ?? 'paginated';
  factory PaginatedUserDTO.fromJson(Map<String, dynamic> json) => _$PaginatedUserDTOFromJson(json);

 final  int? id;
@override final  String? name;
@override final  String? email;
@override final  String? password;
@override final  String? role;

@JsonKey(name: 'runtimeType')
final String $type;


/// Create a copy of UserDTO
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PaginatedUserDTOCopyWith<PaginatedUserDTO> get copyWith => _$PaginatedUserDTOCopyWithImpl<PaginatedUserDTO>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PaginatedUserDTOToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PaginatedUserDTO&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.email, email) || other.email == email)&&(identical(other.password, password) || other.password == password)&&(identical(other.role, role) || other.role == role));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,email,password,role);

@override
String toString() {
  return 'UserDTO.paginated(id: $id, name: $name, email: $email, password: $password, role: $role)';
}


}

/// @nodoc
abstract mixin class $PaginatedUserDTOCopyWith<$Res> implements $UserDTOCopyWith<$Res> {
  factory $PaginatedUserDTOCopyWith(PaginatedUserDTO value, $Res Function(PaginatedUserDTO) _then) = _$PaginatedUserDTOCopyWithImpl;
@override @useResult
$Res call({
 int? id, String? name, String? email, String? password, String? role
});




}
/// @nodoc
class _$PaginatedUserDTOCopyWithImpl<$Res>
    implements $PaginatedUserDTOCopyWith<$Res> {
  _$PaginatedUserDTOCopyWithImpl(this._self, this._then);

  final PaginatedUserDTO _self;
  final $Res Function(PaginatedUserDTO) _then;

/// Create a copy of UserDTO
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? name = freezed,Object? email = freezed,Object? password = freezed,Object? role = freezed,}) {
  return _then(PaginatedUserDTO(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,email: freezed == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String?,password: freezed == password ? _self.password : password // ignore: cast_nullable_to_non_nullable
as String?,role: freezed == role ? _self.role : role // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
