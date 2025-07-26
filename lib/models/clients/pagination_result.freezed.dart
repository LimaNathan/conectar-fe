// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'pagination_result.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
ClientPaginationResult _$ClientPaginationResultFromJson(
  Map<String, dynamic> json
) {
    return _PaginationResult.fromJson(
      json
    );
}

/// @nodoc
mixin _$ClientPaginationResult {

 List<PaginatedClientDTO> get data; PaginationMetaData get meta;
/// Create a copy of ClientPaginationResult
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ClientPaginationResultCopyWith<ClientPaginationResult> get copyWith => _$ClientPaginationResultCopyWithImpl<ClientPaginationResult>(this as ClientPaginationResult, _$identity);

  /// Serializes this ClientPaginationResult to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ClientPaginationResult&&const DeepCollectionEquality().equals(other.data, data)&&(identical(other.meta, meta) || other.meta == meta));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(data),meta);

@override
String toString() {
  return 'ClientPaginationResult(data: $data, meta: $meta)';
}


}

/// @nodoc
abstract mixin class $ClientPaginationResultCopyWith<$Res>  {
  factory $ClientPaginationResultCopyWith(ClientPaginationResult value, $Res Function(ClientPaginationResult) _then) = _$ClientPaginationResultCopyWithImpl;
@useResult
$Res call({
 List<PaginatedClientDTO> data, PaginationMetaData meta
});


$PaginationMetaDataCopyWith<$Res> get meta;

}
/// @nodoc
class _$ClientPaginationResultCopyWithImpl<$Res>
    implements $ClientPaginationResultCopyWith<$Res> {
  _$ClientPaginationResultCopyWithImpl(this._self, this._then);

  final ClientPaginationResult _self;
  final $Res Function(ClientPaginationResult) _then;

/// Create a copy of ClientPaginationResult
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? data = null,Object? meta = null,}) {
  return _then(_self.copyWith(
data: null == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as List<PaginatedClientDTO>,meta: null == meta ? _self.meta : meta // ignore: cast_nullable_to_non_nullable
as PaginationMetaData,
  ));
}
/// Create a copy of ClientPaginationResult
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PaginationMetaDataCopyWith<$Res> get meta {
  
  return $PaginationMetaDataCopyWith<$Res>(_self.meta, (value) {
    return _then(_self.copyWith(meta: value));
  });
}
}


/// Adds pattern-matching-related methods to [ClientPaginationResult].
extension ClientPaginationResultPatterns on ClientPaginationResult {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PaginationResult value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PaginationResult() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PaginationResult value)  $default,){
final _that = this;
switch (_that) {
case _PaginationResult():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PaginationResult value)?  $default,){
final _that = this;
switch (_that) {
case _PaginationResult() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<PaginatedClientDTO> data,  PaginationMetaData meta)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PaginationResult() when $default != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<PaginatedClientDTO> data,  PaginationMetaData meta)  $default,) {final _that = this;
switch (_that) {
case _PaginationResult():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<PaginatedClientDTO> data,  PaginationMetaData meta)?  $default,) {final _that = this;
switch (_that) {
case _PaginationResult() when $default != null:
return $default(_that.data,_that.meta);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _PaginationResult implements ClientPaginationResult {
   _PaginationResult({required final  List<PaginatedClientDTO> data, required this.meta}): _data = data;
  factory _PaginationResult.fromJson(Map<String, dynamic> json) => _$PaginationResultFromJson(json);

 final  List<PaginatedClientDTO> _data;
@override List<PaginatedClientDTO> get data {
  if (_data is EqualUnmodifiableListView) return _data;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_data);
}

@override final  PaginationMetaData meta;

/// Create a copy of ClientPaginationResult
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PaginationResultCopyWith<_PaginationResult> get copyWith => __$PaginationResultCopyWithImpl<_PaginationResult>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PaginationResultToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PaginationResult&&const DeepCollectionEquality().equals(other._data, _data)&&(identical(other.meta, meta) || other.meta == meta));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_data),meta);

@override
String toString() {
  return 'ClientPaginationResult(data: $data, meta: $meta)';
}


}

/// @nodoc
abstract mixin class _$PaginationResultCopyWith<$Res> implements $ClientPaginationResultCopyWith<$Res> {
  factory _$PaginationResultCopyWith(_PaginationResult value, $Res Function(_PaginationResult) _then) = __$PaginationResultCopyWithImpl;
@override @useResult
$Res call({
 List<PaginatedClientDTO> data, PaginationMetaData meta
});


@override $PaginationMetaDataCopyWith<$Res> get meta;

}
/// @nodoc
class __$PaginationResultCopyWithImpl<$Res>
    implements _$PaginationResultCopyWith<$Res> {
  __$PaginationResultCopyWithImpl(this._self, this._then);

  final _PaginationResult _self;
  final $Res Function(_PaginationResult) _then;

/// Create a copy of ClientPaginationResult
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? data = null,Object? meta = null,}) {
  return _then(_PaginationResult(
data: null == data ? _self._data : data // ignore: cast_nullable_to_non_nullable
as List<PaginatedClientDTO>,meta: null == meta ? _self.meta : meta // ignore: cast_nullable_to_non_nullable
as PaginationMetaData,
  ));
}

/// Create a copy of ClientPaginationResult
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PaginationMetaDataCopyWith<$Res> get meta {
  
  return $PaginationMetaDataCopyWith<$Res>(_self.meta, (value) {
    return _then(_self.copyWith(meta: value));
  });
}
}


