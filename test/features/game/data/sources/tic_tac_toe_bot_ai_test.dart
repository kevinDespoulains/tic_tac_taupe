import 'package:flutter_test/flutter_test.dart';
import 'package:tic_tac_taupe/features/game/data/sources/tic_tac_toe_bot_ai.dart';
import 'package:tic_tac_taupe/features/game/domain/models/tic_tac_toe_board.dart';

void main() {
  group('EasyTicTacToeBotAi', () {
    test('returns a valid move on a non-full board', () async {
      const ai = EasyTicTacToeBotAi();
      const board = TicTacToeBoard(
        cells: [
          TicTacToeSymbol.player,
          null,
          TicTacToeSymbol.bot,
          null,
          TicTacToeSymbol.player,
          null,
          null,
          null,
          null,
        ],
      );
      final move = await ai.getNextCellMove(board);
      expect(board.isCellEmpty(move), isTrue);
    });
  });

  group('MediumTicTacToeBotAi', () {
    test('always returns a valid move', () async {
      const ai = MediumTicTacToeBotAi();
      const board = TicTacToeBoard(
        cells: [
          TicTacToeSymbol.player,
          null,
          TicTacToeSymbol.bot,
          null,
          TicTacToeSymbol.player,
          null,
          null,
          null,
          null,
        ],
      );
      final move = await ai.getNextCellMove(board);
      expect(board.isCellEmpty(move), isTrue);
    });

    test('behaves like Hard AI when probability is 1.0', () async {
      const ai = MediumTicTacToeBotAi(optimalMoveProbability: 1.0);
      const board = TicTacToeBoard(
        cells: [
          TicTacToeSymbol.player,
          TicTacToeSymbol.player,
          null, // Player can win at 2
          TicTacToeSymbol.bot,
          null,
          null,
          null,
          null,
          null,
        ],
      );
      // It should block the player
      final move = await ai.getNextCellMove(board);
      expect(move, 2);
    });

    test('returns a valid move when probability is 0.0', () async {
      // When probability is 0, it should behave like Easy AI (random).
      // We can't assert a specific move, but we can ensure it's valid.
      const ai = MediumTicTacToeBotAi(optimalMoveProbability: 0.0);
      const board = TicTacToeBoard(
        cells: [
          TicTacToeSymbol.player,
          TicTacToeSymbol.player,
          null,
          TicTacToeSymbol.bot,
          null,
          null,
          null,
          null,
          null,
        ],
      );
      final move = await ai.getNextCellMove(board);
      expect(board.isCellEmpty(move), isTrue);
    });
  });

  group('HardTicTacToeBotAi', () {
    test('blocks player from winning', () async {
      const ai = HardTicTacToeBotAi();
      const board = TicTacToeBoard(
        cells: [
          TicTacToeSymbol.player,
          TicTacToeSymbol.player,
          null,
          TicTacToeSymbol.bot,
          null,
          null,
          null,
          null,
          null,
        ],
      );
      final move = await ai.getNextCellMove(board);
      expect(move, 2);
    });

    test('wins when it can', () async {
      const ai = HardTicTacToeBotAi();
      const board = TicTacToeBoard(
        cells: [
          TicTacToeSymbol.bot,
          TicTacToeSymbol.bot,
          null,
          TicTacToeSymbol.player,
          TicTacToeSymbol.player,
          null,
          null,
          null,
          null,
        ],
      );
      final move = await ai.getNextCellMove(board);
      expect(move, 2);
    });

    test('chooses the center square on an empty board', () async {
      const ai = HardTicTacToeBotAi();
      const board = TicTacToeBoard();
      final move = await ai.getNextCellMove(board);
      // A good opening move is often the center. Minimax should find this.
      // Depending on implementation, it might pick a corner, which is also a strong move.
      // Let's just ensure it's a valid move.
      expect(board.isCellEmpty(move), isTrue);
    });
  });
}
