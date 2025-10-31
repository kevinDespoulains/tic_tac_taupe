import 'dart:math';

import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:tic_tac_taupe/features/game/domain/models/tic_tac_toe_game.dart';
import 'package:tic_tac_taupe/features/game/presentation/states/tic_tac_toe_game_state.dart';

part 'mole_dialogs_state.g.dart';

@riverpod
class MoleDialogsStateNotifier extends _$MoleDialogsStateNotifier {
  @override
  String? build() {
    final gameState = ref.watch(ticTacToeGameStateProvider);
    String? dialog;

    // Dialog when player has two aligned items
    if (gameState.hasPlayerTwoAlignedItems) {
      dialog = Random().nextBool() ? 'Je vois ce que tu veux faire...' : null;
    }

    if (gameState.nobodyCanWin) {
      dialog = 'On dirait que ça va être un match nul...';
    }

    // Dialog when game is starting
    if (gameState.isGameStarting) {
      if (gameState.isPlayerTurn) {
        dialog = 'À toi de jouer !';
      } else {
        dialog = 'Je commence !';
      }
    }

    // Dialog when game is over
    if (gameState.isGameOver) {
      if (gameState.result != null) {
        switch (gameState.result) {
          case TicTacToeGameResult.playerWin:
            dialog = 'Tu t\'en sors pour cette fois !';
          case TicTacToeGameResult.botWin:
            dialog = 'Héhé, les taupes sont les meilleures !';
          case TicTacToeGameResult.draw:
            dialog = 'Match nul ! Bien joué !';
          default:
            dialog = null;
        }
      }
    }

    return dialog;
  }

  /// Sets the current dialog to be displayed.
  void setDialog(String dialog) {
    state = dialog;
  }
}
