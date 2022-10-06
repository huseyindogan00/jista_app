import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ThemeApp extends GetxController {
  static Color bacgroundColorAPP = const Color.fromARGB(255, 6, 90, 13).withBlue(44);

  static final themeLight = ThemeData.light().copyWith(
    backgroundColor: Colors.white,
    primaryColor: bacgroundColorAPP,
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(backgroundColor: Colors.amber),
    ),
    appBarTheme: AppBarTheme(
      color: bacgroundColorAPP,
    ),
  );

  static final themeDark = ThemeData.dark().copyWith(
      /** DARK THEME DE GÜCELLEMELER YAPILACAK */
      );

  var isDarkModeApp = (Get.isPlatformDarkMode ? true : false).obs;
}
