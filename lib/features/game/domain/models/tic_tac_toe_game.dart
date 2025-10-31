import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:tic_tac_taupe/features/game/domain/models/tic_tac_toe_board.dart';

part 'tic_tac_toe_game.freezed.dart';

/// Represents the state of a Tic Tac Toe game, including the board and whose turn it is.
@freezed
abstract class TicTacToeGame with _$TicTacToeGame {
  const factory TicTacToeGame({
    @Default(TicTacToeBoard()) TicTacToeBoard board,
    @Default(true) bool isPlayerTurn,
  }) = _TicTacToeGame;

  const TicTacToeGame._();

  bool get isGameOver => board.isFull || board.hasCompletedLine;

  TitTacToeGameResult? get result {
    if (!isGameOver) {
      return null;
    }

    if (board.hasCompletedLine) {
      return isPlayerTurn
          ? TitTacToeGameResult.botWin
          : TitTacToeGameResult.playerWin;
    } else {
      return TitTacToeGameResult.draw;
    }
  }
}

enum TitTacToeGameResult {
  playerWin,
  botWin,
  draw,
}
