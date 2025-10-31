import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:tic_tac_taupe/features/game_settings/dependencies_injection.dart';
import 'package:tic_tac_taupe/features/game_settings/domain/models/game_settings.dart';
import 'package:tic_tac_taupe/features/game_settings/domain/repositories/game_settings_repository.dart';
import 'package:tic_tac_taupe/features/game_settings/presentation/states/game_settings_state.dart';

import 'game_settings_state_test.mocks.dart';

@GenerateMocks([GameSettingsRepository])
void main() {
  late MockGameSettingsRepository mockRepository;
  late ProviderContainer container;

  setUp(() {
    mockRepository = MockGameSettingsRepository();
    container = ProviderContainer(
      overrides: [
        gameSettingsRepositoryProvider.overrideWithValue(mockRepository),
      ],
    );
  });

  tearDown(() {
    container.dispose();
  });

  group('GameSettingsNotifier', () {
    test('build loads settings from repository', () async {
      // Arrange
      const settings = GameSettings(botDifficulty: BotDifficulty.hard);
      when(mockRepository.loadSettings()).thenAnswer((_) async => settings);

      // Act
      final result = await container.read(gameSettingsProvider.future);

      // Assert
      expect(result, settings);
      verify(mockRepository.loadSettings());
    });

    test(
      'build returns default settings when repository returns null',
      () async {
        // Arrange
        when(mockRepository.loadSettings()).thenAnswer((_) async => null);

        // Act
        final result = await container.read(gameSettingsProvider.future);

        // Assert
        expect(result, const GameSettings());
      },
    );

    test('setBotDifficulty updates state and saves settings', () async {
      // Arrange
      when(
        mockRepository.loadSettings(),
      ).thenAnswer((_) async => const GameSettings());
      when(mockRepository.saveSettings(any)).thenAnswer((_) async {});

      // Ensure the provider is initialized
      await container.read(gameSettingsProvider.future);

      final notifier = container.read(gameSettingsProvider.notifier);

      // Act
      notifier.setBotDifficulty(BotDifficulty.easy);

      // Assert
      final state = container.read(gameSettingsProvider);
      expect(
        state,
        const AsyncData(GameSettings(botDifficulty: BotDifficulty.easy)),
      );
      verify(
        mockRepository.saveSettings(
          const GameSettings(botDifficulty: BotDifficulty.easy),
        ),
      );
    });
  });
}
