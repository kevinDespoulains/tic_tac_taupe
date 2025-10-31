import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:tic_tac_taupe/features/game_settings/domain/game_settings.dart';

part 'dependencies_injection.g.dart';

/// Provides the game settings.
@Riverpod(keepAlive: true)
class GameSettingsNotifier extends _$GameSettingsNotifier {
  @override
  GameSettings build() {
    return const GameSettings(
      botDifficulty: BotDifficulty.medium,
    );
  }

  void setBotDifficulty(BotDifficulty difficulty) {
    // TODO(kevin): persist settings to storage
    state = state.copyWith(botDifficulty: difficulty);
  }
}
