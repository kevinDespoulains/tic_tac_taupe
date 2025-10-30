import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tic_tac_taupe/core/theme/dependencies_injection.dart';

/// A card widget that displays content within a decorated box.
class AppCard extends ConsumerWidget {
  const AppCard({
    super.key,
    this.color,
    this.borderWidth,
    this.borderColor,
    this.borderRadius,
    this.shadows,
    required this.child,
  });

  final Color? color;
  final double? borderWidth;
  final Color? borderColor;
  final double? borderRadius;
  final List<BoxShadow>? shadows;
  final Widget child;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colorTheme = ref.watch(colorThemeDataProvider);

    return DecoratedBox(
      decoration: ShapeDecoration(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(borderRadius ?? 32),
          side: BorderSide(
            width: borderWidth ?? 8,
            color: borderColor ?? colorTheme.surface.border,
          ),
        ),
        shadows: shadows,
        color: color ?? colorTheme.surface.surface,
      ),
      child: child,
    );
  }
}
