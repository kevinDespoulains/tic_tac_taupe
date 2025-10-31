import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:tic_tac_taupe/features/game/data/repositories/tic_tac_toe_game_repository_impl.dart';
import 'package:tic_tac_taupe/features/game/data/sources/tic_tac_toe_bot_ai.dart';
import 'package:tic_tac_taupe/features/game/domain/models/invalid_move_exception.dart';
import 'package:tic_tac_taupe/features/game/domain/models/tic_tac_toe_board.dart';
import 'package:tic_tac_taupe/features/game/domain/models/tic_tac_toe_game.dart';

import 'tic_tac_toe_game_repository_impl_test.mocks.dart';

@GenerateMocks([TicTacToeBotAi])
void main() {
  late TicTacToeGameRepositoryImpl repository;
  late MockTicTacToeBotAi mockBotAi;

  setUp(() {
    mockBotAi = MockTicTacToeBotAi();
    repository = TicTacToeGameRepositoryImpl(botAi: mockBotAi);
  });

  const initialGame = TicTacToeGame();

  group('addPlayerSymbol', () {
    test('should add player symbol and switch turn', () async {
      // Act
      final newGame = await repository.addPlayerSymbol(
        game: initialGame,
        cellIndex: 0,
      );

      // Assert
      expect(newGame.board.symbolAt(0), TicTacToeSymbol.player);
      expect(newGame.isPlayerTurn, isFalse);
    });

    test('should throw BadUserInputException for occupied cell', () {
      // Arrange
      final game = initialGame.copyWith(
        board: initialGame.board.copyWithCell(0, TicTacToeSymbol.bot),
      );

      // Act & Assert
      expect(
        () => repository.addPlayerSymbol(game: game, cellIndex: 0),
        throwsA(isA<BadUserInputException>()),
      );
    });
  });

  group('addBotSymbol', () {
    test(
      'should get next move from AI, add bot symbol, and switch turn',
      () async {
        // Arrange
        when(mockBotAi.getNextCellMove(any)).thenAnswer((_) async => 4);

        // Act
        final newGame = await repository.addBotSymbol(game: initialGame);

        // Assert
        verify(mockBotAi.getNextCellMove(initialGame.board));
        expect(newGame.board.symbolAt(4), TicTacToeSymbol.bot);
        expect(newGame.isPlayerTurn, isTrue);
      },
    );
  });
}
