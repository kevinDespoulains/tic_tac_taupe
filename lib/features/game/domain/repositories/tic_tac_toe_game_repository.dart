import 'package:tic_tac_taupe/features/game/domain/models/tic_tac_toe_game.dart';

/// A repository for managing Tic Tac Toe game data.
abstract class TicTacToeGameRepository {
  const TicTacToeGameRepository();

  /// Adds a symbol to the Tic Tac Toe board for the player.
  Future<TicTacToeGame> addPlayerSymbol({
    required TicTacToeGame game,
    required int cellIndex,
  });

  /// Adds a symbol to the Tic Tac Toe board for the bot.
  Future<TicTacToeGame> addBotSymbol({
    required TicTacToeGame game,
  });
}
