import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ThemeApp extends GetxController {
  static Color bacgroundColorAPP = Color.fromARGB(255, 10, 48, 78);

  static final themeLight = ThemeData.light().copyWith(
    backgroundColor: bacgroundColorAPP,
    splashColor: Colors.blueGrey.shade600,
    primaryIconTheme: const IconThemeData(
      color: Color.fromARGB(255, 19, 18, 59),
    ),
    textTheme: const TextTheme(
      headline6: TextStyle(
        color: Color.fromARGB(255, 10, 7, 7),
        fontFamily: 'Montserrat',
        fontSize: 16,
        fontWeight: FontWeight.w700,
      ),
      headline5: TextStyle(
        color: Colors.white,
        fontFamily: 'Montserrat',
        fontSize: 18,
        fontWeight: FontWeight.w700,
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(backgroundColor: Colors.amber),
    ),
    appBarTheme: AppBarTheme(
      color: bacgroundColorAPP,
    ),
  );

  static final themeDark = ThemeData.dark().copyWith(
    /** DARK THEME DE GÜCELLEMELER YAPILACAK */
    splashColor: const Color.fromARGB(255, 203, 206, 209),
    primaryIconTheme: const IconThemeData(
      color: Color.fromARGB(255, 52, 50, 173),
    ),
    textTheme: const TextTheme(
      headline6: TextStyle(
        color: Colors.white,
        fontFamily: 'Montserrat',
        fontSize: 16,
        fontWeight: FontWeight.w700,
      ),
      headline5: TextStyle(
        color: Colors.white,
        fontFamily: 'Montserrat',
        fontSize: 18,
        fontWeight: FontWeight.w700,
      ),
    ),
  );

  var isDarkModeApp = (Get.isPlatformDarkMode ? true : false).obs;
}
