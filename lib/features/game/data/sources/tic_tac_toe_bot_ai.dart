import 'dart:math';

import 'package:tic_tac_taupe/features/game/domain/models/invalid_move_exception.dart';
import 'package:tic_tac_taupe/features/game/domain/models/tic_tac_toe_board.dart';


/// Abstract class representing a Tic Tac Toe bot AI.
abstract class TicTacToeBotAi {
  const TicTacToeBotAi();

  Future<int> getNextCellMove(TicTacToeBoard board);
}

/// A simple Tic Tac Toe bot that selects moves randomly.
class EasyTicTacToeBotAi extends TicTacToeBotAi {
  const EasyTicTacToeBotAi();

  @override
  Future<int> getNextCellMove(TicTacToeBoard board) async {
    final emptyCells = <int>[];

    for (int i = 0; i < board.cells.length; i++) {
      if (board.cells[i] == null) {
        emptyCells.add(i);
      }
    }

    if (emptyCells.isEmpty) {
      throw const NoMoreLegalMoveException();
    }

    final randomIndex = Random().nextInt(emptyCells.length);
    return emptyCells[randomIndex];
  }
}

/// A medium difficulty Tic Tac Toe bot that plays optimally most of the time
/// but occasionally makes random moves.
/// The [optimalMoveProbability] parameter controls the likelihood of making
/// the optimal move (between 0.0 and 1.0).
class MediumTicTacToeBotAi extends TicTacToeBotAi {
  const MediumTicTacToeBotAi({
    this.optimalMoveProbability = 0.75,
  });

  final double optimalMoveProbability;

  @override
  Future<int> getNextCellMove(TicTacToeBoard board) async {
    final random = Random();
    final shouldPlayOptimalMove = random.nextDouble() < optimalMoveProbability;

    if (shouldPlayOptimalMove) {
      // Use the hard AI to find the best move
      const hardAi = HardTicTacToeBotAi();
      return hardAi.getNextCellMove(board);
    } else {
      // Use the easy AI to find a random move
      const easyAi = EasyTicTacToeBotAi();
      return easyAi.getNextCellMove(board);
    }
  }
}

/// A hard Tic Tac Toe bot that uses the Minimax algorithm to play optimally.
/// This bot will never lose if played against.
/// 
/// This bot has been implemented using AI assistance.
class HardTicTacToeBotAi extends TicTacToeBotAi {
  const HardTicTacToeBotAi();

  @override
  Future<int> getNextCellMove(TicTacToeBoard board) async {
    int bestScore = -1000;
    int bestMove = -1;

    for (int i = 0; i < board.cells.length; i++) {
      if (board.isCellEmpty(i)) {
        final newBoard = board.copyWithCell(i, TicTacToeSymbol.bot);
        final moveScore = _minimax(newBoard, 0, false);
        if (moveScore > bestScore) {
          bestScore = moveScore;
          bestMove = i;
        }
      }
    }

    if (bestMove == -1) {
      throw const NoMoreLegalMoveException();
    }

    return bestMove;
  }

  int _evaluate(TicTacToeBoard board) {
    // Check rows for winner
    for (int i = 0; i < 3; i++) {
      if (board.symbolAt(i * 3) == board.symbolAt(i * 3 + 1) &&
          board.symbolAt(i * 3 + 1) == board.symbolAt(i * 3 + 2)) {
        if (board.symbolAt(i * 3) == TicTacToeSymbol.bot) return 10;
        if (board.symbolAt(i * 3) == TicTacToeSymbol.player) return -10;
      }
    }

    // Check columns for winner
    for (int i = 0; i < 3; i++) {
      if (board.symbolAt(i) == board.symbolAt(i + 3) &&
          board.symbolAt(i + 3) == board.symbolAt(i + 6)) {
        if (board.symbolAt(i) == TicTacToeSymbol.bot) return 10;
        if (board.symbolAt(i) == TicTacToeSymbol.player) return -10;
      }
    }

    // Check diagonals for winner
    if (board.symbolAt(0) == board.symbolAt(4) &&
        board.symbolAt(4) == board.symbolAt(8)) {
      if (board.symbolAt(0) == TicTacToeSymbol.bot) return 10;
      if (board.symbolAt(0) == TicTacToeSymbol.player) return -10;
    }
    if (board.symbolAt(2) == board.symbolAt(4) &&
        board.symbolAt(4) == board.symbolAt(6)) {
      if (board.symbolAt(2) == TicTacToeSymbol.bot) return 10;
      if (board.symbolAt(2) == TicTacToeSymbol.player) return -10;
    }

    return 0; // No winner
  }

  int _minimax(TicTacToeBoard board, int depth, bool isMaximizing) {
    final score = _evaluate(board);

    if (score == 10) return score - depth;
    if (score == -10) return score + depth;
    if (board.isFull) return 0;

    if (isMaximizing) {
      int best = -1000;
      for (int i = 0; i < board.cells.length; i++) {
        if (board.isCellEmpty(i)) {
          final newBoard = board.copyWithCell(i, TicTacToeSymbol.bot);
          best = max(best, _minimax(newBoard, depth + 1, false));
        }
      }
      return best;
    } else {
      int best = 1000;
      for (int i = 0; i < board.cells.length; i++) {
        if (board.isCellEmpty(i)) {
          final newBoard = board.copyWithCell(i, TicTacToeSymbol.player);
          best = min(best, _minimax(newBoard, depth + 1, true));
        }
      }
      return best;
    }
  }
}
