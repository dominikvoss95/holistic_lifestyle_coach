import 'package:flutter/material.dart';

class AppTheme {
  // Define a MaterialColor based on your eucalyptus green color
  static const MaterialColor eucalyptusGreen = MaterialColor(
    0xFF2d3a2d, // Primary value
    <int, Color>{
      50: Color(0xFFE0E5E0),
      100: Color(0xFFB3BDB3),
      200: Color(0xFF809080),
      300: Color(0xFF4D604D),
      400: Color(0xFF264026),
      500: Color(0xFF2d3a2d), // Main color
      600: Color(0xFF253325),
      700: Color(0xFF1C2C1C),
      800: Color(0xFF132613),
      900: Color(0xFF0A1F0A),
    },
  );

  static ThemeData eucalyptusTheme = ThemeData(
    primarySwatch: eucalyptusGreen, // Use custom MaterialColor
    primaryColor: const Color(0xff2d3a2d), // Eucalyptus green
    colorScheme: ColorScheme.fromSwatch().copyWith(
      primary: const Color(0xff2d3a2d), // Eucalyptus green
      secondary: const Color(0xff2d3a2d), // Eucalyptus green for accents
    ),
    scaffoldBackgroundColor: const Color(0xFFF0F8F5), // Light green background
    buttonTheme: const ButtonThemeData(
      buttonColor: Color(0xff2d3a2d), // Eucalyptus green for buttons
      textTheme: ButtonTextTheme.primary,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color(0xff2d3a2d), // Eucalyptus green
      ),
    ),
    appBarTheme: const AppBarTheme(
      backgroundColor: Color(0xff87ad94), // Eucalyptus green AppBar
      elevation: 0,
      titleTextStyle: TextStyle(
        color: Colors.white,
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
    ),
    textTheme: const TextTheme(
      headlineSmall: TextStyle(
        color: Colors.black,
        fontWeight: FontWeight.bold,
        fontSize: 20,
      ),
      bodyMedium: TextStyle(
        color: Colors.black87,
        fontSize: 16,
      ),
    ),
  );
}
