import 'package:freezed_annotation/freezed_annotation.dart';

part 'tic_tac_toe_board.freezed.dart';

/// Represents the state of a Tic Tac Toe board.
/// The board consists of a list of 9 cells, each of which can be
/// empty (null) or occupied by a [TicTacToeSymbol] (player or bot).
@freezed
abstract class TicTacToeBoard with _$TicTacToeBoard {
  const factory TicTacToeBoard({
    @Default([null, null, null, null, null, null, null, null, null])
    List<TicTacToeSymbol?> cells,
  }) = _TicTacToeBoard;

  const TicTacToeBoard._();

  /// Checks if the board is full (no empty cells).
  bool get isFull => !cells.any((cell) => cell == null);

  /// Checks if there is a completed line (row, column, or diagonal) on the board.
  bool get hasCompletedLine {
    const winningIndices = [
      // Rows
      [0, 1, 2],
      [3, 4, 5],
      [6, 7, 8],
      // Columns
      [0, 3, 6],
      [1, 4, 7],
      [2, 5, 8],
      // Diagonals
      [0, 4, 8],
      [2, 4, 6],
    ];

    return winningIndices.any((line) {
      final firstSymbol = cells[line[0]];

      if (firstSymbol == null) {
        return false;
      }

      return line.every((index) => cells[index] == firstSymbol);
    });
  }

  TicTacToeSymbol? symbolAt(int index) {
    if (index < 0 || index >= cells.length) {
      return null;
    }
    return cells[index];
  }

  bool isCellEmpty(int index) {
    return cells.length > index && cells[index] == null;
  }

  TicTacToeBoard copyWithCell(int index, TicTacToeSymbol symbol) {
    if (index < 0 || index >= cells.length) {
      return this;
    }

    final updatedCelles = [...cells];
    updatedCelles[index] = symbol;

    return TicTacToeBoard(
      cells: updatedCelles,
    );
  }
}

enum TicTacToeSymbol { player, bot }
