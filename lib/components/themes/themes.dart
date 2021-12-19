import 'package:flutter/material.dart';

ThemeData get lightTheme {
  final lightTheme = ThemeData.light();
  return lightTheme.copyWith(
    colorScheme: lightTheme.colorScheme.copyWith(
      primary: Colors.teal,
    ),
  );
}

ThemeData get darkTheme {
  final lightTheme = ThemeData.dark();
  return lightTheme.copyWith(
    colorScheme: lightTheme.colorScheme.copyWith(
      primary: Colors.tealAccent,
    ),
  );
}
