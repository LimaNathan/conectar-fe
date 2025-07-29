// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_pagination_result.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$UserPaginationResult {

 List<PaginatedUserDTO> get data; PaginationMetaData get meta;
/// Create a copy of UserPaginationResult
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UserPaginationResultCopyWith<UserPaginationResult> get copyWith => _$UserPaginationResultCopyWithImpl<UserPaginationResult>(this as UserPaginationResult, _$identity);

  /// Serializes this UserPaginationResult to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UserPaginationResult&&const DeepCollectionEquality().equals(other.data, data)&&(identical(other.meta, meta) || other.meta == meta));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(data),meta);

@override
String toString() {
  return 'UserPaginationResult(data: $data, meta: $meta)';
}


}

/// @nodoc
abstract mixin class $UserPaginationResultCopyWith<$Res>  {
  factory $UserPaginationResultCopyWith(UserPaginationResult value, $Res Function(UserPaginationResult) _then) = _$UserPaginationResultCopyWithImpl;
@useResult
$Res call({
 List<PaginatedUserDTO> data, PaginationMetaData meta
});


$PaginationMetaDataCopyWith<$Res> get meta;

}
/// @nodoc
class _$UserPaginationResultCopyWithImpl<$Res>
    implements $UserPaginationResultCopyWith<$Res> {
  _$UserPaginationResultCopyWithImpl(this._self, this._then);

  final UserPaginationResult _self;
  final $Res Function(UserPaginationResult) _then;

/// Create a copy of UserPaginationResult
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? data = null,Object? meta = null,}) {
  return _then(_self.copyWith(
data: null == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as List<PaginatedUserDTO>,meta: null == meta ? _self.meta : meta // ignore: cast_nullable_to_non_nullable
as PaginationMetaData,
  ));
}
/// Create a copy of UserPaginationResult
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PaginationMetaDataCopyWith<$Res> get meta {
  
  return $PaginationMetaDataCopyWith<$Res>(_self.meta, (value) {
    return _then(_self.copyWith(meta: value));
  });
}
}


/// Adds pattern-matching-related methods to [UserPaginationResult].
extension UserPaginationResultPatterns on UserPaginationResult {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _UserPaginationResult value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _UserPaginationResult() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _UserPaginationResult value)  $default,){
final _that = this;
switch (_that) {
case _UserPaginationResult():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _UserPaginationResult value)?  $default,){
final _that = this;
switch (_that) {
case _UserPaginationResult() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<PaginatedUserDTO> data,  PaginationMetaData meta)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _UserPaginationResult() when $default != null:
return $default(_that.data,_that.meta);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<PaginatedUserDTO> data,  PaginationMetaData meta)  $default,) {final _that = this;
switch (_that) {
case _UserPaginationResult():
return $default(_that.data,_that.meta);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<PaginatedUserDTO> data,  PaginationMetaData meta)?  $default,) {final _that = this;
switch (_that) {
case _UserPaginationResult() when $default != null:
return $default(_that.data,_that.meta);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _UserPaginationResult implements UserPaginationResult {
   _UserPaginationResult({required final  List<PaginatedUserDTO> data, required this.meta}): _data = data;
  factory _UserPaginationResult.fromJson(Map<String, dynamic> json) => _$UserPaginationResultFromJson(json);

 final  List<PaginatedUserDTO> _data;
@override List<PaginatedUserDTO> get data {
  if (_data is EqualUnmodifiableListView) return _data;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_data);
}

@override final  PaginationMetaData meta;

/// Create a copy of UserPaginationResult
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UserPaginationResultCopyWith<_UserPaginationResult> get copyWith => __$UserPaginationResultCopyWithImpl<_UserPaginationResult>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$UserPaginationResultToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _UserPaginationResult&&const DeepCollectionEquality().equals(other._data, _data)&&(identical(other.meta, meta) || other.meta == meta));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_data),meta);

@override
String toString() {
  return 'UserPaginationResult(data: $data, meta: $meta)';
}


}

/// @nodoc
abstract mixin class _$UserPaginationResultCopyWith<$Res> implements $UserPaginationResultCopyWith<$Res> {
  factory _$UserPaginationResultCopyWith(_UserPaginationResult value, $Res Function(_UserPaginationResult) _then) = __$UserPaginationResultCopyWithImpl;
@override @useResult
$Res call({
 List<PaginatedUserDTO> data, PaginationMetaData meta
});


@override $PaginationMetaDataCopyWith<$Res> get meta;

}
/// @nodoc
class __$UserPaginationResultCopyWithImpl<$Res>
    implements _$UserPaginationResultCopyWith<$Res> {
  __$UserPaginationResultCopyWithImpl(this._self, this._then);

  final _UserPaginationResult _self;
  final $Res Function(_UserPaginationResult) _then;

/// Create a copy of UserPaginationResult
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? data = null,Object? meta = null,}) {
  return _then(_UserPaginationResult(
data: null == data ? _self._data : data // ignore: cast_nullable_to_non_nullable
as List<PaginatedUserDTO>,meta: null == meta ? _self.meta : meta // ignore: cast_nullable_to_non_nullable
as PaginationMetaData,
  ));
}

/// Create a copy of UserPaginationResult
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PaginationMetaDataCopyWith<$Res> get meta {
  
  return $PaginationMetaDataCopyWith<$Res>(_self.meta, (value) {
    return _then(_self.copyWith(meta: value));
  });
}
}

// dart format on
