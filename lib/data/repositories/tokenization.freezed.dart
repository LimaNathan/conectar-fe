// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'tokenization.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Tokenization {

@JsonKey(name: 'access_token') String get accessToken;
/// Create a copy of Tokenization
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TokenizationCopyWith<Tokenization> get copyWith => _$TokenizationCopyWithImpl<Tokenization>(this as Tokenization, _$identity);

  /// Serializes this Tokenization to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Tokenization&&(identical(other.accessToken, accessToken) || other.accessToken == accessToken));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,accessToken);

@override
String toString() {
  return 'Tokenization(accessToken: $accessToken)';
}


}

/// @nodoc
abstract mixin class $TokenizationCopyWith<$Res>  {
  factory $TokenizationCopyWith(Tokenization value, $Res Function(Tokenization) _then) = _$TokenizationCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'access_token') String accessToken
});




}
/// @nodoc
class _$TokenizationCopyWithImpl<$Res>
    implements $TokenizationCopyWith<$Res> {
  _$TokenizationCopyWithImpl(this._self, this._then);

  final Tokenization _self;
  final $Res Function(Tokenization) _then;

/// Create a copy of Tokenization
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? accessToken = null,}) {
  return _then(_self.copyWith(
accessToken: null == accessToken ? _self.accessToken : accessToken // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [Tokenization].
extension TokenizationPatterns on Tokenization {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Tokenization value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Tokenization() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Tokenization value)  $default,){
final _that = this;
switch (_that) {
case _Tokenization():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Tokenization value)?  $default,){
final _that = this;
switch (_that) {
case _Tokenization() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'access_token')  String accessToken)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Tokenization() when $default != null:
return $default(_that.accessToken);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'access_token')  String accessToken)  $default,) {final _that = this;
switch (_that) {
case _Tokenization():
return $default(_that.accessToken);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'access_token')  String accessToken)?  $default,) {final _that = this;
switch (_that) {
case _Tokenization() when $default != null:
return $default(_that.accessToken);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Tokenization implements Tokenization {
   _Tokenization({@JsonKey(name: 'access_token') required this.accessToken});
  factory _Tokenization.fromJson(Map<String, dynamic> json) => _$TokenizationFromJson(json);

@override@JsonKey(name: 'access_token') final  String accessToken;

/// Create a copy of Tokenization
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TokenizationCopyWith<_Tokenization> get copyWith => __$TokenizationCopyWithImpl<_Tokenization>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$TokenizationToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Tokenization&&(identical(other.accessToken, accessToken) || other.accessToken == accessToken));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,accessToken);

@override
String toString() {
  return 'Tokenization(accessToken: $accessToken)';
}


}

/// @nodoc
abstract mixin class _$TokenizationCopyWith<$Res> implements $TokenizationCopyWith<$Res> {
  factory _$TokenizationCopyWith(_Tokenization value, $Res Function(_Tokenization) _then) = __$TokenizationCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'access_token') String accessToken
});




}
/// @nodoc
class __$TokenizationCopyWithImpl<$Res>
    implements _$TokenizationCopyWith<$Res> {
  __$TokenizationCopyWithImpl(this._self, this._then);

  final _Tokenization _self;
  final $Res Function(_Tokenization) _then;

/// Create a copy of Tokenization
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? accessToken = null,}) {
  return _then(_Tokenization(
accessToken: null == accessToken ? _self.accessToken : accessToken // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
