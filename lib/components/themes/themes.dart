import 'package:flutter/material.dart';

ThemeData get lightTheme {
  final lightTheme = ThemeData.light();
  return lightTheme.copyWith(
    backgroundColor: Colors.white,
    colorScheme: lightTheme.colorScheme.copyWith(
      primary: Colors.teal,
    ),
  );
}

ThemeData get darkTheme {
  final darkTheme = ThemeData.dark();
  return darkTheme.copyWith(
    colorScheme: darkTheme.colorScheme.copyWith(
      primary: Colors.tealAccent,
    ),
  );
}
