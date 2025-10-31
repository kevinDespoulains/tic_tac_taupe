import 'package:flutter_test/flutter_test.dart';
import 'package:tic_tac_taupe/features/game/domain/models/tic_tac_toe_board.dart';

void main() {
  group('TicTacToeBoard', () {
    test('initial board is empty', () {
      const board = TicTacToeBoard();
      expect(board.cells.every((cell) => cell == null), isTrue);
    });

    test('isFull returns true when all cells are filled', () {
      const board = TicTacToeBoard(
        cells: [
          TicTacToeSymbol.player,
          TicTacToeSymbol.bot,
          TicTacToeSymbol.player,
          TicTacToeSymbol.bot,
          TicTacToeSymbol.player,
          TicTacToeSymbol.bot,
          TicTacToeSymbol.bot,
          TicTacToeSymbol.player,
          TicTacToeSymbol.bot,
        ],
      );
      expect(board.isFull, isTrue);
    });

    test('isFull returns false when some cells are empty', () {
      const board = TicTacToeBoard(
        cells: [
          TicTacToeSymbol.player, null, TicTacToeSymbol.player,
          // ...
        ],
      );
      expect(board.isFull, isFalse);
    });

    test('hasCompletedLine returns true for a winning row', () {
      const board = TicTacToeBoard(
        cells: [
          TicTacToeSymbol.player,
          TicTacToeSymbol.player,
          TicTacToeSymbol.player,
          null,
          null,
          null,
          null,
          null,
          null,
        ],
      );
      expect(board.hasCompletedLine, isTrue);
    });

    test('hasCompletedLine returns true for a winning column', () {
      const board = TicTacToeBoard(
        cells: [
          TicTacToeSymbol.bot,
          null,
          null,
          TicTacToeSymbol.bot,
          null,
          null,
          TicTacToeSymbol.bot,
          null,
          null,
        ],
      );
      expect(board.hasCompletedLine, isTrue);
    });

    test('hasCompletedLine returns true for a winning diagonal', () {
      const board = TicTacToeBoard(
        cells: [
          TicTacToeSymbol.player,
          null,
          null,
          null,
          TicTacToeSymbol.player,
          null,
          null,
          null,
          TicTacToeSymbol.player,
        ],
      );
      expect(board.hasCompletedLine, isTrue);
    });

    test('hasCompletedLine returns false for a non-winning board', () {
      const board = TicTacToeBoard(
        cells: [
          TicTacToeSymbol.player,
          TicTacToeSymbol.bot,
          TicTacToeSymbol.player,
          TicTacToeSymbol.player,
          TicTacToeSymbol.bot,
          null,
          TicTacToeSymbol.bot,
          null,
          TicTacToeSymbol.player,
        ],
      );
      expect(board.hasCompletedLine, isFalse);
    });

    test('copyWithCell updates the correct cell', () {
      const board = TicTacToeBoard();
      final newBoard = board.copyWithCell(4, TicTacToeSymbol.player);
      expect(newBoard.symbolAt(4), TicTacToeSymbol.player);
      expect(board.symbolAt(4), isNull); // Ensure original is unchanged
    });
  });
}
