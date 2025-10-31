import 'package:tic_tac_taupe/features/game/data/sources/tic_tac_toe_bot_ai.dart';
import 'package:tic_tac_taupe/features/game/domain/models/invalid_move_exception.dart';
import 'package:tic_tac_taupe/features/game/domain/models/tic_tac_toe_board.dart';
import 'package:tic_tac_taupe/features/game/domain/models/tic_tac_toe_game.dart';
import 'package:tic_tac_taupe/features/game/domain/repositories/tic_tac_toe_game_repository.dart';

/// Repository implementation for managing Tic Tac Toe game data.
class TicTacToeGameRepositoryImpl extends TicTacToeGameRepository {
  const TicTacToeGameRepositoryImpl({
    required TicTacToeBotAi botAi,
  }) : _botAi = botAi;

  final TicTacToeBotAi _botAi;

  @override
  Future<TicTacToeGame> addPlayerSymbol({
    required TicTacToeGame game,
    required int cellIndex,
  }) async {
    return _addSymbol(
      game: game,
      cellIndex: cellIndex,
      isPlayer: true,
    );
  }

  @override
  Future<TicTacToeGame> addBotSymbol({required TicTacToeGame game}) async {
    // Computes the next move for the bot using the AI.
    final cellIndex = await _botAi.getNextCellMove(game.board);

    return _addSymbol(
      game: game,
      cellIndex: cellIndex,
      isPlayer: false,
    );
  }

  TicTacToeGame _addSymbol({
    required TicTacToeGame game,
    required int cellIndex,
    required bool isPlayer,
  }) {
    final board = game.board;

    if (board.isCellEmpty(cellIndex)) {
      return game.copyWith(
        isPlayerTurn: !isPlayer,
        board: board.copyWithCell(
          cellIndex,
          isPlayer ? TicTacToeSymbol.player : TicTacToeSymbol.bot,
        ),
      );
    }

    throw const BadUserInputException();
  }
}
