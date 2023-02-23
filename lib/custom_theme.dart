import 'package:big_picture/constants/sizes.dart';
import 'package:flutter/material.dart';

class CustomTheme with Sizes {
  final Color _primaryColor = const Color.fromARGB(255, 4, 4, 4);

  ThemeData _defaultTheme({
    required Color textColor,
    required Color iconColor,
    required Color scaffoldBackgroundColor,
  }) =>
      ThemeData(
          useMaterial3: true,
          scaffoldBackgroundColor: scaffoldBackgroundColor,
          textTheme: TextTheme(
            headlineLarge: TextStyle(
              fontSize: size60,
              fontWeight: FontWeight.bold,
              color: textColor,
            ),
            headlineMedium: TextStyle(
              fontSize: size48 + size2,
              fontWeight: FontWeight.bold,
              color: textColor,
            ),
            headlineSmall: TextStyle(
              fontSize: size40,
              fontWeight: FontWeight.bold,
              color: textColor,
            ),
            bodyLarge: TextStyle(
              fontSize: size20 + size5,
              color: textColor,
            ),
            bodyMedium: TextStyle(
              fontSize: size20,
              color: textColor,
            ),
            bodySmall: TextStyle(
              fontSize: size10 + size5,
              color: textColor,
            ),
          ),
          cardTheme: CardTheme(
            color: scaffoldBackgroundColor,
          ),
          elevatedButtonTheme: ElevatedButtonThemeData(
            style: ElevatedButton.styleFrom(
              backgroundColor: textColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(size20),
              ),
            ),
          ),
          canvasColor: scaffoldBackgroundColor,
          bottomNavigationBarTheme: const BottomNavigationBarThemeData(
            selectedIconTheme: IconThemeData(
              color: Colors.amber,
            ),
            unselectedIconTheme: IconThemeData(
              color: Colors.pink,
            ),
          ));

  ThemeData get lightTheme => _defaultTheme(
        textColor: Colors.black,
        iconColor: Colors.black,
        scaffoldBackgroundColor: Colors.white,
      ).copyWith(
        primaryColor: _primaryColor,
      );

  ThemeData get darkTheme => _defaultTheme(
        textColor: Colors.white,
        iconColor: Colors.white,
        scaffoldBackgroundColor: const Color(0xff181818),
      ).copyWith(
        primaryColor: _primaryColor,
      );
}
