import 'package:flutter/rendering.dart';
import 'package:tic_tac_taupe/core/themes/colors/app_color_theme_data.dart';

/// A class that defines the different color themes available in the app.
class ColorThemes {
  const ColorThemes._();

  static const light = AppColorThemeData(
    surface: SurfaceColorThemeData(
      surface: Color(0xFFA24D0D),
      surfaceVariant: Color(0xFFFBD57E),
      onSurface: Color(0xFF692C08),
      border: Color(0xFFF79D2A),
      borderVariant: Color(0xFFBF701F),
    ),
    primary: PrimaryColorThemeData(
      base: ContrastedColor(
        base: Color(0xFFF68C03),
        on: Color(0xFFFFFFFF),
      ),
      variant: ContrastedColor(
        base: Color(0xFFFACC06),
        on: Color(0xFFFFFFFF),
      ),
    ),
    shadow: Color(0x99000000),
    states: StatesColorThemeData(
      hovered: Color(0x44F79D2A),
      pressed: Color(0x44BF701F),
    ),
    success: ContrastedColor(
      base: Color(0xFF70B416),
      on: Color(0xFFFFFFFF),
    ),
    error: ContrastedColor(
      base: Color(0xFFF63A3A),
      on: Color(0xFFFFFFFF),
    ),
  );
}
