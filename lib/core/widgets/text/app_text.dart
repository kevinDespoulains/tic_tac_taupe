import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tic_tac_taupe/core/themes/dependencies_injection.dart';

/// A text widget that uses the app's theming for colors and styles.
class AppText extends ConsumerWidget {
  const AppText(
    this.text, {
    super.key,
    this.style,
    this.overflow,
    this.maxLines,
    this.borderColor,
    this.borderWidth,
    this.textAlign,
  });

  final String text;
  final TextStyle? style;
  final TextOverflow? overflow;
  final int? maxLines;
  final Color? borderColor;
  final double? borderWidth;
  final TextAlign? textAlign;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final textTheme = ref.watch(textThemeDataProvider);
    final colorTheme = ref.watch(colorThemeDataProvider);
    final localBorderWidth = borderWidth;
    final localBorderColor = borderColor;
    final effectiveStyle = (style ?? textTheme.body).copyWith(
      color: style?.color ?? colorTheme.surface.onSurface,
    );

    final textWidget = Text(
      text,
      style: effectiveStyle,
      overflow: overflow,
      maxLines: maxLines,
      textAlign: textAlign,
    );

    if (localBorderColor != null && localBorderWidth != null) {
      return Stack(
        children: [
          Text(
            text,
            style: effectiveStyle.copyWith(
              foreground: Paint()
                ..style = PaintingStyle.stroke
                ..strokeWidth = localBorderWidth
                ..color = localBorderColor,
              color: null,
            ),
            overflow: overflow,
            maxLines: maxLines,
            textAlign: textAlign,
          ),
          textWidget,
        ],
      );
    }

    return textWidget;
  }
}
