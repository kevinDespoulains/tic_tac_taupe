import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:tic_tac_taupe/features/game_settings/data/repositories/game_settings_repository_impl.dart';
import 'package:tic_tac_taupe/features/game_settings/data/sources/game_settings_local_data_source.dart';
import 'package:tic_tac_taupe/features/game_settings/domain/models/game_settings.dart';

import 'game_settings_repository_impl_test.mocks.dart';

@GenerateMocks([GameSettingsLocalDataSource])
void main() {
  late GameSettingsRepositoryImpl repository;
  late MockGameSettingsLocalDataSource mockDataSource;

  setUp(() {
    mockDataSource = MockGameSettingsLocalDataSource();
    repository = GameSettingsRepositoryImpl(dataSource: mockDataSource);
  });

  group('loadSettings', () {
    test('should return GameSettings when data source has settings', () async {
      // Arrange
      const settings = GameSettings(botDifficulty: BotDifficulty.hard);
      final settingsJson = jsonEncode(settings.toJson());
      when(
        mockDataSource.fetchSettings(),
      ).thenAnswer((_) async => settingsJson);

      // Act
      final result = await repository.loadSettings();

      // Assert
      expect(result, settings);
      verify(mockDataSource.fetchSettings());
      verifyNoMoreInteractions(mockDataSource);
    });

    test('should return null when data source has no settings', () async {
      // Arrange
      when(mockDataSource.fetchSettings()).thenAnswer((_) async => null);

      // Act
      final result = await repository.loadSettings();

      // Assert
      expect(result, isNull);
      verify(mockDataSource.fetchSettings());
      verifyNoMoreInteractions(mockDataSource);
    });
  });

  group('saveSettings', () {
    test('should call saveSettings on data source with encoded json', () async {
      // Arrange
      const settings = GameSettings(botDifficulty: BotDifficulty.easy);
      final settingsJson = jsonEncode(settings.toJson());
      when(mockDataSource.saveSettings(any)).thenAnswer((_) async {});

      // Act
      await repository.saveSettings(settings);

      // Assert
      verify(mockDataSource.saveSettings(settingsJson));
      verifyNoMoreInteractions(mockDataSource);
    });
  });
}
