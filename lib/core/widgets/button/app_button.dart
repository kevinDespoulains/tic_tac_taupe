import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tic_tac_taupe/core/inherited_data/build_context_extensions.dart';
import 'package:tic_tac_taupe/core/theme/colors/app_color_theme_data.dart';
import 'package:tic_tac_taupe/core/theme/dependencies_injection.dart';
import 'package:tic_tac_taupe/core/theme/texts/app_text_theme_data.dart';
import 'package:tic_tac_taupe/core/widgets/gestures/app_pressable.dart';
import 'package:tic_tac_taupe/core/widgets/text/app_text.dart';

/// A button widget.
class AppButton extends StatelessWidget {
  const AppButton({
    super.key,
    this.text,
    this.onPressed,
    this.isSelected,
    this.type,
    this.size,
  });

  /// The text to display on the button.
  final String? text;

  /// The callback to invoke when the button is pressed.
  final VoidCallback? onPressed;

  /// Whether the button is in a selected state.
  final bool? isSelected;

  /// The type of the button.
  /// Defaults to [AppButtonType.primary].
  final AppButtonType? type;

  /// The size of the button.
  /// Defaults to [AppButtonSize.medium].
  final AppButtonSize? size;

  @override
  Widget build(BuildContext context) {
    return AppPressable(
      onPressed: onPressed,
      child: _Body(
        text: text,
        isSelected: isSelected ?? false,
        type: type ?? AppButtonType.primary,
        size: size ?? AppButtonSize.medium,
      ),
    );
  }
}

class _Body extends ConsumerWidget {
  const _Body({
    required this.text,
    required this.isSelected,
    required this.type,
    required this.size,
  });

  final String? text;
  final bool isSelected;
  final AppButtonType type;
  final AppButtonSize size;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colorTheme = ref.watch(colorThemeDataProvider);
    final textTheme = ref.watch(textThemeDataProvider);
    final states = context
        .maybeWatchInheritedData<AppInteractionStates>()
        ?.states;
    final isPressed = states?.contains(AppInteractionState.pressed) ?? false;
    final isHovered = states?.contains(AppInteractionState.hovered) ?? false;

    return AnimatedContainer(
      duration: const Duration(milliseconds: 100),
      foregroundDecoration: ShapeDecoration(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
          side: BorderSide(width: 4, color: type.borderColor(colorTheme)),
        ),
        color: () {
          if (isPressed) {
            return colorTheme.states.pressed;
          } else if (isHovered) {
            return colorTheme.states.hovered;
          } else {
            return null;
          }
        }(),
      ),
      decoration: ShapeDecoration(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        shadows: isPressed
            ? null
            : [
                BoxShadow(
                  blurRadius: 2,
                  color: colorTheme.shadow,
                  offset: const Offset(0, 1),
                ),
              ],
        color: isSelected
            ? colorTheme.success.base
            : type.backgroundColor(colorTheme),
      ),
      padding: size.padding,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        spacing: 12,
        children: [
          // Used to keep the text centered when the icon is not shown
          if (isSelected)
            const Opacity(
              opacity: 0,
              child: _SelectedIcon(),
            ),
          Flexible(
            child: AppText(
              text ?? '',
              style: size
                  .textStyle(textTheme)
                  .copyWith(
                    color: isSelected
                        ? colorTheme.success.on
                        : type.foregroundColor(colorTheme),
                  ),
              textAlign: TextAlign.center,
              borderColor: colorTheme.surface.onSurface,
              borderWidth: size.textBorderWidth,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          if (isSelected) const _SelectedIcon(),
        ],
      ),
    );
  }
}

class _SelectedIcon extends ConsumerWidget {
  const _SelectedIcon();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colorTheme = ref.watch(colorThemeDataProvider);

    return Icon(
      Icons.check,
      color: colorTheme.success.on,
      size: 24,
    );
  }
}

enum AppButtonType {
  primary,
  secondary;

  Color backgroundColor(AppColorThemeData colorTheme) {
    switch (this) {
      case AppButtonType.primary:
        return colorTheme.primary.base.base;
      case AppButtonType.secondary:
        return colorTheme.surface.surfaceVariant;
    }
  }

  Color foregroundColor(AppColorThemeData colorTheme) {
    switch (this) {
      case AppButtonType.primary:
        return colorTheme.primary.base.on;
      case AppButtonType.secondary:
        return colorTheme.surface.onSurface;
    }
  }

  Color borderColor(AppColorThemeData colorTheme) {
    switch (this) {
      case AppButtonType.primary:
        return colorTheme.surface.onSurface;
      case AppButtonType.secondary:
        return colorTheme.surface.borderVariant;
    }
  }
}

enum AppButtonSize {
  medium,
  large;

  TextStyle textStyle(AppTextThemeData textTheme) {
    switch (this) {
      case AppButtonSize.medium:
        return textTheme.label1;
      case AppButtonSize.large:
        return textTheme.label2;
    }
  }

  double get textBorderWidth {
    switch (this) {
      case AppButtonSize.medium:
        return 1.5;
      case AppButtonSize.large:
        return 4.0;
    }
  }

  EdgeInsets get padding {
    switch (this) {
      case AppButtonSize.medium:
        return const EdgeInsets.symmetric(vertical: 8, horizontal: 12);
      case AppButtonSize.large:
        return const EdgeInsets.symmetric(vertical: 8, horizontal: 24);
    }
  }
}
