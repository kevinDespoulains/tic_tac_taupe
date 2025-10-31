import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:tic_tac_taupe/core/themes/colors/app_color_theme_data.dart';
import 'package:tic_tac_taupe/core/themes/colors/app_color_themes.dart';
import 'package:tic_tac_taupe/core/themes/texts/app_text_theme_data.dart';
import 'package:tic_tac_taupe/core/themes/texts/app_text_themes.dart';

part 'dependencies_injection.g.dart';

/// Provides the app's color theme data.
@riverpod
AppColorThemeData colorThemeData(Ref ref) {
  return ColorThemes.light;
}

/// Provides the app's text theme data.
@riverpod
AppTextThemeData textThemeData(Ref ref) {
  return TextThemes.standard;
}
