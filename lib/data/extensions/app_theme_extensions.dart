import 'package:flutter/material.dart';
import 'package:hash_checker_2/data/models/app_theme.dart';

extension AppThemeToString on AppTheme {
  String get name {
    switch (this) {
      case AppTheme.system:
        return 'System';
      case AppTheme.light:
        return 'Light';
      case AppTheme.dark:
        return 'Dark';
    }
  }
}

extension AppThemeToThemeMode on AppTheme {
  ThemeMode get themeMode {
    switch (this) {
      case AppTheme.system:
        return ThemeMode.system;
      case AppTheme.light:
        return ThemeMode.light;
      case AppTheme.dark:
        return ThemeMode.dark;
    }
  }
}
