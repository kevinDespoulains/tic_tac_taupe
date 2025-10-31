import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:tic_tac_taupe/core/theme/assets/assets.dart';
import 'package:tic_tac_taupe/core/widgets/button/app_button.dart';
import 'package:tic_tac_taupe/core/widgets/scaffold/app_scaffold.dart';
import 'package:tic_tac_taupe/features/game/domain/models/tic_tac_toe_board.dart';
import 'package:tic_tac_taupe/features/game/presentation/states/tic_tac_toe_game_state_notifier.dart';
import 'package:tic_tac_taupe/features/game/presentation/views/widgets/mole.dart';

class GameScreen extends StatelessWidget {
  const GameScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const AppScaffold(
      appBar: _AppBar(),
      body: _Body(),
    );
  }
}

class _AppBar extends StatelessWidget implements PreferredSizeWidget {
  const _AppBar();

  @override
  Size get preferredSize => const Size.fromHeight(64);

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          _HomeButton(),
        ],
      ),
    );
  }
}

class _HomeButton extends StatelessWidget {
  const _HomeButton();

  @override
  Widget build(BuildContext context) {
    return AppButton(
      leadingIcon: Icons.home,
      onPressed: () {
        context.go('/');
      },
    );
  }
}

class _Body extends StatelessWidget {
  const _Body();

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return Padding(
          padding: EdgeInsets.only(top: constraints.maxHeight / 4),
          child: const Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(child: _Board()),
              _Footer(),
            ],
          ),
        );
      },
    );
  }
}

class _Board extends StatelessWidget {
  const _Board();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Center(
        child: AspectRatio(
          aspectRatio: 1,
          child: Column(
            children: List.generate(3, (i) {
              return Expanded(
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: List.generate(3, (j) {
                    return Expanded(child: _Mole(index: i * 3 + j));
                  }),
                ),
              );
            }),
          ),
        ),
      ),
    );
  }
}

class _Mole extends ConsumerWidget {
  const _Mole({
    required this.index,
  });

  final int index;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final (isKnockedOut, isProtected, isPlayerTurn) = ref.watch(
      ticTacToeGameStateProvider.select(
        (notifier) {
          final (isKnockedOut, isProtected) = switch (notifier.board.symbolAt(
            index,
          )) {
            TicTacToeSymbol.bot => (false, true),
            TicTacToeSymbol.player => (true, false),
            _ => (false, false),
          };

          return (isKnockedOut, isProtected, notifier.isPlayerTurn);
        },
      ),
    );

    return Mole(
      isKnockedOut: isKnockedOut,
      isProtected: isProtected,
      isVisible: true,
      onTap: isPlayerTurn
          ? () async {
              try {
                await ref
                    .read(ticTacToeGameStateProvider.notifier)
                    .addPlayerSymbol(index);
              } catch (e) {
                // TODO(kevin): handle errors
              }
            }
          : null,
    );
  }
}

class _Footer extends StatelessWidget {
  const _Footer();

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      height: 200,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Positioned.fill(top: null, child: _Mud()),
          Positioned(
            bottom: 30,
            right: 0,
            height: 180,
            width: 180,
            child: Mole(
              isVisible: true,
            ),
          ),
        ],
      ),
    );
  }
}

class _Mud extends StatelessWidget {
  const _Mud();

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      Assets.mud,
      height: 100,
      fit: BoxFit.fitHeight,
      repeat: ImageRepeat.repeatX,
      alignment: Alignment.centerRight,
    );
  }
}
