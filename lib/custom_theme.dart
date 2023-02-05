import 'package:flutter/material.dart';

class CustomTheme {
  final Color _primaryColor = const Color(0xffc25eff);

  ThemeData _defaultTheme({
    required Color textColor,
    required Color iconColor,
  }) =>
      ThemeData(
        textTheme: TextTheme(
          headlineLarge: TextStyle(
            fontSize: 60,
            fontWeight: FontWeight.bold,
            color: textColor,
          ),
          headlineMedium: TextStyle(
            fontSize: 50,
            fontWeight: FontWeight.bold,
            color: textColor,
          ),
          headlineSmall: TextStyle(
            fontSize: 40,
            fontWeight: FontWeight.bold,
            color: textColor,
          ),
          bodyLarge: TextStyle(
            fontSize: 25,
            color: textColor,
          ),
          bodyMedium: TextStyle(
            fontSize: 20,
            color: textColor,
          ),
          bodySmall: TextStyle(
            fontSize: 15,
            color: textColor,
          ),
        ),
        iconTheme: IconThemeData(color: iconColor),
        textButtonTheme: TextButtonThemeData(
          style: TextButton.styleFrom(
            foregroundColor: Colors.white,
            backgroundColor: _primaryColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30.0),
            ),
            padding: const EdgeInsets.all(20),
          ),
        ),
      );

  ThemeData get lightTheme => _defaultTheme(
        textColor: Colors.black,
        iconColor: Colors.black,
      ).copyWith(
        backgroundColor: Colors.white,
        primaryColor: _primaryColor,
      );

  ThemeData get darkTheme => _defaultTheme(
        textColor: Colors.white,
        iconColor: Colors.white,
      ).copyWith(
        scaffoldBackgroundColor: const Color(0xff181818),
        primaryColor: _primaryColor,
      );
}
