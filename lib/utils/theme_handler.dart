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
    appBarTheme: const AppBarTheme(
      foregroundColor: Colors.black,
      backgroundColor: Colors.white,
      elevation: 0,
    ),
    colorScheme: ThemeData().colorScheme.copyWith(
          secondary: const Color(0xFFE8FDFD),
          brightness: Brightness.light,
        ),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      selectedIconTheme: IconThemeData(color: Colors.black87),
      unselectedIconTheme: IconThemeData(color: Colors.black54),
    ),
    textSelectionTheme: const TextSelectionThemeData(
      cursorColor: Colors.grey,
    ),
    textTheme: const TextTheme(
      displayLarge: TextStyle(
        color: Colors.black87,
        fontSize: 30,
        fontWeight: FontWeight.bold,
      ),
      displayMedium: TextStyle(
        color: Colors.black87,
        fontSize: 24,
        fontWeight: FontWeight.bold,
      ),
      displaySmall: TextStyle(
        color: Colors.black87,
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
      headlineMedium: TextStyle(
        color: Colors.black87,
        fontSize: 18,
        fontWeight: FontWeight.bold,
      ),
      headlineSmall: TextStyle(
        color: Colors.black87,
        fontSize: 16,
        fontWeight: FontWeight.bold,
      ),
      titleLarge: TextStyle(
        color: Colors.black87,
        fontSize: 14,
        fontWeight: FontWeight.bold,
      ),
      bodyLarge: TextStyle(
        color: Colors.black87,
        fontSize: 16,
        fontWeight: FontWeight.normal,
      ),
      bodyMedium: TextStyle(
        color: Colors.black87,
        fontSize: 14,
        fontWeight: FontWeight.normal,
      ),
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
    appBarTheme: const AppBarTheme(
      foregroundColor: Colors.white,
      backgroundColor: Color(0xFF00001a),
      elevation: 0,
    ),
    colorScheme: ThemeData().colorScheme.copyWith(
          secondary: const Color(0xFF1a1f3c),
          brightness: Brightness.dark,
        ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      selectedIconTheme: IconThemeData(color: Colors.lightBlue.shade200),
      unselectedIconTheme: const IconThemeData(color: Colors.white70),
    ),
    textSelectionTheme: const TextSelectionThemeData(
      cursorColor: Colors.white,
    ),
    textTheme: TextTheme(
      displayLarge: TextStyle(
        color: Colors.grey[200],
        fontSize: 30,
        fontWeight: FontWeight.bold,
      ),
      displayMedium: TextStyle(
        color: Colors.grey[200],
        fontSize: 24,
        fontWeight: FontWeight.bold,
      ),
      displaySmall: TextStyle(
        color: Colors.grey[200],
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
      headlineMedium: TextStyle(
        color: Colors.grey[200],
        fontSize: 18,
        fontWeight: FontWeight.bold,
      ),
      headlineSmall: TextStyle(
        color: Colors.grey[200],
        fontSize: 16,
        fontWeight: FontWeight.bold,
      ),
      titleLarge: TextStyle(
        color: Colors.grey[200],
        fontSize: 14,
        fontWeight: FontWeight.bold,
      ),
      bodyLarge: TextStyle(
        color: Colors.grey[200],
        fontSize: 16,
        fontWeight: FontWeight.normal,
      ),
      bodyMedium: TextStyle(
        color: Colors.grey[200],
        fontSize: 14,
        fontWeight: FontWeight.normal,
      ),
    ),
  );
}
