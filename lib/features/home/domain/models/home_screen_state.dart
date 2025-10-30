import 'package:freezed_annotation/freezed_annotation.dart';

part 'home_screen_state.freezed.dart';

@freezed
abstract class HomeScreenState with _$HomeScreenState {
  const factory HomeScreenState({
    required BotDifficulty botDifficulty,
  }) = _HomeScreenState;
}

enum BotDifficulty { easy, medium, hard }
