import 'package:flutter/material.dart';

class CustomTheme {
  final Color _primaryColor = const Color(0xffc25eff);

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
          elevatedButtonTheme: ElevatedButtonThemeData(
            style: ElevatedButton.styleFrom(
              backgroundColor: textColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
            ),
          ),
          bottomNavigationBarTheme: const BottomNavigationBarThemeData(
            selectedIconTheme: IconThemeData(
              color: Colors.amber,
            ),
            unselectedIconTheme: IconThemeData(
              color: Colors.pink,
            ),
          )
          // iconTheme: IconThemeData(color: iconColor),
          // textButtonTheme: TextButtonThemeData(
          //   style: TextButton.styleFrom(
          //     foregroundColor: Colors.white,
          //     backgroundColor: _primaryColor,
          //     shape: RoundedRectangleBorder(
          //       borderRadius: BorderRadius.circular(30.0),
          //     ),
          //     padding: const EdgeInsets.all(20),
          //   ),
          // ),
          );

  ThemeData get lightTheme => _defaultTheme(
        textColor: Colors.black,
        iconColor: Colors.black,
        scaffoldBackgroundColor: Colors.white,
      ).copyWith(
        primaryColor: _primaryColor,
        // colorScheme: const ColorScheme(
        //   background: Colors.white,
        //   brightness: Brightness.light,
        //   primary: Colors.black,
        //   onPrimary: Colors.black,
        //   secondary: Colors.black,
        //   onSecondary: Colors.black,
        //   error: Colors.black,
        //   onError: Colors.black,
        //   onBackground: Colors.black,
        //   surface: Colors.black,
        //   onSurface: Colors.black,
        // ),
      );

  ThemeData get darkTheme => _defaultTheme(
        textColor: Colors.white,
        iconColor: Colors.white,
        scaffoldBackgroundColor: const Color(0xff181818),
      ).copyWith(
        primaryColor: _primaryColor,
      );
}
