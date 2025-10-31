import 'package:freezed_annotation/freezed_annotation.dart';

part 'game_settings.freezed.dart';
part 'game_settings.g.dart';

@freezed
abstract class GameSettings with _$GameSettings {
  const factory GameSettings({
    @Default(BotDifficulty.medium) BotDifficulty botDifficulty,
  }) = _GameSettings;

  factory GameSettings.fromJson(Map<String, dynamic> json) =>
      _$GameSettingsFromJson(json);
}

enum BotDifficulty { easy, medium, hard }
