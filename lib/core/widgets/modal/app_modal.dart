import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tic_tac_taupe/core/themes/dependencies_injection.dart';
import 'package:tic_tac_taupe/core/widgets/card/app_card.dart';

mixin ShowableAppModal on Widget {
  Future<void> showMe(
    BuildContext context, {
    bool? barriereDismissible,
  }) async {
    return showDialog(
      context: context,
      barrierDismissible: barriereDismissible ?? true,
      builder: (context) {
        return Padding(
          padding: const EdgeInsets.all(32),
          child: Center(
            child: _ModalDecoration(child: this),
          ),
        );
      },
    );
  }
}

class _ModalDecoration extends ConsumerWidget {
  const _ModalDecoration({
    required this.child,
  });

  final Widget child;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colorTheme = ref.watch(colorThemeDataProvider);

    return ConstrainedBox(
      constraints: const BoxConstraints(
        maxWidth: 400,
      ),
      child: AppCard(
        color: colorTheme.surface.surfaceVariant,
        borderColor: colorTheme.surface.onSurface,
        borderRadius: 16,
        borderWidth: 2,
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: child,
        ),
      ),
    );
  }
}
