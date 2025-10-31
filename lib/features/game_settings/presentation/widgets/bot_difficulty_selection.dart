import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tic_tac_taupe/core/widgets/button/app_button.dart';
import 'package:tic_tac_taupe/features/game_settings/dependencies_injection.dart';
import 'package:tic_tac_taupe/features/game_settings/domain/game_settings.dart';

class BotDifficultySelection extends StatelessWidget {
  const BotDifficultySelection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      spacing: 8,
      children: [
        _BotDifficultySelectionButton(
          label: 'Facile',
          difficulty: BotDifficulty.easy,
        ),
        _BotDifficultySelectionButton(
          label: 'Moyen',
          difficulty: BotDifficulty.medium,
        ),
        _BotDifficultySelectionButton(
          label: 'Difficile',
          difficulty: BotDifficulty.hard,
        ),
      ],
    );
  }
}

class _BotDifficultySelectionButton extends ConsumerWidget {
  const _BotDifficultySelectionButton({
    required this.label,
    required this.difficulty,
  });

  final String label;
  final BotDifficulty difficulty;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isSelected = ref.watch(
      gameSettingsProvider.select(
        (notifier) => notifier.botDifficulty == difficulty,
      ),
    );

    return AppButton(
      text: label,
      isSelected: isSelected,
      type: AppButtonType.secondary,
      onPressed: isSelected
          ? null
          : () {
              ref
                  .read(gameSettingsProvider.notifier)
                  .setBotDifficulty(difficulty);
            },
    );
  }
}
