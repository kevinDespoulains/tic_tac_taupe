import 'dart:math';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:tic_tac_taupe/features/game/domain/models/tic_tac_toe_board.dart';
import 'package:tic_tac_taupe/features/game/domain/models/tic_tac_toe_game.dart';
import 'package:tic_tac_taupe/features/game/presentation/states/mole_dialogs_state.dart';
import 'package:tic_tac_taupe/features/game/presentation/states/tic_tac_toe_game_state.dart';

import 'mole_dialogs_state_test.mocks.dart';

// A mock for the TicTacToeGameStateNotifier that allows us to manually set its state.
class MockTicTacToeGameStateNotifier extends TicTacToeGameStateNotifier {
  @override
  TicTacToeGame build() {
    return const TicTacToeGame();
  }

  // A method to manually set the state for testing purposes.
  void setState(TicTacToeGame newState) {
    state = newState;
  }
}

@GenerateMocks([Random])
void main() {
  late MoleDialogsStateNotifier notifier;
  late MockRandom mockRandom;

  setUp(() {
    // We instantiate the notifier directly for testing its pure method.
    notifier = MoleDialogsStateNotifier();
    mockRandom = MockRandom();
  });

  group('MoleDialogsStateNotifier.generateDialog', () {
    test('initial dialog when game is starting and player\'s turn', () {
      const gameState = TicTacToeGame(isPlayerTurn: true);
      final dialog = notifier.generateDialog(gameState, mockRandom);
      expect(dialog, 'À toi de jouer !');
    });

    test('initial dialog when game is starting and bot\'s turn', () {
      const gameState = TicTacToeGame(isPlayerTurn: false);
      final dialog = notifier.generateDialog(gameState, mockRandom);
      expect(dialog, 'Je commence !');
    });

    test('dialog when player has two aligned items (random true)', () {
      when(mockRandom.nextBool()).thenReturn(true);
      const gameState = TicTacToeGame(
        board: TicTacToeBoard(
          cells: [
            TicTacToeSymbol.player,
            TicTacToeSymbol.player,
            null,
            null,
            null,
            null,
            null,
            null,
            null,
          ],
        ),
        isPlayerTurn: true,
      );
      final dialog = notifier.generateDialog(gameState, mockRandom);
      expect(dialog, 'Je vois ce que tu veux faire...');
    });

    test('dialog when player has two aligned items (random false)', () {
      when(mockRandom.nextBool()).thenReturn(false);
      const gameState = TicTacToeGame(
        board: TicTacToeBoard(
          cells: [
            TicTacToeSymbol.player,
            TicTacToeSymbol.player,
            null,
            null,
            null,
            null,
            null,
            null,
            null,
          ],
        ),
        isPlayerTurn: true,
      );
      final dialog = notifier.generateDialog(gameState, mockRandom);
      expect(dialog, isNull);
    });

    test('dialog when nobody can win', () {
      const gameState = TicTacToeGame(
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
      );
      final dialog = notifier.generateDialog(gameState, mockRandom);
      expect(dialog, 'Match nul ! Bien joué !');
    });

    test('dialog when player wins', () {
      const gameState = TicTacToeGame(
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
        isPlayerTurn: false,
      );
      final dialog = notifier.generateDialog(gameState, mockRandom);
      expect(dialog, 'Tu t\'en sors pour cette fois !');
    });

    test('dialog when bot wins', () {
      when(mockRandom.nextBool()).thenReturn(true);
      const gameState = TicTacToeGame(
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
        isPlayerTurn: true,
      );
      final dialog = notifier.generateDialog(gameState, mockRandom);
      expect(dialog, 'Héhé, les taupes sont les meilleures !');
    });

    test('dialog when it is a draw', () {
      const gameState = TicTacToeGame(
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
      );
      final dialog = notifier.generateDialog(gameState, mockRandom);
      expect(dialog, 'Match nul ! Bien joué !');
    });
  });

  test('setDialog updates the state', () {
    // For this test, we need a container to test the state management aspect.
    final mockNotifier = MockTicTacToeGameStateNotifier();
    final container = ProviderContainer(
      overrides: [
        // We still need to override the game state provider for the mole dialogs provider to build.
        ticTacToeGameStateProvider.overrideWith(() => mockNotifier),
      ],
    );

    const dialog = 'Test dialog';
    // We get the real notifier to test its state-updating method.
    container.read(moleDialogsStateProvider.notifier).setDialog(dialog);
    // We read the state from the provider to see if it was updated.
    expect(container.read(moleDialogsStateProvider), dialog);
  });
}
