import 'package:flutter/rendering.dart';
import 'package:tic_tac_taupe/core/theme/texts/app_text_theme_data.dart';

/// A class that defines the different text themes available in the app.
class TextThemes {
  const TextThemes._();

  static const standard = AppTextThemeData(
    title1: TextStyle(
      fontSize: 32,
      decoration: TextDecoration.none,
      fontWeight: FontWeight.w800,
    ),
    title2: TextStyle(
      fontSize: 20,
      fontWeight: FontWeight.w700,
      decoration: TextDecoration.none,
    ),
    body: TextStyle(
      fontSize: 16,
      decoration: TextDecoration.none,
      fontWeight: FontWeight.w700,
    ),
    label1: TextStyle(
      fontSize: 20,
      decoration: TextDecoration.none,
      fontWeight: FontWeight.w700,
    ),
    label2: TextStyle(
      fontSize: 28,
      decoration: TextDecoration.none,
      fontWeight: FontWeight.w700,
    ),
  );
}
