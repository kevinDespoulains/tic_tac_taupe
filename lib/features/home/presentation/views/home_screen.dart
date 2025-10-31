import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:tic_tac_taupe/core/themes/dependencies_injection.dart';
import 'package:tic_tac_taupe/core/widgets/button/app_button.dart';
import 'package:tic_tac_taupe/core/widgets/card/app_card.dart';
import 'package:tic_tac_taupe/core/widgets/scaffold/app_scaffold.dart';
import 'package:tic_tac_taupe/core/widgets/text/app_text.dart';
import 'package:tic_tac_taupe/features/game_settings/presentation/widgets/bot_difficulty_selection.dart';
import 'package:tic_tac_taupe/features/navigation/routes.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const AppScaffold(
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(16),
          child: _Card(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              spacing: 16,
              children: [
                _Title(),
                _Menu(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _Card extends ConsumerWidget {
  const _Card({
    required this.child,
  });

  final Widget child;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colorTheme = ref.watch(colorThemeDataProvider);

    return Stack(
      clipBehavior: Clip.none,
      alignment: Alignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 24),
          child: AppCard(
            shadows: [
              BoxShadow(
                blurRadius: 8,
                color: colorTheme.shadow,
                offset: const Offset(0, 4),
              ),
            ],
            child: Padding(
              padding: const EdgeInsets.all(24),
              child: child,
            ),
          ),
        ),
        const Positioned(
          bottom: 0,
          child: Center(
            child: _StartGameButton(),
          ),
        ),
      ],
    );
  }
}

class _Title extends ConsumerWidget {
  const _Title();

  @override
  Widget build(BuildContext contex, WidgetRef ref) {
    final colorTheme = ref.watch(colorThemeDataProvider);
    final textTheme = ref.watch(textThemeDataProvider);

    return AppText(
      'Tic Tac Taupe',
      style: textTheme.title1.copyWith(color: colorTheme.primary.variant.base),
      borderColor: colorTheme.surface.onSurface,
      borderWidth: 8,
      textAlign: TextAlign.center,
    );
  }
}

class _Menu extends ConsumerWidget {
  const _Menu();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colorTheme = ref.watch(colorThemeDataProvider);

    return SizedBox(
      width: 300,
      child: AppCard(
        color: colorTheme.surface.surfaceVariant,
        borderColor: colorTheme.surface.onSurface,
        borderRadius: 16,
        borderWidth: 2,
        child: const Padding(
          padding: EdgeInsets.all(16),
          child: Column(
            spacing: 8,
            children: [
              _MenuTitle(),
              BotDifficultySelection(),
            ],
          ),
        ),
      ),
    );
  }
}

class _MenuTitle extends ConsumerWidget {
  const _MenuTitle();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final textTheme = ref.watch(textThemeDataProvider);

    return AppText(
      'Niveau de l\'adversaire',
      style: textTheme.title2,
      overflow: TextOverflow.ellipsis,
      textAlign: TextAlign.center,
    );
  }
}

class _StartGameButton extends StatelessWidget {
  const _StartGameButton();

  @override
  Widget build(BuildContext context) {
    return AppButton(
      text: 'Jouer !',
      size: AppButtonSize.large,
      onPressed: () {
        context.go(AppRoutes.game);
      },
    );
  }
}
