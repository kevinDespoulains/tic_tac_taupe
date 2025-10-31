import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:tic_tac_taupe/core/dependencies_injection.dart';
import 'package:tic_tac_taupe/features/game_settings/data/repositories/game_settings_repository_impl.dart';
import 'package:tic_tac_taupe/features/game_settings/data/sources/game_settings_local_data_source.dart';
import 'package:tic_tac_taupe/features/game_settings/domain/repositories/game_settings_repository.dart';

part 'dependencies_injection.g.dart';

@riverpod
GameSettingsRepository gameSettingsRepository(Ref ref) {
  return GameSettingsRepositoryImpl(
    dataSource: GameSettingsLocalDataSource(
      appLocalStorage: ref.read(appLocalStorageProvider),
    ),
  );
}
