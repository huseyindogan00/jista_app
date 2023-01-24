import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ThemeApp extends GetxController {
  static Color bacgroundColorAPP = Color.fromARGB(255, 25, 72, 110);
  static Color bottomAppBarColor = const Color.fromARGB(255, 7, 44, 4);

  static final themeLight = ThemeData.light().copyWith(
    backgroundColor: bacgroundColorAPP,
    splashColor: Colors.transparent,
    bottomAppBarColor: bottomAppBarColor,
    primaryIconTheme: const IconThemeData(
      color: Color.fromARGB(255, 19, 18, 59),
    ),
    textTheme: const TextTheme(
      bodyText1: TextStyle(
        color: Colors.white,
        fontWeight: FontWeight.bold,
        fontFamily: 'Montserrat',
        fontSize: 14,
      ),
      headline6: TextStyle(
        color: Color.fromARGB(255, 10, 7, 7),
        fontFamily: 'Montserrat',
        fontSize: 16,
        fontWeight: FontWeight.bold,
      ),
      headline5: TextStyle(
        color: Colors.white,
        fontFamily: 'Montserrat',
        fontSize: 18,
        fontWeight: FontWeight.w700,
      ),
      headline4: TextStyle(
        color: Color.fromARGB(255, 24, 23, 23),
        fontFamily: 'Montserrat',
        fontSize: 20,
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

  /* static final themeDark = ThemeData.dark().copyWith(
    /** DARK THEME DE GÜCELLEMELER YAPILACAK */
    splashColor: const Color.fromARGB(255, 203, 206, 209),
    primaryColor: Colors.black,
    primaryIconTheme: const IconThemeData(
      color: Color.fromARGB(255, 52, 50, 173),
    ),
    textTheme: TextTheme(
      bodyText1: const TextStyle().copyWith(fontSize: 14),
      headline6: const TextStyle(
        color: Colors.white,
        fontFamily: 'Montserrat',
        fontSize: 16,
        fontWeight: FontWeight.w700,
      ),
      headline5: const TextStyle(
        color: Colors.white,
        fontFamily: 'Montserrat',
        fontSize: 18,
        fontWeight: FontWeight.w700,
      ),
      headline4: const TextStyle(
        color: Color.fromARGB(255, 238, 232, 232),
        fontFamily: 'Montserrat',
        fontSize: 20,
        fontWeight: FontWeight.w700,
      ),
    ),
  ); */

  var isDarkModeApp = (Get.isPlatformDarkMode ? true : false).obs;
}
