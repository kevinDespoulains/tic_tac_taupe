import 'dart:math';

import 'package:fake_async/fake_async.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:tic_tac_taupe/features/game/dependencies_injection.dart';
import 'package:tic_tac_taupe/features/game/domain/models/invalid_move_exception.dart';
import 'package:tic_tac_taupe/features/game/domain/models/tic_tac_toe_board.dart';
import 'package:tic_tac_taupe/features/game/domain/models/tic_tac_toe_game.dart';
import 'package:tic_tac_taupe/features/game/domain/repositories/tic_tac_toe_game_repository.dart';
import 'package:tic_tac_taupe/features/game/presentation/states/tic_tac_toe_game_state.dart';

import 'tic_tac_toe_game_state_test.mocks.dart';

@GenerateMocks([TicTacToeGameRepository, Random])
void main() {
  late MockTicTacToeGameRepository mockRepository;
  late ProviderContainer container;
  late TicTacToeGameStateNotifier notifier;

  setUp(() {
    mockRepository = MockTicTacToeGameRepository();
    container = ProviderContainer(
      overrides: [
        ticTacToeGameRepositoryProvider.overrideWithValue(mockRepository),
      ],
    );
    notifier = container.read(ticTacToeGameStateProvider.notifier);
  });

  tearDown(() {
    container.dispose();
  });

  group('TicTacToeGameStateNotifier', () {
    test('initial state is a default TicTacToeGame', () {
      expect(
        container.read(ticTacToeGameStateProvider),
        const TicTacToeGame(),
      );
    });

    group('resetGame', () {
      test('when player starts, state is updated and no bot move is made', () {
        final random = MockRandom();
        when(random.nextBool()).thenReturn(true); // Player starts

        notifier.resetGame(random: random);

        expect(
          container.read(ticTacToeGameStateProvider),
          const TicTacToeGame(isPlayerTurn: true),
        );
        verifyNever(mockRepository.addBotSymbol(game: anyNamed('game')));
      });

      test(
        'when bot starts, state is updated and bot move is made after delay',
        () {
          FakeAsync().run((fakeAsync) {
            final random = MockRandom();
            when(random.nextBool()).thenReturn(false); // Bot starts
            const initialGame = TicTacToeGame(isPlayerTurn: false);
            final gameAfterBotMove = initialGame.copyWith(
              board: const TicTacToeBoard(
                cells: [
                  null,
                  null,
                  null,
                  TicTacToeSymbol.bot,
                  null,
                  null,
                  null,
                  null,
                  null,
                ],
              ),
              isPlayerTurn: true,
            );
            when(
              mockRepository.addBotSymbol(game: initialGame),
            ).thenAnswer((_) async => gameAfterBotMove);

            notifier.resetGame(random: random);

            expect(
              container.read(ticTacToeGameStateProvider),
              initialGame,
            );

            fakeAsync.elapse(const Duration(milliseconds: 2000));

            expect(
              container.read(ticTacToeGameStateProvider),
              gameAfterBotMove,
            );
            verify(mockRepository.addBotSymbol(game: initialGame)).called(1);
          });
        },
      );
    });

    group('addPlayerSymbol', () {
      test('throws WrongPlayerTurnException if not player\'s turn', () {
        notifier.state = const TicTacToeGame(isPlayerTurn: false);
        expect(
          () => notifier.addPlayerSymbol(0),
          throwsA(isA<WrongPlayerTurnException>()),
        );
      });

      test('throws NoMoreLegalMoveException if game is over', () {
        notifier.state = const TicTacToeGame(
          board: TicTacToeBoard(
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
          ),
          isPlayerTurn: true,
        );
        expect(
          () => notifier.addPlayerSymbol(3),
          throwsA(isA<NoMoreLegalMoveException>()),
        );
      });

      test(
        'player move and subsequent bot move are processed correctly',
        () {
          FakeAsync().run((fakeAsync) {
            const playerMoveIndex = 0;
            const initialGame = TicTacToeGame(isPlayerTurn: true);
            notifier.state = initialGame;

            final gameAfterPlayerMove = initialGame.copyWith(
              board: const TicTacToeBoard(
                cells: [
                  TicTacToeSymbol.player,
                  null,
                  null,
                  null,
                  null,
                  null,
                  null,
                  null,
                  null,
                ],
              ),
              isPlayerTurn: false,
            );
            final gameAfterBotMove = gameAfterPlayerMove.copyWith(
              board: const TicTacToeBoard(
                cells: [
                  TicTacToeSymbol.player,
                  TicTacToeSymbol.bot,
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

            when(
              mockRepository.addPlayerSymbol(
                game: initialGame,
                cellIndex: playerMoveIndex,
              ),
            ).thenAnswer((_) async => gameAfterPlayerMove);

            when(
              mockRepository.addBotSymbol(game: gameAfterPlayerMove),
            ).thenAnswer((_) async => gameAfterBotMove);

            notifier.addPlayerSymbol(playerMoveIndex);

            // After player move
            fakeAsync.flushMicrotasks();
            expect(
              container.read(ticTacToeGameStateProvider),
              gameAfterPlayerMove,
            );

            // Wait for bot move
            fakeAsync.elapse(const Duration(milliseconds: 2000));

            expect(
              container.read(ticTacToeGameStateProvider),
              gameAfterBotMove,
            );

            verify(
              mockRepository.addPlayerSymbol(
                game: initialGame,
                cellIndex: playerMoveIndex,
              ),
            ).called(1);
            verify(
              mockRepository.addBotSymbol(game: gameAfterPlayerMove),
            ).called(1);
          });
        },
      );
    });
  });
}
