import 'dart:math';

import 'package:flutter/foundation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:tic_tac_taupe/core/i18n/localizations.dart';
import 'package:tic_tac_taupe/features/game/domain/models/tic_tac_toe_game.dart';
import 'package:tic_tac_taupe/features/game/presentation/states/tic_tac_toe_game_state.dart';

part 'mole_dialogs_state.g.dart';

@riverpod
class MoleDialogsStateNotifier extends _$MoleDialogsStateNotifier {
  @override
  String? build() {
    final gameState = ref.watch(ticTacToeGameStateProvider);
    return generateDialog(gameState);
  }

  @visibleForTesting
  String? generateDialog(TicTacToeGame gameState, [Random? random]) {
    String? dialog;

    // Dialog when player has two aligned items
    if (gameState.hasPlayerTwoAlignedItems) {
      dialog = (random ?? Random()).nextBool()
          ? AppLocalizations.obviousGamePlayDialog
          : null;
    }

    if (gameState.nobodyCanWin) {
      dialog = AppLocalizations.leadsToDrawDialog;
    }

    // Dialog when game is starting
    if (gameState.isGameStarting) {
      if (gameState.isPlayerTurn) {
        dialog = AppLocalizations.playerTurnDialog;
      } else {
        dialog = AppLocalizations.botTurnDialog;
      }
    }

    // Dialog when game is over
    if (gameState.isGameOver) {
      if (gameState.result != null) {
        switch (gameState.result) {
          case TicTacToeGameResult.playerWin:
            dialog = AppLocalizations.playerWinDialog;
          case TicTacToeGameResult.botWin:
            dialog = AppLocalizations.botWinDialog;
          case TicTacToeGameResult.draw:
            dialog = AppLocalizations.drawDialog;
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
