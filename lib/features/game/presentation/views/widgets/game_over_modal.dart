import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:tic_tac_taupe/core/inherited_data/build_context_extensions.dart';
import 'package:tic_tac_taupe/core/inherited_data/inherited_data.dart';
import 'package:tic_tac_taupe/core/themes/dependencies_injection.dart';
import 'package:tic_tac_taupe/core/widgets/button/app_button.dart';
import 'package:tic_tac_taupe/core/widgets/modal/app_modal.dart';
import 'package:tic_tac_taupe/core/widgets/text/app_text.dart';
import 'package:tic_tac_taupe/features/game/domain/models/tic_tac_toe_game.dart';
import 'package:tic_tac_taupe/features/navigation/routes.dart';

class GameOverModal extends StatelessWidget with ShowableAppModal {
  const GameOverModal({
    super.key,
    required this.result,
  });

  final TicTacToeGameResult result;

  @override
  Widget build(BuildContext context) {
    return InheritedData(
      data: result,
      child: const Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        spacing: 16,
        children: [
          _Title(),
          _Subtitle(),
          _LeaveButton(),
        ],
      ),
    );
  }
}

class _Title extends ConsumerWidget {
  const _Title();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final result = context.watchInheritedData<TicTacToeGameResult>();
    final textTheme = ref.watch(textThemeDataProvider);

    return AppText(
      switch (result) {
        TicTacToeGameResult.playerWin => 'Félicitations ! Tu as gagné !',
        TicTacToeGameResult.botWin => 'Oh non ! Les taupes ont gagné !',
        TicTacToeGameResult.draw => 'Match nul !',
      },
      style: textTheme.label1,
    );
  }
}

class _Subtitle extends ConsumerWidget {
  const _Subtitle();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final result = context.watchInheritedData<TicTacToeGameResult>();
    final textTheme = ref.watch(textThemeDataProvider);

    return AppText(
      switch (result) {
        TicTacToeGameResult.playerWin =>
          'Ton jardin est maintenant en sécurité !',
        TicTacToeGameResult.botWin =>
          'Tu les auras peut-être la prochaine fois !',
        TicTacToeGameResult.draw =>
          'Tu es au moins aussi rusé qu\'une taupe...',
      },
      style: textTheme.body,
    );
  }
}

class _LeaveButton extends ConsumerWidget {
  const _LeaveButton();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return AppButton(
      text: 'Retour au menu',
      onPressed: () {
        context.go(AppRoutes.home);
      },
    );
  }
}
