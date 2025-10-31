import 'package:tic_tac_taupe/core/local_storage/app_local_storage.dart';

/// A data source for local game settings.
class GameSettingsLocalDataSource {
  const GameSettingsLocalDataSource({
    required this.appLocalStorage,
  });

  final AppLocalStorage appLocalStorage;
  static const String _gameSettingsKey = 'game_settings';

  /// Saves the game settings locally.
  Future<void> saveSettings(String settingsJson) async {
    await appLocalStorage.saveString(key: _gameSettingsKey, data: settingsJson);
  }

  /// Fetches the game settings from local storage.
  Future<String?> fetchSettings() async {
    return appLocalStorage.getString(key: _gameSettingsKey);
  }
}
