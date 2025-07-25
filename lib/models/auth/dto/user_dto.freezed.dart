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

 String? get name; String? get email; String? get password;
/// Create a copy of UserDTO
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UserDTOCopyWith<UserDTO> get copyWith => _$UserDTOCopyWithImpl<UserDTO>(this as UserDTO, _$identity);

  /// Serializes this UserDTO to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UserDTO&&(identical(other.name, name) || other.name == name)&&(identical(other.email, email) || other.email == email)&&(identical(other.password, password) || other.password == password));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name,email,password);

@override
String toString() {
  return 'UserDTO(name: $name, email: $email, password: $password)';
}


}

/// @nodoc
abstract mixin class $UserDTOCopyWith<$Res>  {
  factory $UserDTOCopyWith(UserDTO value, $Res Function(UserDTO) _then) = _$UserDTOCopyWithImpl;
@useResult
$Res call({
 String name, String email, String password
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
@pragma('vm:prefer-inline') @override $Res call({Object? name = null,Object? email = null,Object? password = null,}) {
  return _then(_self.copyWith(
name: null == name ? _self.name! : name // ignore: cast_nullable_to_non_nullable
as String,email: null == email ? _self.email! : email // ignore: cast_nullable_to_non_nullable
as String,password: null == password ? _self.password! : password // ignore: cast_nullable_to_non_nullable
as String,
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( CreateUserDTO value)?  $default,{TResult Function( UpdateUserDTO value)?  update,required TResult orElse(),}){
final _that = this;
switch (_that) {
case CreateUserDTO() when $default != null:
return $default(_that);case UpdateUserDTO() when update != null:
return update(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( CreateUserDTO value)  $default,{required TResult Function( UpdateUserDTO value)  update,}){
final _that = this;
switch (_that) {
case CreateUserDTO():
return $default(_that);case UpdateUserDTO():
return update(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( CreateUserDTO value)?  $default,{TResult? Function( UpdateUserDTO value)?  update,}){
final _that = this;
switch (_that) {
case CreateUserDTO() when $default != null:
return $default(_that);case UpdateUserDTO() when update != null:
return update(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String name,  String email,  String password)?  $default,{TResult Function( String? name,  String? email,  String? password)?  update,required TResult orElse(),}) {final _that = this;
switch (_that) {
case CreateUserDTO() when $default != null:
return $default(_that.name,_that.email,_that.password);case UpdateUserDTO() when update != null:
return update(_that.name,_that.email,_that.password);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String name,  String email,  String password)  $default,{required TResult Function( String? name,  String? email,  String? password)  update,}) {final _that = this;
switch (_that) {
case CreateUserDTO():
return $default(_that.name,_that.email,_that.password);case UpdateUserDTO():
return update(_that.name,_that.email,_that.password);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String name,  String email,  String password)?  $default,{TResult? Function( String? name,  String? email,  String? password)?  update,}) {final _that = this;
switch (_that) {
case CreateUserDTO() when $default != null:
return $default(_that.name,_that.email,_that.password);case UpdateUserDTO() when update != null:
return update(_that.name,_that.email,_that.password);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class CreateUserDTO implements UserDTO {
  const CreateUserDTO({required this.name, required this.email, required this.password, final  String? $type}): $type = $type ?? 'default';
  factory CreateUserDTO.fromJson(Map<String, dynamic> json) => _$CreateUserDTOFromJson(json);

@override final  String name;
@override final  String email;
@override final  String password;

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
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CreateUserDTO&&(identical(other.name, name) || other.name == name)&&(identical(other.email, email) || other.email == email)&&(identical(other.password, password) || other.password == password));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name,email,password);

@override
String toString() {
  return 'UserDTO(name: $name, email: $email, password: $password)';
}


}

/// @nodoc
abstract mixin class $CreateUserDTOCopyWith<$Res> implements $UserDTOCopyWith<$Res> {
  factory $CreateUserDTOCopyWith(CreateUserDTO value, $Res Function(CreateUserDTO) _then) = _$CreateUserDTOCopyWithImpl;
@override @useResult
$Res call({
 String name, String email, String password
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
@override @pragma('vm:prefer-inline') $Res call({Object? name = null,Object? email = null,Object? password = null,}) {
  return _then(CreateUserDTO(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,password: null == password ? _self.password : password // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc
@JsonSerializable()

class UpdateUserDTO implements UserDTO {
  const UpdateUserDTO({required this.name, required this.email, required this.password, final  String? $type}): $type = $type ?? 'update';
  factory UpdateUserDTO.fromJson(Map<String, dynamic> json) => _$UpdateUserDTOFromJson(json);

@override final  String? name;
@override final  String? email;
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
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UpdateUserDTO&&(identical(other.name, name) || other.name == name)&&(identical(other.email, email) || other.email == email)&&(identical(other.password, password) || other.password == password));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name,email,password);

@override
String toString() {
  return 'UserDTO.update(name: $name, email: $email, password: $password)';
}


}

/// @nodoc
abstract mixin class $UpdateUserDTOCopyWith<$Res> implements $UserDTOCopyWith<$Res> {
  factory $UpdateUserDTOCopyWith(UpdateUserDTO value, $Res Function(UpdateUserDTO) _then) = _$UpdateUserDTOCopyWithImpl;
@override @useResult
$Res call({
 String? name, String? email, String? password
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
@override @pragma('vm:prefer-inline') $Res call({Object? name = freezed,Object? email = freezed,Object? password = freezed,}) {
  return _then(UpdateUserDTO(
name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,email: freezed == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String?,password: freezed == password ? _self.password : password // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
