import 'package:flutter/material.dart';

final _colorScheme = ColorScheme.fromSeed(seedColor: Colors.white);

ThemeData lightTheme() {
  return ThemeData(
    useMaterial3: true,
    colorScheme: _colorScheme,
    brightness: Brightness.light,
    inputDecorationTheme: InputDecorationTheme(
      isDense: true,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(4),
      ),
    ),
    textButtonTheme: TextButtonThemeData(
      style: ButtonStyle(
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(4),
          ),
        ),
      ),
    ),
    textTheme: TextTheme(
      titleSmall: TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w500,
        color: _colorScheme.primary,
      ),
    ),
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: _colorScheme.primary,
      foregroundColor: _colorScheme.onPrimary,
    ),
    appBarTheme: AppBarTheme(
      backgroundColor: _colorScheme.primary,
      foregroundColor: _colorScheme.onPrimary,
      iconTheme: IconThemeData(
        color: _colorScheme.onPrimary,
      ),
    ),
  );
}
