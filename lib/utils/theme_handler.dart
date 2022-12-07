import 'package:flutter/material.dart';

class ThemeHandler {
  final lightTheme = ThemeData(
    scaffoldBackgroundColor: const Color(0xFFFFFFFF),
    primaryColor: Colors.blue,
    cardColor: const Color(0xFFF2FDFD),
    canvasColor: Colors.grey[50],
    buttonTheme: const ButtonThemeData().copyWith(
      colorScheme: const ColorScheme.light(),
    ),
    colorScheme: ThemeData().colorScheme.copyWith(
          secondary: const Color(0xFFE8FDFD),
          brightness: Brightness.light,
        ),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      selectedIconTheme: IconThemeData(color: Colors.black87),
      unselectedIconTheme: IconThemeData(color: Colors.black54),
    ),
  );

  final darkTheme = ThemeData(
    scaffoldBackgroundColor: const Color(0xFF00001a),
    primaryColor: Colors.blue,
    cardColor: const Color(0xFF0a0d2c),
    canvasColor: Colors.black,
    buttonTheme: const ButtonThemeData().copyWith(
      colorScheme: const ColorScheme.dark(),
    ),
    colorScheme: ThemeData().colorScheme.copyWith(
          secondary: const Color(0xFF1a1f3c),
          brightness: Brightness.dark,
        ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      selectedIconTheme: IconThemeData(color: Colors.lightBlue.shade200),
      unselectedIconTheme: const IconThemeData(color: Colors.white70),
    ),
  );
}
