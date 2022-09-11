import 'package:flutter/material.dart';

class ThemeApp {
  static ThemeData get themeData {
    return ThemeData(
      backgroundColor: Colors.white,
      primaryColor: Colors.red.shade700,
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(backgroundColor: Colors.amber),
      ),
      appBarTheme: AppBarTheme(
        color: Colors.red.shade700,
      ),
    );
  }
}
