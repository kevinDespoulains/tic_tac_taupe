import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:tic_tac_taupe/features/game/domain/models/tic_tac_toe_board.dart';
import 'package:tic_tac_taupe/features/game/domain/models/tic_tac_toe_game.dart';
import 'package:tic_tac_taupe/features/game/presentation/states/mole_dialogs_state.dart';
import 'package:tic_tac_taupe/features/game/presentation/states/tic_tac_toe_game_state.dart';

// A mock for the TicTacToeGameStateNotifier that allows us to manually set its state.
class MockTicTacToeGameStateNotifier extends TicTacToeGameStateNotifier {
  @override
  TicTacToeGame build() {
    // The initial state here doesn't matter for the tests,
    // as we will be setting it manually.
    return const TicTacToeGame();
  }

  // A method to manually set the state for testing purposes.
  void setState(TicTacToeGame newState) {
    state = newState;
  }
}

void main() {
  // This helper function creates a ProviderContainer for testing.
  // It overrides the ticTacToeGameStateProvider to use our mock notifier.
  ProviderContainer createContainer({
    required TicTacToeGame gameState,
  }) {
    final mockNotifier = MockTicTacToeGameStateNotifier();

    final container = ProviderContainer(
      overrides: [
        ticTacToeGameStateProvider.overrideWith(() => mockNotifier),
      ],
    );

    // We need to ensure the state is set on the notifier instance that the container is using.
    final notifier =
        container.read(ticTacToeGameStateProvider.notifier)
            as MockTicTacToeGameStateNotifier;
    notifier.setState(gameState);

    // We need to listen to the provider to make sure it's initialized.
    container.listen(moleDialogsStateProvider, (previous, next) {});

    return container;
  }

  group('MoleDialogsStateNotifier', () {
    test('initial dialog when game is starting and player\'s turn', () {
      final container = createContainer(
        gameState: const TicTacToeGame(isPlayerTurn: true),
      );
      expect(container.read(moleDialogsStateProvider), 'À toi de jouer !');
    });

    test('initial dialog when game is starting and bot\'s turn', () {
      final container = createContainer(
        gameState: const TicTacToeGame(isPlayerTurn: false),
      );
      expect(container.read(moleDialogsStateProvider), 'Je commence !');
    });

    test('dialog when nobody can win', () {
      final container = createContainer(
        gameState: const TicTacToeGame(
          board: TicTacToeBoard(
            cells: [
              TicTacToeSymbol.player,
              TicTacToeSymbol.bot,
              TicTacToeSymbol.player,
              TicTacToeSymbol.player,
              TicTacToeSymbol.bot,
              TicTacToeSymbol.bot,
              TicTacToeSymbol.bot,
              TicTacToeSymbol.player,
              TicTacToeSymbol.player,
            ],
          ),
          isPlayerTurn: false,
        ),
      );
      expect(
        container.read(moleDialogsStateProvider),
        'Match nul ! Bien joué !',
      );
    });

    test('dialog when player wins', () {
      final container = createContainer(
        gameState: const TicTacToeGame(
          board: TicTacToeBoard(
            cells: [
              TicTacToeSymbol.player,
              TicTacToeSymbol.player,
              TicTacToeSymbol.player,
              TicTacToeSymbol.bot,
              TicTacToeSymbol.bot,
              null,
              null,
              null,
              null,
            ],
          ),
          isPlayerTurn:
              false, // It was player's turn, now it's bot's turn, so player won
        ),
      );
      expect(
        container.read(moleDialogsStateProvider),
        'Tu t\'en sors pour cette fois !',
      );
    });

    test('dialog when bot wins', () {
      final container = createContainer(
        gameState: const TicTacToeGame(
          board: TicTacToeBoard(
            cells: [
              TicTacToeSymbol.bot,
              TicTacToeSymbol.bot,
              TicTacToeSymbol.bot,
              TicTacToeSymbol.player,
              TicTacToeSymbol.player,
              null,
              null,
              null,
              null,
            ],
          ),
          isPlayerTurn:
              true, // It was bot's turn, now it's player's turn, so bot won
        ),
      );
      expect(
        container.read(moleDialogsStateProvider),
        'Héhé, les taupes sont les meilleures !',
      );
    });

    test('dialog when it is a draw', () {
      final container = createContainer(
        gameState: const TicTacToeGame(
          board: TicTacToeBoard(
            cells: [
              TicTacToeSymbol.player,
              TicTacToeSymbol.bot,
              TicTacToeSymbol.player,
              TicTacToeSymbol.player,
              TicTacToeSymbol.bot,
              TicTacToeSymbol.player,
              TicTacToeSymbol.bot,
              TicTacToeSymbol.player,
              TicTacToeSymbol.bot,
            ],
          ),
          isPlayerTurn: true,
        ),
      );
      expect(
        container.read(moleDialogsStateProvider),
        'Match nul ! Bien joué !',
      );
    });

    test('setDialog updates the state', () {
      final container = createContainer(
        gameState: const TicTacToeGame(),
      );
      const dialog = 'Test dialog';
      container.read(moleDialogsStateProvider.notifier).setDialog(dialog);
      expect(container.read(moleDialogsStateProvider), dialog);
    });
  });
}
