import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:tic_tac_taupe/features/game/data/repositories/tic_tac_toe_game_repository_impl.dart';
import 'package:tic_tac_taupe/features/game/data/sources/tic_tac_toe_bot_ai.dart';
import 'package:tic_tac_taupe/features/game/domain/repositories/tic_tac_toe_game_repository.dart';
import 'package:tic_tac_taupe/features/game/presentation/states/tic_tac_toe_game_state_notifier.dart';
import 'package:tic_tac_taupe/features/game_settings/dependencies_injection.dart';
import 'package:tic_tac_taupe/features/game_settings/domain/game_settings.dart';

part 'dependencies_injection.g.dart';

@riverpod
TicTacToeBotAi ticTacToeBotAi(Ref ref) {
  final difficulty = ref.watch(gameSettingsProvider).botDifficulty;

  return switch (difficulty) {
    BotDifficulty.easy => const EasyTicTacToeBotAi(),
    BotDifficulty.medium => const MediumTicTacToeBotAi(),
    BotDifficulty.hard => const HardTicTacToeBotAi(),
  };
}

@riverpod
TicTacToeGameRepository ticTacToeGameRepository(Ref ref) {
  return TicTacToeGameRepositoryImpl(
    botAi: ref.watch(ticTacToeBotAiProvider),
  );
}

@riverpod
TicTacToeGameStateNotifier ticTacToeGameStateNotifier(Ref ref) {
  return TicTacToeGameStateNotifier();
}
