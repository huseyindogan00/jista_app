import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ThemeApp extends GetxController {
  static Color bacgroundColorAPP = Color.fromARGB(255, 10, 48, 78);

  static final themeLight = ThemeData.light().copyWith(
    backgroundColor: bacgroundColorAPP,
    primaryColor: bacgroundColorAPP,
    iconTheme: const IconThemeData(color: Colors.black, size: 15),
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
    primaryIconTheme: const IconThemeData(color: Colors.white, size: 15),
    iconTheme: const IconThemeData(color: Colors.white, size: 15),
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
