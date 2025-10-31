// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'tic_tac_toe_game.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$TicTacToeGame {

 TicTacToeBoard get board; bool get isPlayerTurn;
/// Create a copy of TicTacToeGame
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TicTacToeGameCopyWith<TicTacToeGame> get copyWith => _$TicTacToeGameCopyWithImpl<TicTacToeGame>(this as TicTacToeGame, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TicTacToeGame&&(identical(other.board, board) || other.board == board)&&(identical(other.isPlayerTurn, isPlayerTurn) || other.isPlayerTurn == isPlayerTurn));
}


@override
int get hashCode => Object.hash(runtimeType,board,isPlayerTurn);

@override
String toString() {
  return 'TicTacToeGame(board: $board, isPlayerTurn: $isPlayerTurn)';
}


}

/// @nodoc
abstract mixin class $TicTacToeGameCopyWith<$Res>  {
  factory $TicTacToeGameCopyWith(TicTacToeGame value, $Res Function(TicTacToeGame) _then) = _$TicTacToeGameCopyWithImpl;
@useResult
$Res call({
 TicTacToeBoard board, bool isPlayerTurn
});


$TicTacToeBoardCopyWith<$Res> get board;

}
/// @nodoc
class _$TicTacToeGameCopyWithImpl<$Res>
    implements $TicTacToeGameCopyWith<$Res> {
  _$TicTacToeGameCopyWithImpl(this._self, this._then);

  final TicTacToeGame _self;
  final $Res Function(TicTacToeGame) _then;

/// Create a copy of TicTacToeGame
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? board = null,Object? isPlayerTurn = null,}) {
  return _then(_self.copyWith(
board: null == board ? _self.board : board // ignore: cast_nullable_to_non_nullable
as TicTacToeBoard,isPlayerTurn: null == isPlayerTurn ? _self.isPlayerTurn : isPlayerTurn // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}
/// Create a copy of TicTacToeGame
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$TicTacToeBoardCopyWith<$Res> get board {
  
  return $TicTacToeBoardCopyWith<$Res>(_self.board, (value) {
    return _then(_self.copyWith(board: value));
  });
}
}


/// Adds pattern-matching-related methods to [TicTacToeGame].
extension TicTacToeGamePatterns on TicTacToeGame {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _TicTacToeGame value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _TicTacToeGame() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _TicTacToeGame value)  $default,){
final _that = this;
switch (_that) {
case _TicTacToeGame():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _TicTacToeGame value)?  $default,){
final _that = this;
switch (_that) {
case _TicTacToeGame() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( TicTacToeBoard board,  bool isPlayerTurn)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TicTacToeGame() when $default != null:
return $default(_that.board,_that.isPlayerTurn);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( TicTacToeBoard board,  bool isPlayerTurn)  $default,) {final _that = this;
switch (_that) {
case _TicTacToeGame():
return $default(_that.board,_that.isPlayerTurn);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( TicTacToeBoard board,  bool isPlayerTurn)?  $default,) {final _that = this;
switch (_that) {
case _TicTacToeGame() when $default != null:
return $default(_that.board,_that.isPlayerTurn);case _:
  return null;

}
}

}

/// @nodoc


class _TicTacToeGame extends TicTacToeGame {
  const _TicTacToeGame({this.board = const TicTacToeBoard(), this.isPlayerTurn = true}): super._();
  

@override@JsonKey() final  TicTacToeBoard board;
@override@JsonKey() final  bool isPlayerTurn;

/// Create a copy of TicTacToeGame
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TicTacToeGameCopyWith<_TicTacToeGame> get copyWith => __$TicTacToeGameCopyWithImpl<_TicTacToeGame>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TicTacToeGame&&(identical(other.board, board) || other.board == board)&&(identical(other.isPlayerTurn, isPlayerTurn) || other.isPlayerTurn == isPlayerTurn));
}


@override
int get hashCode => Object.hash(runtimeType,board,isPlayerTurn);

@override
String toString() {
  return 'TicTacToeGame(board: $board, isPlayerTurn: $isPlayerTurn)';
}


}

/// @nodoc
abstract mixin class _$TicTacToeGameCopyWith<$Res> implements $TicTacToeGameCopyWith<$Res> {
  factory _$TicTacToeGameCopyWith(_TicTacToeGame value, $Res Function(_TicTacToeGame) _then) = __$TicTacToeGameCopyWithImpl;
@override @useResult
$Res call({
 TicTacToeBoard board, bool isPlayerTurn
});


@override $TicTacToeBoardCopyWith<$Res> get board;

}
/// @nodoc
class __$TicTacToeGameCopyWithImpl<$Res>
    implements _$TicTacToeGameCopyWith<$Res> {
  __$TicTacToeGameCopyWithImpl(this._self, this._then);

  final _TicTacToeGame _self;
  final $Res Function(_TicTacToeGame) _then;

/// Create a copy of TicTacToeGame
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? board = null,Object? isPlayerTurn = null,}) {
  return _then(_TicTacToeGame(
board: null == board ? _self.board : board // ignore: cast_nullable_to_non_nullable
as TicTacToeBoard,isPlayerTurn: null == isPlayerTurn ? _self.isPlayerTurn : isPlayerTurn // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

/// Create a copy of TicTacToeGame
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$TicTacToeBoardCopyWith<$Res> get board {
  
  return $TicTacToeBoardCopyWith<$Res>(_self.board, (value) {
    return _then(_self.copyWith(board: value));
  });
}
}

// dart format on
