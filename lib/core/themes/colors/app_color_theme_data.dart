import 'package:flutter/widgets.dart';

/// A class that holds the color theming data for the app.
class AppColorThemeData {
  const AppColorThemeData({
    required this.surface,
    required this.primary,
    required this.states,
    required this.shadow,
    required this.success,
    required this.error,
  });

  final SurfaceColorThemeData surface;
  final PrimaryColorThemeData primary;
  final StatesColorThemeData states;
  final Color shadow;
  final ContrastedColor success;
  final ContrastedColor error;
}

class SurfaceColorThemeData {
  const SurfaceColorThemeData({
    required this.surface,
    required this.surfaceVariant,
    required this.onSurface,
    required this.border,
    required this.borderVariant,
  });

  final Color surface;
  final Color surfaceVariant;
  final Color onSurface;
  final Color border;
  final Color borderVariant;
}

class PrimaryColorThemeData {
  const PrimaryColorThemeData({
    required this.base,
    required this.variant,
  });

  final ContrastedColor base;
  final ContrastedColor variant;
}

class StatesColorThemeData {
  const StatesColorThemeData({
    required this.hovered,
    required this.pressed,
  });

  final Color hovered;
  final Color pressed;
}

class ContrastedColor {
  const ContrastedColor({
    required this.base,
    required this.on,
  });

  final Color base;
  final Color on;
}
