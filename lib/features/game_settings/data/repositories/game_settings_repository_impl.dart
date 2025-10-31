import 'dart:convert';

import 'package:tic_tac_taupe/features/game_settings/data/sources/game_settings_local_data_source.dart';
import 'package:tic_tac_taupe/features/game_settings/domain/models/game_settings.dart';
import 'package:tic_tac_taupe/features/game_settings/domain/repositories/game_settings_repository.dart';

class GameSettingsRepositoryImpl implements GameSettingsRepository {
  const GameSettingsRepositoryImpl({
    required GameSettingsLocalDataSource dataSource,
  }) : _source = dataSource;

  final GameSettingsLocalDataSource _source;

  @override
  Future<GameSettings?> loadSettings() async {
    final settings = await _source.fetchSettings();

    if (settings == null) {
      return null;
    }

    return GameSettings.fromJson(jsonDecode(settings));
  }

  @override
  Future<void> saveSettings(GameSettings settings) async {
    return _source.saveSettings(jsonEncode(settings.toJson()));
  }
}
