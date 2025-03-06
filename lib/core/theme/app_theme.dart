import 'package:flutter/material.dart';

class AppTheme {
  AppTheme._();

  static getApplicationTheme({required bool isDarkMode}) {
    return ThemeData(
      // Apply maroon/dark red theme for the app
      colorScheme: isDarkMode
          ? const ColorScheme.dark(
              primary: Color(0xFF800000), // Dark Maroon
              secondary: Color(0xFFB22222), // Firebrick Red
            )
          : const ColorScheme.light(
              primary: Color(0xFFB22222), // Firebrick Red
              secondary: Color(0xFF8B0000), // Dark Red
            ),
      brightness: isDarkMode ? Brightness.dark : Brightness.light,
      fontFamily: 'Montserrat',
      useMaterial3: true,

      // Change AppBar theme
      appBarTheme: const AppBarTheme(
        elevation: 0,
        backgroundColor: Color(0xFF800000), // Maroon
        centerTitle: true,
        titleTextStyle: TextStyle(
          color: Colors.white,
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),

      // Change ElevatedButton theme
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          elevation: 2,
          foregroundColor: Colors.white,
          backgroundColor: Color(0xFFB22222), // Firebrick Red
          textStyle: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
      ),

      // Change TextField theme
      inputDecorationTheme: const InputDecorationTheme(
        contentPadding: EdgeInsets.all(15),
        border: OutlineInputBorder(),
        labelStyle: TextStyle(
          fontSize: 18,
          color: Color(0xFF8B0000), // Dark Red
        ),
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.redAccent,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Color(0xFFB22222), // Firebrick Red
          ),
        ),
      ),
      // Circular Progress Indicator Theme
      progressIndicatorTheme: const ProgressIndicatorThemeData(
        color: Color(0xFFB22222), // Firebrick Red
      ),

      // Bottom Navigation Bar Theme
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        backgroundColor: Color(0xFF800000), // Maroon
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.black54,
        type: BottomNavigationBarType.fixed,
        elevation: 0,
      ),
    );
  }
}
