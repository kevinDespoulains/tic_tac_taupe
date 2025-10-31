import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:tic_tac_taupe/features/game_settings/dependencies_injection.dart';
import 'package:tic_tac_taupe/features/game_settings/domain/models/game_settings.dart';

part 'game_settings_state.g.dart';

/// Provides the game settings.
@Riverpod(keepAlive: true)
class GameSettingsNotifier extends _$GameSettingsNotifier {
  @override
  Future<GameSettings> build() async {
    try {
      final settings = await ref
          .read(gameSettingsRepositoryProvider)
          .loadSettings();

      return settings ?? const GameSettings();
    } catch (e) {
      return const GameSettings();
    }
  }

  void setBotDifficulty(BotDifficulty difficulty) {
    state = AsyncData(GameSettings(botDifficulty: difficulty));

    try {
      ref
          .read(gameSettingsRepositoryProvider)
          .saveSettings(GameSettings(botDifficulty: difficulty));
    } catch (e) {
      // Nothing to do, it is not critical to save settings
    }
  }
}
