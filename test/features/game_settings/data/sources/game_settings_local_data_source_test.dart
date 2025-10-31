import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:tic_tac_taupe/core/local_storage/app_local_storage.dart';
import 'package:tic_tac_taupe/features/game_settings/data/sources/game_settings_local_data_source.dart';

import 'game_settings_local_data_source_test.mocks.dart';

@GenerateMocks([AppLocalStorage])
void main() {
  late GameSettingsLocalDataSource dataSource;
  late MockAppLocalStorage mockAppLocalStorage;

  setUp(() {
    mockAppLocalStorage = MockAppLocalStorage();
    dataSource = GameSettingsLocalDataSource(appLocalStorage: mockAppLocalStorage);
  });

  const tSettingsJson = '{"botDifficulty":"hard"}';
  const tKey = 'game_settings';

  group('saveSettings', () {
    test('should call saveString on AppLocalStorage with the correct key and data', () async {
      // Arrange
      when(mockAppLocalStorage.saveString(key: anyNamed('key'), data: anyNamed('data')))
          .thenAnswer((_) async {});

      // Act
      await dataSource.saveSettings(tSettingsJson);

      // Assert
      verify(mockAppLocalStorage.saveString(key: tKey, data: tSettingsJson));
      verifyNoMoreInteractions(mockAppLocalStorage);
    });
  });

  group('fetchSettings', () {
    test('should call getString on AppLocalStorage with the correct key', () async {
      // Arrange
      when(mockAppLocalStorage.getString(key: anyNamed('key')))
          .thenAnswer((_) async => tSettingsJson);

      // Act
      final result = await dataSource.fetchSettings();

      // Assert
      expect(result, tSettingsJson);
      verify(mockAppLocalStorage.getString(key: tKey));
      verifyNoMoreInteractions(mockAppLocalStorage);
    });

    test('should return null when AppLocalStorage returns null', () async {
      // Arrange
      when(mockAppLocalStorage.getString(key: anyNamed('key')))
          .thenAnswer((_) async => null);

      // Act
      final result = await dataSource.fetchSettings();

      // Assert
      expect(result, isNull);
      verify(mockAppLocalStorage.getString(key: tKey));
      verifyNoMoreInteractions(mockAppLocalStorage);
    });
  });
}
