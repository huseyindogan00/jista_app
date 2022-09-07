import 'package:flutter/material.dart';
import 'package:jista/view/entry_view.dart';
import 'package:jista/view/error_view.dart';
import 'package:jista/view/home_view.dart';
import 'package:jista/view/register_view.dart';

class RouteGenerator {
  static Route<dynamic>? routeGenerator(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return _createRoute(HomePage());
      /* case '/homePage':
        return _createRoute(const HomePage()); */
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
