import 'package:flutter/material.dart';
import 'package:jista/core/router/route_name.dart';
import 'package:jista/views/entry/view/entry_view.dart';
import 'package:jista/views/error/error_view.dart';
import 'package:jista/views/home/view/home_view.dart';
import 'package:jista/views/register/view/register_view.dart';
import '../../views/splash/view/splash_view.dart';

class RouteGenerator {
  static Route<dynamic>? routeGenerator(RouteSettings settings) {
    print(settings.name);
    switch (settings.name) {
      case RouteName.splashView:
        return _createRoute(SplashView());
      case RouteName.homeView:
        return _createRoute(const HomeView());
      case RouteName.entryView:
        return _createRoute(EntryView());
      case RouteName.registerView:
        return _createRoute(RegisterView());
      default:
        return _createRoute(const ErrorView());
    }
  }

  static _createRoute(Widget pageWidget) {
    return MaterialPageRoute(builder: (context) => pageWidget);
  }
}
