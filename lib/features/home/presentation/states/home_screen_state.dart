import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:tic_tac_taupe/features/game_settings/dependencies_injection.dart';
import 'package:tic_tac_taupe/features/game_settings/domain/game_settings.dart';
import 'package:tic_tac_taupe/features/home/domain/models/home_screen_state.dart';

part 'home_screen_state.g.dart';

@riverpod
class HomeScreenStateNotifier extends _$HomeScreenStateNotifier {
  @override
  HomeScreenState build() {
    return HomeScreenState(
      gameSettings: ref.watch(gameSettingsProvider),
    );
  }

  void setBotDifficulty(BotDifficulty difficulty) {
    ref.read(gameSettingsProvider.notifier).setBotDifficulty(difficulty);
  }
}
