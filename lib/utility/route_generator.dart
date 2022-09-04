import 'package:flutter/material.dart';
import 'package:jista/view/entry_page.dart';
import 'package:jista/view/error_page.dart';
import 'package:jista/view/home_page.dart';
import 'package:jista/view/register_page.dart';

class RouteGenerator {
  static Route<dynamic>? routeGenerator(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        print('açılış sayfasına geldi');
        return _createRoute(EntryPage());
      case '/homePage':
        return _createRoute(const HomePage());
      case '/registerPage':
        return _createRoute(RegisterPage());
      default:
        return _createRoute(const ErrorPage());
    }
  }

  static _createRoute(Widget pageWidget) {
    return MaterialPageRoute(builder: (context) => pageWidget);
  }
}