/// @nodoc
mixin _$PaginationMetaData {

 int get total; String get page; int get lastPage; String get perPage;
/// Create a copy of PaginationMetaData
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PaginationMetaDataCopyWith<PaginationMetaData> get copyWith => _$PaginationMetaDataCopyWithImpl<PaginationMetaData>(this as PaginationMetaData, _$identity);

  /// Serializes this PaginationMetaData to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PaginationMetaData&&(identical(other.total, total) || other.total == total)&&(identical(other.page, page) || other.page == page)&&(identical(other.lastPage, lastPage) || other.lastPage == lastPage)&&(identical(other.perPage, perPage) || other.perPage == perPage));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,total,page,lastPage,perPage);

@override
String toString() {
  return 'PaginationMetaData(total: $total, page: $page, lastPage: $lastPage, perPage: $perPage)';
}


}

/// @nodoc
abstract mixin class $PaginationMetaDataCopyWith<$Res>  {
  factory $PaginationMetaDataCopyWith(PaginationMetaData value, $Res Function(PaginationMetaData) _then) = _$PaginationMetaDataCopyWithImpl;
@useResult
$Res call({
 int total, String page, int lastPage, String perPage
});




}
/// @nodoc
class _$PaginationMetaDataCopyWithImpl<$Res>
    implements $PaginationMetaDataCopyWith<$Res> {
  _$PaginationMetaDataCopyWithImpl(this._self, this._then);

  final PaginationMetaData _self;
  final $Res Function(PaginationMetaData) _then;

/// Create a copy of PaginationMetaData
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? total = null,Object? page = null,Object? lastPage = null,Object? perPage = null,}) {
  return _then(_self.copyWith(
total: null == total ? _self.total : total // ignore: cast_nullable_to_non_nullable
as int,page: null == page ? _self.page : page // ignore: cast_nullable_to_non_nullable
as String,lastPage: null == lastPage ? _self.lastPage : lastPage // ignore: cast_nullable_to_non_nullable
as int,perPage: null == perPage ? _self.perPage : perPage // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [PaginationMetaData].
extension PaginationMetaDataPatterns on PaginationMetaData {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PaginationMetaData value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PaginationMetaData() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PaginationMetaData value)  $default,){
final _that = this;
switch (_that) {
case _PaginationMetaData():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PaginationMetaData value)?  $default,){
final _that = this;
switch (_that) {
case _PaginationMetaData() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int total,  String page,  int lastPage,  String perPage)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PaginationMetaData() when $default != null:
return $default(_that.total,_that.page,_that.lastPage,_that.perPage);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int total,  String page,  int lastPage,  String perPage)  $default,) {final _that = this;
switch (_that) {
case _PaginationMetaData():
return $default(_that.total,_that.page,_that.lastPage,_that.perPage);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int total,  String page,  int lastPage,  String perPage)?  $default,) {final _that = this;
switch (_that) {
case _PaginationMetaData() when $default != null:
return $default(_that.total,_that.page,_that.lastPage,_that.perPage);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _PaginationMetaData implements PaginationMetaData {
   _PaginationMetaData({required this.total, required this.page, required this.lastPage, required this.perPage});
  factory _PaginationMetaData.fromJson(Map<String, dynamic> json) => _$PaginationMetaDataFromJson(json);

@override final  int total;
@override final  String page;
@override final  int lastPage;
@override final  String perPage;

/// Create a copy of PaginationMetaData
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PaginationMetaDataCopyWith<_PaginationMetaData> get copyWith => __$PaginationMetaDataCopyWithImpl<_PaginationMetaData>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PaginationMetaDataToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PaginationMetaData&&(identical(other.total, total) || other.total == total)&&(identical(other.page, page) || other.page == page)&&(identical(other.lastPage, lastPage) || other.lastPage == lastPage)&&(identical(other.perPage, perPage) || other.perPage == perPage));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,total,page,lastPage,perPage);

@override
String toString() {
  return 'PaginationMetaData(total: $total, page: $page, lastPage: $lastPage, perPage: $perPage)';
}


}

/// @nodoc
abstract mixin class _$PaginationMetaDataCopyWith<$Res> implements $PaginationMetaDataCopyWith<$Res> {
  factory _$PaginationMetaDataCopyWith(_PaginationMetaData value, $Res Function(_PaginationMetaData) _then) = __$PaginationMetaDataCopyWithImpl;
@override @useResult
$Res call({
 int total, String page, int lastPage, String perPage
});




}
/// @nodoc
class __$PaginationMetaDataCopyWithImpl<$Res>
    implements _$PaginationMetaDataCopyWith<$Res> {
  __$PaginationMetaDataCopyWithImpl(this._self, this._then);

  final _PaginationMetaData _self;
  final $Res Function(_PaginationMetaData) _then;

/// Create a copy of PaginationMetaData
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? total = null,Object? page = null,Object? lastPage = null,Object? perPage = null,}) {
  return _then(_PaginationMetaData(
total: null == total ? _self.total : total // ignore: cast_nullable_to_non_nullable
as int,page: null == page ? _self.page : page // ignore: cast_nullable_to_non_nullable
as String,lastPage: null == lastPage ? _self.lastPage : lastPage // ignore: cast_nullable_to_non_nullable
as int,perPage: null == perPage ? _self.perPage : perPage // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
