import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:tic_tac_taupe/features/game/dependencies_injection.dart';
import 'package:tic_tac_taupe/features/game/domain/models/invalid_move_exception.dart';
import 'package:tic_tac_taupe/features/game/domain/models/tic_tac_toe_game.dart';
import 'package:tic_tac_taupe/features/game/domain/repositories/tic_tac_toe_game_repository.dart';

part 'tic_tac_toe_game_state_notifier.g.dart';

@riverpod
class TicTacToeGameStateNotifier extends _$TicTacToeGameStateNotifier {
  static const _botDelay = Duration(milliseconds: 500);

  @override
  TicTacToeGame build() => const TicTacToeGame();

  /// Initializes the game state with a new game.
  void initializeGame(TicTacToeGame game) {
    // TODO(kevin): determine who starts the game
    state = game;
  }

  /// Adds the player's symbol to the specified cell index.
  Future<void> addPlayerSymbol(int index) async {
    // Checks if it's the player's turn.
    if (!state.isPlayerTurn) {
      throw const WrongPlayerTurnException();
    }

    // Adds the player's symbol and updates the state.
    state = await _addSymbol(
      (repository) => repository.addPlayerSymbol(game: state, cellIndex: index),
    );

    // Makes the bot's move after a delay.
    await Future.delayed(_botDelay, () async => _addBotSymbol());
  }

  /// Adds the bot's symbol to the game state.
  Future<void> _addBotSymbol() async {
    // Checks if it's the bot's turn.
    if (state.isPlayerTurn) {
      throw const WrongPlayerTurnException();
    }

    state = await _addSymbol(
      (repository) => repository.addBotSymbol(game: state),
    );
  }

  Future<TicTacToeGame> _addSymbol(
    Future<TicTacToeGame> Function(TicTacToeGameRepository repository) callback,
  ) {
    final repository = ref.read(ticTacToeGameRepositoryProvider);

    if (state.isGameOver) {
      throw const NoMoreLegalMoveException();
    }

    return callback(repository);
  }
}
