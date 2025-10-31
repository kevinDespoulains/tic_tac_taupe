import 'package:flutter/painting.dart';

/// A class that holds the text theming data for the app.
class AppTextThemeData {
  const AppTextThemeData({
    required this.title1,
    required this.title2,
    required this.body,
    required this.label1,
    required this.label2,
  });

  final TextStyle title1;
  final TextStyle title2;
  final TextStyle body;
  final TextStyle label1;
  final TextStyle label2;
}
