import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tic_tac_taupe/core/themes/dependencies_injection.dart';
import 'package:tic_tac_taupe/core/widgets/button/app_button.dart';
import 'package:tic_tac_taupe/features/game_settings/domain/models/game_settings.dart';
import 'package:tic_tac_taupe/features/game_settings/presentation/states/game_settings_state.dart';

class BotDifficultySelection extends ConsumerWidget {
  const BotDifficultySelection({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(gameSettingsProvider);

    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 300),
      switchInCurve: Curves.easeInOut,
      child: switch (state) {
        (AsyncLoading _) => const _LoadingBody(),
        _ => const _LoadedBody(),
      },
    );
  }
}

class _LoadingBody extends ConsumerWidget {
  const _LoadingBody();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colorTheme = ref.watch(colorThemeDataProvider);

    return Stack(
      alignment: Alignment.center,
      children: [
        // Used to keep the size of the widget, not the best but works here because
        // the loaded body is quite simple
        const Opacity(opacity: 0, child: _LoadedBody()),
        CircularProgressIndicator(color: colorTheme.surface.onSurface),
      ],
    );
  }
}

class _LoadedBody extends StatelessWidget {
  const _LoadedBody();

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
        (notifier) => notifier.value?.botDifficulty == difficulty,
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
