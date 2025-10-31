import 'package:freezed_annotation/freezed_annotation.dart';

part 'game_settings.freezed.dart';

@freezed
abstract class GameSettings with _$GameSettings {
  const factory GameSettings({
    required BotDifficulty botDifficulty,
  }) = _GameSettings;
}

enum BotDifficulty { easy, medium, hard }
