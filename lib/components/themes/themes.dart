import 'package:flutter/material.dart';

ThemeData get lightTheme {
  final lightTheme = ThemeData.light();
  return lightTheme.copyWith(
    backgroundColor: Colors.white,
    colorScheme: lightTheme.colorScheme.copyWith(
      primary: Colors.teal,
    ),
    snackBarTheme: const SnackBarThemeData(
      actionTextColor: Colors.teal,
    ),
  );
}

ThemeData get darkTheme {
  final darkTheme = ThemeData.dark();
  return darkTheme.copyWith(
    colorScheme: darkTheme.colorScheme.copyWith(
      primary: Colors.tealAccent,
    ),
    snackBarTheme: SnackBarThemeData(
      backgroundColor: darkTheme.backgroundColor,
      actionTextColor: Colors.tealAccent,
      contentTextStyle: const TextStyle(
        color: Colors.white,
      ),
    ),
  );
}
