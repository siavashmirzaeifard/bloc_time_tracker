import 'package:flutter/material.dart';

import '/utility/constants.dart';

enum AppTheme {
  lightTheme,
  darkTheme,
}

final appThemeData = {
  AppTheme.lightTheme: ThemeData(
    brightness: Brightness.light,
    colorScheme: const ColorScheme.light(),
  ),
  AppTheme.darkTheme: ThemeData(
    brightness: Brightness.dark,
    scaffoldBackgroundColor: veryDarkBlueColor,
    colorScheme: const ColorScheme.dark(),
  ),
};
