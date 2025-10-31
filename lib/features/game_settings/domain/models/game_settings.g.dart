// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'game_settings.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_GameSettings _$GameSettingsFromJson(Map<String, dynamic> json) =>
    _GameSettings(
      botDifficulty:
          $enumDecodeNullable(_$BotDifficultyEnumMap, json['botDifficulty']) ??
          BotDifficulty.medium,
    );

Map<String, dynamic> _$GameSettingsToJson(_GameSettings instance) =>
    <String, dynamic>{
      'botDifficulty': _$BotDifficultyEnumMap[instance.botDifficulty]!,
    };

const _$BotDifficultyEnumMap = {
  BotDifficulty.easy: 'easy',
  BotDifficulty.medium: 'medium',
  BotDifficulty.hard: 'hard',
};
