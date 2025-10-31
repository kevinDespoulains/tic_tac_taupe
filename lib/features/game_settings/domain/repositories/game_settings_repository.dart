import 'package:tic_tac_taupe/features/game_settings/domain/models/game_settings.dart';

/// Repository for game settings.
abstract class GameSettingsRepository {
  const GameSettingsRepository();

  /// Loads the current game settings.
  Future<GameSettings?> loadSettings();

  /// Saves the game settings.
  Future<void> saveSettings(GameSettings settings);
}
