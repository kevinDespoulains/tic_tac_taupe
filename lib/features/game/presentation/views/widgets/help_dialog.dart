import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tic_tac_taupe/core/themes/dependencies_injection.dart';
import 'package:tic_tac_taupe/core/widgets/button/app_button.dart';
import 'package:tic_tac_taupe/core/widgets/modal/app_modal.dart';
import 'package:tic_tac_taupe/core/widgets/text/app_text.dart';

class HelpDialog extends StatelessWidget with ShowableAppModal {
  const HelpDialog({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      spacing: 16,
      children: [
        _Title(),
        _Subtitle(),
        _CloseButton(),
      ],
    );
  }
}

class _Title extends ConsumerWidget {
  const _Title();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final textTheme = ref.watch(textThemeDataProvider);

    return AppText(
      'Comment jouer ?',
      style: textTheme.label1,
    );
  }
}

class _Subtitle extends ConsumerWidget {
  const _Subtitle();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final textTheme = ref.watch(textThemeDataProvider);

    return AppText(
      'Le but du jeu est d\'assommer trois taupes sur la même ligne, colonne ou diagonale avant qu\'elles ne s\'équipent d\'un casque !',
      style: textTheme.body,
    );
  }
}

class _CloseButton extends StatelessWidget {
  const _CloseButton();

  @override
  Widget build(BuildContext context) {
    return AppButton(
      text: 'Compris !',
      onPressed: () => Navigator.pop(context),
    );
  }
}
