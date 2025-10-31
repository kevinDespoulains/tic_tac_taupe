// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'tic_tac_toe_board.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$TicTacToeBoard {

 List<TicTacToeSymbol?> get cells;
/// Create a copy of TicTacToeBoard
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TicTacToeBoardCopyWith<TicTacToeBoard> get copyWith => _$TicTacToeBoardCopyWithImpl<TicTacToeBoard>(this as TicTacToeBoard, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TicTacToeBoard&&const DeepCollectionEquality().equals(other.cells, cells));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(cells));

@override
String toString() {
  return 'TicTacToeBoard(cells: $cells)';
}


}

/// @nodoc
abstract mixin class $TicTacToeBoardCopyWith<$Res>  {
  factory $TicTacToeBoardCopyWith(TicTacToeBoard value, $Res Function(TicTacToeBoard) _then) = _$TicTacToeBoardCopyWithImpl;
@useResult
$Res call({
 List<TicTacToeSymbol?> cells
});




}
/// @nodoc
class _$TicTacToeBoardCopyWithImpl<$Res>
    implements $TicTacToeBoardCopyWith<$Res> {
  _$TicTacToeBoardCopyWithImpl(this._self, this._then);

  final TicTacToeBoard _self;
  final $Res Function(TicTacToeBoard) _then;

/// Create a copy of TicTacToeBoard
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? cells = null,}) {
  return _then(_self.copyWith(
cells: null == cells ? _self.cells : cells // ignore: cast_nullable_to_non_nullable
as List<TicTacToeSymbol?>,
  ));
}

}


/// Adds pattern-matching-related methods to [TicTacToeBoard].
extension TicTacToeBoardPatterns on TicTacToeBoard {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _TicTacToeBoard value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _TicTacToeBoard() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _TicTacToeBoard value)  $default,){
final _that = this;
switch (_that) {
case _TicTacToeBoard():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _TicTacToeBoard value)?  $default,){
final _that = this;
switch (_that) {
case _TicTacToeBoard() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<TicTacToeSymbol?> cells)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TicTacToeBoard() when $default != null:
return $default(_that.cells);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<TicTacToeSymbol?> cells)  $default,) {final _that = this;
switch (_that) {
case _TicTacToeBoard():
return $default(_that.cells);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<TicTacToeSymbol?> cells)?  $default,) {final _that = this;
switch (_that) {
case _TicTacToeBoard() when $default != null:
return $default(_that.cells);case _:
  return null;

}
}

}

/// @nodoc


class _TicTacToeBoard extends TicTacToeBoard {
  const _TicTacToeBoard({final  List<TicTacToeSymbol?> cells = const [null, null, null, null, null, null, null, null, null]}): _cells = cells,super._();
  

 final  List<TicTacToeSymbol?> _cells;
@override@JsonKey() List<TicTacToeSymbol?> get cells {
  if (_cells is EqualUnmodifiableListView) return _cells;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_cells);
}


/// Create a copy of TicTacToeBoard
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TicTacToeBoardCopyWith<_TicTacToeBoard> get copyWith => __$TicTacToeBoardCopyWithImpl<_TicTacToeBoard>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TicTacToeBoard&&const DeepCollectionEquality().equals(other._cells, _cells));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_cells));

@override
String toString() {
  return 'TicTacToeBoard(cells: $cells)';
}


}

/// @nodoc
abstract mixin class _$TicTacToeBoardCopyWith<$Res> implements $TicTacToeBoardCopyWith<$Res> {
  factory _$TicTacToeBoardCopyWith(_TicTacToeBoard value, $Res Function(_TicTacToeBoard) _then) = __$TicTacToeBoardCopyWithImpl;
@override @useResult
$Res call({
 List<TicTacToeSymbol?> cells
});




}
/// @nodoc
class __$TicTacToeBoardCopyWithImpl<$Res>
    implements _$TicTacToeBoardCopyWith<$Res> {
  __$TicTacToeBoardCopyWithImpl(this._self, this._then);

  final _TicTacToeBoard _self;
  final $Res Function(_TicTacToeBoard) _then;

/// Create a copy of TicTacToeBoard
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? cells = null,}) {
  return _then(_TicTacToeBoard(
cells: null == cells ? _self._cells : cells // ignore: cast_nullable_to_non_nullable
as List<TicTacToeSymbol?>,
  ));
}


}

// dart format on
