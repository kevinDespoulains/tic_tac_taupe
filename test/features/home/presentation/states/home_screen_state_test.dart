import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:tic_tac_taupe/features/game_settings/domain/game_settings.dart';
import 'package:tic_tac_taupe/features/home/domain/models/home_screen_state.dart';
import 'package:tic_tac_taupe/features/home/presentation/states/home_screen_state.dart';

void main() {
  group('HomeScreenStateNotifier', () {
    late ProviderContainer container;

    setUp(() {
      container = ProviderContainer();
    });

    tearDown(() {
      container.dispose();
    });

    test('initial state is correct', () {
      final state = container.read(homeScreenStateProvider);
      expect(
        state,
        const HomeScreenState(
          gameSettings: GameSettings(botDifficulty: BotDifficulty.medium),
        ),
      );
    });

    test('setBotDifficulty updates the state', () {
      final notifier = container.read(homeScreenStateProvider.notifier);

      notifier.setBotDifficulty(BotDifficulty.hard);

      final newState = container.read(homeScreenStateProvider);

      expect(
        newState,
        const HomeScreenState(
          gameSettings: GameSettings(botDifficulty: BotDifficulty.hard),
        ),
      );
    });
  });
}
